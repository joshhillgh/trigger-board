# Serves the Trigger Board at http://localhost:8787/ from this project's
# dashboard folder, and handles the one-time setup page (POST /setup writes
# your details into CLAUDE.md and saves your playbook locally).
# Started by start-dashboard.bat; safe to run twice (if the port is already
# serving, it just opens the browser). Listens on localhost only.
param([int]$Port = 8787)
$Root    = Join-Path $PSScriptRoot "dashboard"
$Project = $PSScriptRoot
$Url     = "http://localhost:$Port/"

# First run (no playbook yet) lands on setup; otherwise straight to the board.
function Get-LandingPath {
  if (Test-Path (Join-Path $Project "playbook.docx")) { "dashboard.html" } else { "setup.html" }
}

# Already running? Then just open the browser.
try {
  $probe = Invoke-WebRequest -Uri ($Url + "dashboard.html") -UseBasicParsing -TimeoutSec 2
  if ($probe.StatusCode -eq 200) { Start-Process ($Url + (Get-LandingPath)); exit }
} catch { }

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($Url)
try { $listener.Start() } catch {
  # Port taken by something that isn't the board.
  Write-Error "Port $Port is in use by another program. Close it or change the port in serve-dashboard.ps1."
  exit 1
}

Start-Process ($Url + (Get-LandingPath))

function Indent-Value([string]$v) {
  # SETUP block values are indented 4 spaces; continuation lines 6.
  if ([string]::IsNullOrWhiteSpace($v)) { return "<not set>" }
  ($v -replace "`r`n", "`n") -replace "`n", "`n      "
}

function Save-Setup($data) {
  $claudeMd = Join-Path $Project "CLAUDE.md"
  if (-not (Test-Path $claudeMd)) { throw "CLAUDE.md not found next to serve-dashboard.ps1." }

  if ([string]::IsNullOrWhiteSpace($data.name) -or [string]::IsNullOrWhiteSpace($data.territory)) {
    throw "Name and territory are required."
  }

  # Optional playbook: base64-encoded .docx, saved to the project root only.
  if ($data.playbookBase64) {
    $bytes = [Convert]::FromBase64String($data.playbookBase64)
    if ($bytes.Length -gt 20MB) { throw "Playbook is over 20 MB." }
    # .docx files are zip archives: PK header.
    if ($bytes.Length -lt 4 -or $bytes[0] -ne 0x50 -or $bytes[1] -ne 0x4B) {
      throw "That file doesn't look like a .docx."
    }
    [System.IO.File]::WriteAllBytes((Join-Path $Project "playbook.docx"), $bytes)
  }

  $today = (Get-Date).ToString("yyyy-MM-dd")
  $setup = @"
<!-- SETUP:BEGIN -->
## SETUP

    MY NAME: $(Indent-Value $data.name)
    MY ROLE: $(Indent-Value $data.role)
    MY COMPANY: Insight AI (formerly Amdaris, part of Insight Enterprises)
    WHAT WE SELL: Applied AI and enterprise-grade software delivery.
      Rapid AI (5-day prototype plus ROI model and scaling roadmap),
      AI Centre of Excellence, Data Solutions, AI SDLC, Extended Teams /
      UK security-cleared developers, Health Check. Bestshore delivery
      from Romania, Moldova, Bulgaria, Ukraine plus UK onshore SC-cleared
      teams. See the 2-pagers and service catalogue if attached.
    MY TERRITORY / SECTOR: $(Indent-Value $data.territory)
    WHAT COUNTS AS A WIN: $(Indent-Value $data.win)

    REVENUE FLOOR: $(Indent-Value $data.floor)
    REVENUE CEILING: $(Indent-Value $data.ceiling)
    DISQUALIFIERS: $(Indent-Value $data.disq)

    PRIMARY NEWS SOURCE: $(Indent-Value $data.primary)
    ITS URL PATTERN: $(Indent-Value $data.pattern)
    SUPPLEMENTARY SOURCES: $(Indent-Value $data.supp)
    TARGET ENTRY PERSONAS: $(Indent-Value $data.personas)
    SEQUENCES: A = new technical leader (2 to 10 weeks in post).
      B = core-system (e.g. ERP) or modernisation programme, new site,
      acquisition, capex. C = public AI statement or stalled pilot
      (Rapid AI play). D = fit only, no trigger (low volume).
    CONTACT / JOB-CHANGE ALERT TOOL: LinkedIn Sales Navigator (plus Cognism)
    CRM: Salesforce, not connected here, so output paste-ready blocks

### The revenue band

Set via the setup page on $today. Floor: $(Indent-Value $data.floor).
Ceiling: $(Indent-Value $data.ceiling). Accounts between the floor and the
playbook's primary band are flagged on every card and in every report.
Do not call the band unresolved in reports or banners.
<!-- SETUP:END -->
"@

  $md = [System.IO.File]::ReadAllText($claudeMd)
  $pattern = '(?s)<!-- SETUP:BEGIN -->.*?<!-- SETUP:END -->'
  if ($md -notmatch $pattern) { throw "SETUP markers not found in CLAUDE.md." }
  $md = [regex]::Replace($md, $pattern, { param($m) $setup })
  [System.IO.File]::WriteAllText($claudeMd, $md, (New-Object System.Text.UTF8Encoding $false))
}

$mime = @{ ".html"="text/html; charset=utf-8"; ".js"="text/javascript; charset=utf-8"; ".css"="text/css"; ".json"="application/json"; ".png"="image/png"; ".svg"="image/svg+xml"; ".ico"="image/x-icon" }
while ($listener.IsListening) {
  $ctx = $listener.GetContext()
  $req = $ctx.Request
  $path = $req.Url.AbsolutePath.TrimStart('/')
  try {
    if ($req.HttpMethod -eq "POST" -and $path -eq "setup") {
      $reader = New-Object System.IO.StreamReader($req.InputStream, $req.ContentEncoding)
      $body = $reader.ReadToEnd()
      $reader.Close()
      $resp = ""
      try {
        Save-Setup (ConvertFrom-Json $body)
        $resp = '{"ok":true}'
      } catch {
        $ctx.Response.StatusCode = 400
        $resp = '{"ok":false,"error":' + (ConvertTo-Json ([string]$_.Exception.Message)) + '}'
      }
      $out = [System.Text.Encoding]::UTF8.GetBytes($resp)
      $ctx.Response.ContentType = "application/json"
      $ctx.Response.OutputStream.Write($out, 0, $out.Length)
    }
    elseif ([string]::IsNullOrEmpty($path)) {
      $ctx.Response.Redirect("/" + (Get-LandingPath))
    }
    else {
      $file = Join-Path $Root $path
      $full = [System.IO.Path]::GetFullPath($file)
      if ($full.StartsWith([System.IO.Path]::GetFullPath($Root)) -and (Test-Path $full -PathType Leaf)) {
        $bytes = [System.IO.File]::ReadAllBytes($full)
        $ext = [System.IO.Path]::GetExtension($full).ToLower()
        if ($mime.ContainsKey($ext)) { $ctx.Response.ContentType = $mime[$ext] }
        $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
      } else {
        $ctx.Response.StatusCode = 404
      }
    }
  } catch { try { $ctx.Response.StatusCode = 500 } catch { } }
  $ctx.Response.Close()
}
