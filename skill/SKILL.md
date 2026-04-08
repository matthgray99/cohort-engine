---
name: cohort-offer
description: Generate a complete cohort offer package including curriculum decks, worksheets, email sequences, video scripts, landing page copy, and campaign brief. Use when user says "create a cohort offer", "build a cohort package", "new cohort", "cohort launch", "build the Social Media Machine cohort", or names any cohort course.
user-invocable: true
---

# Cohort Offer Skill

You generate the COMPLETE asset package for a cohort-based course offer. Every cohort gets: curriculum architecture, 6 session decks, 6 worksheets, 10 email sequence files, 5 video scripts, landing page copy, a campaign brief, and an index page.

Reference implementation: `~/dev/cohort-engine/cohorts/cash-flow-machine/`
Design specs live in `skill/references/`. Load them on demand per step.

## Step 0: Plan Mode + Gather Requirements

**STOP. Do NOT build anything yet.** Enter plan mode and collect all inputs.

Present this checklist to the user and fill in what you can from context:

### Required
- **Cohort name**: (e.g., "The Cash Flow Machine")
- **Sessions**: count + schedule (e.g., 6 sessions, MWF, 2 weeks)
- **Target audience**: who, revenue range, stage
- **Price point**: standard + VIP if applicable
- **Capacity**: max seats
- **Launch date**: enrollment open date
- **Session topics**: titles + 1-sentence descriptions for each
- **Upsell target**: product pitched in sessions 4-6 (e.g., Founder OS Velocity)
- **Case studies**: 2 per session, founder name + before/after numbers

### Nice to Have
- Existing frameworks/IP to teach
- Pain points from sales data or call transcripts
- Previous cohort data (attendance, conversion rates)
- Video production timeline
- Team member assignments (who owns what)

If any REQUIRED field is missing, ask clarifying questions. Do not proceed to Step 1 until every required field is filled.

Once confirmed, set the cohort slug (kebab-case) and create the output directory:
```
~/dev/cohort-engine/cohorts/[cohort-slug]/
```

## Step 1: Curriculum Architecture

Generate `curriculum-architecture.md` with:

1. **Cohort overview**: name, schedule, audience, price, capacity, upsell target
2. **Session table**: for each session:
   - Title and subtitle
   - Core framework name (ownable, memorable)
   - 3-4 key concepts taught
   - Live exercise description (4 steps)
   - 2 case studies (founder + before/after numbers)
   - 1 homework item
   - Velocity pitch type: subconscious (1-3), warm+CTA (4-5), full conversion (6)
3. **Learning arc**: how sessions build on each other progressively
4. **Transformation promise**: the before/after state across all 6 sessions

Read `references/pedagogy-framework.md` for cognitive engagement strategies. Apply: advance organizers, chunking, dual coding, retrieval practice, progressive disclosure, and implementation intent.

## Step 2: Curriculum Decks (6 HTML files)

Generate one self-contained HTML file per session. Read these references before building:
- `references/design-system.md` -- colors, typography, layout, animations
- `references/deck-slide-catalog.md` -- all 13 required slide types
- `references/velocity-pitch-progression.md` -- pitch arc across sessions

### Per-Deck Requirements

Each deck MUST include these slide types (see `references/deck-slide-catalog.md` for specs):

| Slide Type | Sessions | Count |
|---|---|---|
| Title slide | All | 1 |
| Previous session recap | 2-6 | 1 |
| The Promise (outcomes) | All | 1 |
| Billboard statements | All | 2-3 |
| Framework overview | All | 1 |
| Framework deep-dives | All | 1 per concept |
| Visual diagrams (SVG/CSS) | All | 7+ |
| Live exercise block | All | 4 slides |
| Case studies | All | 2 |
| Homework slide | All | 1 |
| Velocity seed/pitch | All | varies |
| Next session preview | 1-5 | 1 |
| Closing slide | All | 1 |

Target: 25-30 slides per deck.

### Design System (Non-Negotiable)

- **Font**: `'Helvetica Neue', Helvetica, Arial, sans-serif` ONLY. No Google Fonts. No serif. No Poppins.
- **Background**: `#0a0a0a`. Cards: `#111111`. Borders: `#1C1C1C`.
- **Text**: `#f5f5f7` primary, `rgba(245,245,247,0.7)` secondary, `rgba(245,245,247,0.4)` muted.
- **Lime** (`#D9FC67`): eyebrow labels, framework numbers, dots, thin borders, progress bar ONLY. Never titles or body text.
- **Layout**: `scroll-snap-type: y mandatory`. Each slide `min-height: 100vh; scroll-snap-align: start`.
- **Billboard slides**: `clamp(72px, 12vw, 160px)`, weight 800, letter-spacing -0.05em. Hardest-hitting word gets animated lime squiggly SVG underline.
- **Animations**: IntersectionObserver-triggered. Reveal (opacity+translateY), staggered children (0.1s delays), bar fills, counter animations, gauge sweeps.
- **Fixed elements**: 2px lime progress bar at top, "FOUNDER OS" watermark top-left, slide counter bottom-right, scroll hint on slide 1.
- **Favicon**: `https://cdn.prod.website-files.com/673ff72afe499201ca5b3d58/682b25e288fcb16455c047c1_6502233257c93f97737f04d5_favicon.png`
- **No em dashes**. WCAG 2.1 AA contrast on all text.

### Velocity Pitch Progression

- **Sessions 1-3 (Subconscious)**: Billboard-style seed. Never name the product. No CTA. Reads as genuine insight.
- **Sessions 4-5 (Warm)**: Named concept + booking CTA. Framed as option, not push.
- **Session 6 (Full Conversion)**: 3-4 slide sequence: pattern interrupt, the solution (4 cards), the math ($107K+ animated counter), social proof (3 transformations), booking CTA with urgency.

### Deck Output
```
decks/
  session-1-[slug].html
  session-2-[slug].html
  ...
  session-6-[slug].html
  index.html  (hub linking all 6)
```

Also generate `decks/index.html` linking all 6 session decks.

## Step 3: Worksheets (6 HTML files)

Generate one print-optimized HTML worksheet per session.

### Worksheet Format
- **White background**, dark text, lime accents on section headers only
- **Font**: Helvetica Neue
- **Download PDF button** at top (triggers `window.print()`)
- **Sections**: exercise fields (fill-in blanks, tables, checklists), action plan with commitments, notes area
- **DFY pitch**: dark box at bottom of each worksheet with session-specific Velocity seed copy (see `references/velocity-pitch-progression.md` for per-session pitches)
- **Favicon**: same as decks

### Worksheet Output
```
worksheets/
  ws-01-[slug].html
  ws-02-[slug].html
  ...
  ws-06-[slug].html
```

## Step 4: Email Sequences (10 Markdown files)

Write all copy to Hopkins/Ogilvy/Brunson/Hormozi caliber in Matt Gray's voice. Read `references/copywriting-standards.md` before writing.

Each email includes: subject line (3 options), preview text, send timing, body copy, P.S. line, single CTA.

### Email Files

| File | Name | Emails | Purpose |
|---|---|---|---|
| `00-behavioral-science.md` | Behavioral Layer | 1 doc | Psychology principles applied across all sequences |
| `01-waitlist-warmup.md` | Waitlist Warmup | 5 | Build anticipation before enrollment opens |
| `02-launch-enrollment.md` | Launch Enrollment | 7 | Drive enrollment during open period |
| `03-cart-close.md` | Cart Close Urgency | 5 | Final push before enrollment closes |
| `04-pre-cohort-onboarding.md` | Pre-Cohort Onboarding | 5 | Onboard enrolled founders + seed Velocity subconsciously |
| `05-during-cohort.md` | During Cohort | 12 | Pre-session + post-session for each of 6 sessions |
| `06-post-cohort-ascension.md` | Post-Cohort Ascension | 7 | Convert graduates to Velocity/upsell |
| `07-no-show-reengagement.md` | No-Show Re-engagement | 5 | Win back founders who missed sessions |
| `08-abandoned-cart.md` | Abandoned Cart | 4 | Recover dropped enrollments |
| `09-vip-upgrade.md` | VIP Upgrade | 3 | Upgrade standard to VIP tier |

### Email Rules
- Subject lines: specific, curiosity-loaded, Hopkins-level. 3 options per email.
- Every sentence earns the next sentence. Cut ruthlessly.
- ONE primary CTA per email.
- P.S. lines on every email (second-most-read element after subject).
- Pre-cohort onboarding emails (04) must seed Velocity without naming it: "installed" language, DIY time contrast, "built FOR you" identity framing.
- No em dashes anywhere.

### Email Output
```
emails/
  00-behavioral-science.md
  01-waitlist-warmup.md
  ...
  09-vip-upgrade.md
```

## Step 5: Video Scripts (5 Markdown files)

| Script | Duration | Purpose |
|---|---|---|
| `hero-video.md` | 60-75s | Landing page hero. Hook, promise, proof, CTA. |
| `course-intro.md` | 60-90s | Post-purchase welcome. What to expect, how to prepare. |
| `case-study-throw.md` | 60-90s | End of YouTube video. Founder story that bridges to cohort CTA. |
| `session-6-bonus.md` | 7-9 min | Soft pitch delivered live at end of Session 6. |
| `upsell-video.md` | 3-5 min | Post-cohort. Full Velocity pitch with social proof. |

All scripts in Matt Gray's voice. Builder language. Specific numbers. No fluff.

### Video Script Output
```
video-scripts/
  hero-video.md
  course-intro.md
  case-study-throw.md
  session-6-bonus.md
  upsell-video.md
```

## Step 6: Landing Page Copy

Generate `landing-page/copy.md` with these sections in order:

1. **Hero**: power headline + subheadline + video placeholder + intro paragraph
2. **Pain**: mirror their situation (qualifying the reader)
3. **Promise**: the big idea, why NOW
4. **System**: what they get, session-by-session breakdown with mockup placeholders
5. **Social Proof**: 6-8 testimonials with full attribution + earnings disclaimer
6. **Transformation**: what life looks like after implementation
7. **Bundle**: everything-you-get summary with value stack
8. **Guarantee**: money-back terms
9. **FAQ**: 8-10 questions
10. **Final CTA**: urgency + scarcity + booking/enrollment link

Apply behavioral science: anchoring (show individual price before bundle), scarcity (specific seat count), loss aversion (what they miss), social proof near every CTA.

Include the full FounderOS earnings disclaimer verbatim.

## Step 7: Campaign Brief

Generate `campaign-brief.md` with:

1. **Executive summary**: what, why now, revenue potential
2. **Critical path timeline**: 8-day sprint model
   - Days 1-3: All copy written
   - Day 4: Copy handoff, builds begin, Matt records video, Yan starts design
   - Day 5: All builds complete, video + images due
   - Day 6: End-to-end testing
   - Day 7: Final sign-off
   - Day 8: LAUNCH
3. **Task breakdown by owner**: Copy Lead, Matthew (Webflow), Yan (Design), Bhea (Kajabi), Don (HubSpot), Matt (Video)
4. **Offer structure**: price, capacity, dates, inclusions
5. **Launch readiness checklist**: Webflow, Kajabi, HubSpot, email sequences, video, social
6. **Key dates table**: date, milestone, owner
7. **Open items**: unresolved decisions

## Step 8: Index Page

Generate `index.html` at the cohort root. Hub page linking every generated asset:
- Curriculum architecture
- All 6 decks (with deck index)
- All 6 worksheets
- All 10 email files
- All 5 video scripts
- Landing page copy
- Campaign brief

Dark theme matching deck design system. Favicon included.

## Output Structure

```
~/dev/cohort-engine/cohorts/[cohort-slug]/
  index.html                    # Asset hub
  campaign-brief.md
  curriculum-architecture.md
  decks/
    index.html                  # Deck navigator
    session-1-[slug].html
    session-2-[slug].html
    session-3-[slug].html
    session-4-[slug].html
    session-5-[slug].html
    session-6-[slug].html
  worksheets/
    ws-01-[slug].html
    ws-02-[slug].html
    ws-03-[slug].html
    ws-04-[slug].html
    ws-05-[slug].html
    ws-06-[slug].html
  emails/
    00-behavioral-science.md
    01-waitlist-warmup.md
    02-launch-enrollment.md
    03-cart-close.md
    04-pre-cohort-onboarding.md
    05-during-cohort.md
    06-post-cohort-ascension.md
    07-no-show-reengagement.md
    08-abandoned-cart.md
    09-vip-upgrade.md
  video-scripts/
    hero-video.md
    course-intro.md
    case-study-throw.md
    session-6-bonus.md
    upsell-video.md
  landing-page/
    copy.md
```

## Reference Implementation

Cash Flow Machine (`~/dev/cohort-engine/cohorts/cash-flow-machine/`) is the gold standard. Before generating any new cohort:

1. Read CFM decks for design patterns, animation code, and slide structure
2. Read CFM emails for tone, pacing, and behavioral science application
3. Read CFM worksheets for layout and DFY pitch placement
4. Adapt all content to the new cohort's topic while maintaining the same quality level

## Validation Checklist

After generation, verify ALL of the following:

### Decks
- [ ] All 6 deck HTMLs have DOCTYPE, scroll-snap, Helvetica Neue, favicon
- [ ] No Poppins, serif, or Google Fonts anywhere
- [ ] All 6 decks have billboard slides with animated squiggly underlines
- [ ] All 6 decks have lime framework numbers (never lime titles)
- [ ] Decks 2-6 have previous session recap slide
- [ ] Each deck has 4-step live exercise block
- [ ] Each deck has 2 case studies with before/after numbers
- [ ] Velocity pitch: subconscious (1-3), warm+CTA (4-5), full conversion (6)
- [ ] Session 6 has $107K math, social proof wall, booking CTA
- [ ] Each deck has 1 homework item (no number on it)
- [ ] 7+ visual SVG/CSS diagrams per deck
- [ ] WCAG AA contrast on all text
- [ ] No em dashes in any deck

### Worksheets
- [ ] All 6 worksheets have Download PDF button
- [ ] White bg, dark text, Helvetica Neue
- [ ] Each has session-specific DFY pitch in dark box at bottom
- [ ] Fill-in fields, tables, checklists present

### Emails
- [ ] All 10 email files exist with correct naming
- [ ] Each email has 3 subject line options + preview text + send timing
- [ ] ONE CTA per email, P.S. line on every email
- [ ] Pre-cohort emails (04) seed Velocity without naming it
- [ ] No em dashes

### Other Assets
- [ ] 5 video scripts with correct durations
- [ ] Landing page has all 10 sections + earnings disclaimer
- [ ] Campaign brief has 8-day timeline + task breakdown
- [ ] Index page links every asset
- [ ] No em dashes in any file

## Evals

### Triggering (positive -- should activate this skill)
- "create a cohort offer"
- "build the Social Media Machine cohort"
- "new cohort package"
- "launch a cohort"
- "cohort offer for X"

### Triggering (negative -- should NOT activate this skill)
- "create a landing page" (too narrow, single asset)
- "write a sales email" (too narrow, single asset)
- "update the level 10" (different skill)
- "build a PLG tool" (different skill)
- "score this call" (different skill)

### Performance
- Single skill invocation generates the complete package
- Benchmark against CFM: same asset count, same design quality, same copy caliber
