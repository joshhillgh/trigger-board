# Weekly buying-trigger sweep — Insight AI

## How to run

Type: `Run this week's buying-trigger sweep per CLAUDE.md.`

Read `playbook.docx` and `account-log.md` first. Write the report to
`runs/YYYY-MM-DD.md` and update `account-log.md` with anything new.

Requires WebSearch and WebFetch. Allowlist at minimum your primary news
source plus `find-and-update.company-information.service.gov.uk` and your
regional business press. Without web access this sweep cannot do its
primary job.

---

<!-- SETUP:BEGIN -->
## SETUP — fill this in on the setup page (start-dashboard.bat opens it), or by hand

    MY NAME: <your name — set on the setup page>
    MY ROLE: <your role and the signature you send under>
    MY COMPANY: Insight AI (formerly Amdaris, part of Insight Enterprises)
    WHAT WE SELL: Applied AI and enterprise-grade software delivery.
      Rapid AI (5-day prototype plus ROI model and scaling roadmap),
      AI Centre of Excellence, Data Solutions, AI SDLC, Extended Teams /
      UK security-cleared developers, Health Check. Bestshore delivery
      from Romania, Moldova, Bulgaria, Ukraine plus UK onshore SC-cleared
      teams. See the 2-pagers and service catalogue if attached.
    MY TERRITORY / SECTOR: <your industry — e.g. UK manufacturing,
      UK retail, UK financial services>
    WHAT COUNTS AS A WIN: company expanding quickly, publicly investing
      in something that will lead to software, data or AI requirements

    REVENUE FLOOR: <hard floor, e.g. £30m. Resolve this with your playbook
      owner and record the decision here — do not leave it ambiguous>
    REVENUE CEILING: <e.g. £500m; above it, report as Tier 1, different play>
    DISQUALIFIERS: <e.g. companies based outside the UK, or whose parent
      is, subject to the foreign-parent/local-autonomy test below>

    PRIMARY NEWS SOURCE: <the one dated source for YOUR industry that the
      sweep walks every run — e.g. a daily sector news digest. Every
      industry has one; ask Claude to suggest one on your first sweep.>
    ITS URL PATTERN: <the literal URL pattern, with an example.
      Note publishing days — weekdays only is common.>
    SUPPLEMENTARY SOURCES: <regional business press, sector associations,
      public-funding announcements, vendor customer-story pages>
    TARGET ENTRY PERSONAS: CIO / IT Director / Head of IT; Head of
      Systems / Digital / Operations Technology; Head of Data / Analytics /
      BI; CTO / Head of Engineering. Not the CEO or MD unless nothing
      else exists.
    SEQUENCES: A = new technical leader (2 to 10 weeks in post).
      B = core-system (e.g. ERP) or modernisation programme, new site,
      acquisition, capex. C = public AI statement or stalled pilot
      (Rapid AI play). D = fit only, no trigger (low volume).
    CONTACT / JOB-CHANGE ALERT TOOL: LinkedIn Sales Navigator (plus Cognism)
    CRM: Salesforce, not connected here, so output paste-ready blocks

### The revenue band

Record the agreed band here once it is resolved, including how to treat
accounts between the floor and your playbook's primary band (flag them on
every card), and what comes off the table above the ceiling. Do not let
reports call the band unresolved once it isn't.
<!-- SETUP:END -->

---

## The job

Find accounts showing dated, sourced, in-window buying triggers, filter
them hard against the ICP, and hand back a ranked, workable list. Built to
be honest rather than impressive. A thin week must report as a thin week.

### First: load the playbook

Read `playbook.docx` and follow it rather than improvising, because the
positioning in it is signed off. If it isn't present, say so plainly
before doing anything else and ask for it. Do not invent an ICP.

Check `account-log.md`'s "last updated" date against today. If it is more
than a few weeks stale, say so in the report rather than treating it as
current.

### Primary method — walk the dated source

Fetch every edition of the primary source for the last 7 days, on the days
it publishes. A missing edition means nothing was published, so move on
and don't retry. Today's edition may not exist yet if running early; note
it and move on.

Then supplement with targeted searches across the supplementary sources:
regional and national business press, industry association and
public-funding announcements, and the customer-story or press pages of
major software and systems vendors serving the sector.

### Trigger types and decay windows (measured from today)

| Trigger | Window | Note |
| --- | --- | --- |
| Core operational system programme announced or in flight | 0 to 6 months | The system that runs their operation. Usable again near cutover, when surrounding work gets squeezed |
| Acquisition, MBO, new ownership, new site, reshoring, major capex | 0 to 6 months | Integration work lands 3 to 9 months after announcement |
| Named transformation or modernisation programme | 0 to 6 months | The mandate exists; the job is capacity, not persuasion |
| Public AI statement, innovation announcement, pilot with no production story | 0 to 12 months | The older with no production story, the stronger the stalled-pilot angle |
| Grant, public funding or programme involvement | 0 to 6 months | Pairs well with a named programme |
| Technical leadership change | 2 to 10 weeks after start date | Under two weeks they aren't in post. Past six months it looks like list-scraping |
| Hiring activity | No window | Confirming only |

Do NOT source from job adverts. Hiring raises the score of an account
already held, it is never the reason for the email. Job-posting triggers
were tested at scale and dropped.

### ICP filter — apply before anything reaches the report

Judgement calls to make explicitly, never silently:

- Adjacent business types are not the target. If a well-triggered company
  is one, say so and mark it ICP-marginal rather than quietly including it.
- Small specialists often trip excellent technology triggers but sit below
  the floor. Report them in a separate "below the floor" note.
- Above the ceiling: report it, mark it clearly as a different play
  requiring a different pitch, and say which parts of the offer come off
  the table at that size.
- Foreign parent, local autonomy: where a company has an overseas parent
  but its own managing director, own financing and own capital programme,
  don't disqualify silently. Report it and name the question that decides
  it, which is whether systems and spend authority sit locally or with the
  parent. Say to ask that on the first call.
- Two or more red flags with no strong green flag: say so plainly and
  recommend deprioritising. Disqualifying fast is the point of an ICP.

### Absolute rules

- Never invent a company, trigger, date, person or URL. A short honest
  report beats a padded one.
- Every trigger needs a specific date AND a working source URL. No date
  means it does not go in the report. Never round "recently" into a month.
- Never report anything involving misfortune, including closures,
  redundancies, fires, incidents, accidents, insolvency and distress
  sales. No exceptions; these can never be referenced in outreach. If a
  misfortune story dominated the week, note that in the coverage section
  so the week is known to have been fully read, but keep it out of the
  report.
- If the week is thin, say so. One or two real accounts is a normal week.
  Zero is a legitimate result. Never pad to hit a number.
- Cite everything. These get defended on a call.
- Say what could not be verified. A gap stated plainly is useful; a gap
  papered over is a live grenade on a discovery call.
- Aggregator data is indicative, not primary. Contact and revenue
  estimates from scraper sites are usable, but label them as such and say
  to verify before anything is sent.

### Output

**Carry-forward table** first, if `account-log.md` has prior accounts:
recompute days-old and days-of-window-remaining, flag any close to
decaying. Do not re-research them.

**Section 1 — Sequence-eligible.** Dated, sourced, in-window trigger that
passes the ICP. For each: company, sub-sector, HQ, revenue if findable,
ownership structure; the trigger in one factual sentence with exact date
and source URL; days old and days of window remaining; ICP read (green
flags, red flags, and anything unverified); the one question that decides
the account; recommended entry persona, naming a person only if genuinely
findable with a source, and matching the entry point to the trigger (an
operational trigger enters through the pain owner, a leadership change or
programme announcement enters higher); which sequence to run and the
one-line opening angle.

**Section 2 — ICP-marginal, above the band, or below the floor.** One line
each saying which test and why.

**Section 3 — Good accounts, no trigger.** Strong ICP fits with no dated
event. Feed the nurture pool and the account log.

**Section 4 — Coverage note.** Lanes not covered, sources that blocked.
Always state that technical leadership changes at privately held
mid-market companies are effectively invisible to web search, and that
job-change alerts in your alert tool are the only reliable route to that
signal. Keep a running list of blockers and paywalls hit.

**Paste-ready CRM blocks** for every Section 1 account, as a single
copy-paste rather than a retyping exercise. Fill every field possible,
leave the rest blank.

Cap the whole thing at eight to twelve accounts across Sections 1 and 3
combined.

### Operational notes — these will save the run

- A URL constructed yourself will fail to fetch. Web-search the literal
  slug first, then fetch the exact form the search result gives. Batch the
  searches, then batch the fetches.
- Watch for URL variants: a `-2` suffix, or no `www.`, or no trailing slash.
- Respect robots.txt absolutely. Never bypass a block by any other means,
  not a shell command, not a script, not a cache, not an archive mirror.
  Keep a list here of sources known to block, and the workaround that is
  allowed: find and cite the same story on a fetchable outlet. (Known for
  UK coverage: Companies House filing-index pages fetch fine but the
  accounts PDFs and iXBRL are bot-blocked, so verify size by filing type
  and date plus company statements, and label aggregator figures as
  indicative.)
- Generic category searches return vendor marketing, not named customers.
  Search a named company plus the system, or read vendor customer-story
  pages directly. If a lane produces nothing two runs straight, recommend
  a standing alert or dropping it, and record that here.
- Grant and public-programme pages return programme content, not current
  recipients. Go to announcement and case-study pages directly, and check
  dates before treating a recipient list as a lead.
- **Do the date arithmetic with a script, never in your head.** Compute
  days-old, days-of-window-remaining and the expiry date for every
  trigger. Getting this wrong is how a decayed trigger reaches an email.
- Verify company size against filings or the company's own published
  results, not impressions. A company "targeting £300m by 2031" is telling
  you its current revenue is far lower, so read the implication and check.
- When a source names a person, capture the exact title and quote it. When
  you can't find a person, say "not findable by web search" and point at
  your job-change alert tool. Do not substitute the CEO and hope.

---

## The dashboard

`dashboard/dashboard.html` renders the board. It never changes. All content
lives in `dashboard/data.js`, which **this sweep regenerates every run**,
after writing `runs/YYYY-MM-DD.md` and updating `account-log.md`.

Run it locally with `start-dashboard.bat` (serves on http://localhost:8787).

Rules for regenerating `data.js`:

- Rewrite the whole file. Keep the shape documented at the bottom of it.
- `dataAsOf` is the date of the run.
- `banner` carries anything the owner must see before sending: accounts in
  the below-primary-band zone, personas still needing the alert tool,
  stale watchlist items.
- Every account needs a working `source` URL and an ISO `triggerDate`. The
  board computes days-old and days-remaining live from `triggerDate` plus
  `windowMonths`, so never hard-code a countdown.
- `drafts` is `null` unless the account is sequence-eligible. Where drafts
  are written, follow the house style: open with a light line about not
  cold calling, then "I noticed [trigger]", then "I'm assuming [hypothesis]"
  so they can correct it, then the offer in one short paragraph, then a
  two-option closing question. Short paragraphs, one idea each. No company
  boilerplate in the body, identity goes in the signature. No em dashes.
  Never reference company misfortune.
- `news` holds the week's sector headlines with source links. Apply the
  misfortune rule here too: closures, redundancies, fires, incidents and
  insolvency never go in, even as background.
- `caseStudies` is the owner's own content. **Never invent entries.** Carry
  the existing array across each run untouched. Accounts match case studies
  by overlapping `caseStudyTags`, so set those tags from the trigger (e.g.
  `erp-integration`, `warehouse`, `cutover`, `forecasting`, `aerospace`).

Status and notes are saved in the browser, not in the file, so regenerating
`data.js` does not wipe them. They are per-browser and per-machine, so they
do not survive a laptop reset. Anything that matters belongs in
`account-log.md` or your CRM.
