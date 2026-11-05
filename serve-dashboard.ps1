# Serves the Trigger Board at http://localhost:8787/ from this project's
# dashboard folder. Started by start-dashboard.bat; safe to run twice (if the
# port is already serving, it just opens the browser).
$Port = 8787
$Root = Join-Path $PSScriptRoot "dashboard"
$Url  = "http://localhost:$Port/"

# Already running? Then just open the board.
try {
  $probe = Invoke-WebRequest -Uri ($Url + "dashboard.html") -UseBasicParsing -TimeoutSec 2
  if ($probe.StatusCode -eq 200) { Start-Process ($Url + "dashboard.html"); exit }
} catch { }

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($Url)
try { $listener.Start() } catch {
  # Port taken by something that isn't the board.
  Write-Error "Port $Port is in use by another program. Close it or change `$Port in serve-dashboard.ps1."
  exit 1
}

Start-Process ($Url + "dashboard.html")

$mime = @{ ".html"="text/html; charset=utf-8"; ".js"="text/javascript; charset=utf-8"; ".css"="text/css"; ".json"="application/json"; ".png"="image/png"; ".svg"="image/svg+xml"; ".ico"="image/x-icon" }
while ($listener.IsListening) {
  $ctx = $listener.GetContext()
  $path = $ctx.Request.Url.AbsolutePath.TrimStart('/')
  if ([string]::IsNullOrEmpty($path)) { $path = "dashboard.html" }
  $file = Join-Path $Root $path
  try {
    $full = [System.IO.Path]::GetFullPath($file)
    if ($full.StartsWith([System.IO.Path]::GetFullPath($Root)) -and (Test-Path $full -PathType Leaf)) {
      $bytes = [System.IO.File]::ReadAllBytes($full)
      $ext = [System.IO.Path]::GetExtension($full).ToLower()
      if ($mime.ContainsKey($ext)) { $ctx.Response.ContentType = $mime[$ext] }
      $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    } else {
      $ctx.Response.StatusCode = 404
    }
  } catch { $ctx.Response.StatusCode = 500 }
  $ctx.Response.Close()
}
