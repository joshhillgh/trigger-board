# Trigger Board

A weekly buying-trigger sweep plus a local dashboard, run entirely by
Claude Code. The sweep walks dated news sources for your territory, filters
what it finds against your ICP, and hands back a ranked, workable account
list with sources, decay windows, entry personas and paste-ready outreach
drafts. The dashboard renders it at `http://localhost:8787`.

Built to be honest rather than impressive: every trigger needs an exact
date and a working source URL, thin weeks report as thin weeks, and
company misfortune is never used.

## Setup (once)

1. Clone or download this repo into a **synced folder** (OneDrive), so a
   laptop reset can't take your data with it.
2. Open `CLAUDE.md` and fill in the `SETUP` block: your name, territory,
   revenue band, news sources, personas and sequences.
3. Drop your sales playbook into the project root as `playbook.docx`.
   The sweep follows it rather than improvising. It is gitignored, so it
   stays local.
4. (Optional) Add your case studies to `dashboard/data.js` under
   `caseStudies` — the board matches them to accounts by tag. Claude never
   invents these.

## Run

- **The sweep:** open the folder in Claude Code and type
  `Run this week's buying-trigger sweep per CLAUDE.md.`
  It writes `runs/YYYY-MM-DD.md`, updates `account-log.md`, and
  regenerates `dashboard/data.js`.
- **The board:** double-click `start-dashboard.bat`. It starts a small
  local server on port 8787 and opens the board in your browser. No
  installs needed — it is plain PowerShell.

## What stays local

Your pipeline is yours. `playbook.docx`, `collateral/` and `runs/` are
gitignored. `account-log.md` and `dashboard/data.js` ship as empty
templates — after your first sweep they contain your accounts, so **don't
commit or push them back to the shared repo**. If you want version history
for your own data, keep it on a private branch or a fork.

## Files

| File | What it is |
| --- | --- |
| `CLAUDE.md` | The sweep's instructions: setup, trigger windows, ICP filter, output format |
| `playbook.docx` | Your signed-off positioning (you supply this; gitignored) |
| `account-log.md` | Durable account memory, updated every run |
| `runs/` | One dated report per sweep (gitignored) |
| `dashboard/dashboard.html` | The board. Never changes |
| `dashboard/data.js` | All board content. Regenerated every sweep |
| `serve-dashboard.ps1` / `start-dashboard.bat` | Local server + launcher |

Status dropdowns and notes on the board are saved in your browser
(localStorage), not in files — anything that matters long-term belongs in
`account-log.md` or your CRM.
