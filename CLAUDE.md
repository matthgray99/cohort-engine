# Cohort Engine

## Status: Active. Phase A in progress. CFM Cohort #1 assets being built.
## Purpose: Reusable cohort offer generation engine. Produces all assets (decks, worksheets, emails, video scripts, landing pages, campaign briefs) for any cohort-based course.
## GitHub: Matt-Gray-Founder-OS/cohort-engine (private)
## Next: Build Session 1 deck as master template, rewrite post-sell emails, then batch remaining assets.

## Architecture

```
skill/          - Reusable /cohort-offer skill (symlinked to ~/.claude/skills/cohort-offer/)
cohorts/        - Generated output per cohort offer
  cash-flow-machine/   - CFM Cohort #1 (May 29, $800, 6 sessions, 14 days)
  social-media-machine/ - SMM Cohort (June 30, test run for the skill)
```

## Design System (Non-Negotiable)

- Background: #0A0A0A, Cards: #1A1A1A, Borders: rgba(255,255,255,0.08)
- Primary text: #FFFFFF, Secondary: rgba(245,245,247,0.7), Muted: rgba(245,245,247,0.4)
- Accent: #D9FC67 (lime) for dots, borders, eyebrow labels ONLY. Never titles.
- Font: 'Helvetica Neue', Helvetica, Arial, sans-serif + Playfair Display for editorial serif
- Layout: scroll-snap mandatory, 100vh per slide
- Animations: IntersectionObserver reveal, opacity/translateY, staggered delays
- Branding: "Founder OS" top-left, founderos.com favicon
- No em dashes. WCAG 2.1 AA contrast on all text.

## Copywriting Standards

Hopkins (specific, scientific) + Ogilvy (every word earns its place) + Brunson (story-driven stacking) + Hormozi (Grand Slam Offer) -- all in Matt Gray's builder voice.

## Key Patterns

- Velocity pitch progression: subconscious (sessions 1-3) -> warm (4-5) -> full conversion (6)
- Pedagogy: advance organizers, dual coding, chunking, retrieval practice, progressive disclosure
- Live exercises: 4-5 slides, step-by-step, not overwhelming
- Previous session recaps on decks 2-6
- 2 case studies per deck with real founder before/after numbers
- Each worksheet has session-specific DFY pitch at the end

## Commands

```bash
# Validate all decks
./skill/scripts/validate-deck.sh cohorts/cash-flow-machine/decks/

# Validate all emails
./skill/scripts/validate-emails.sh cohorts/cash-flow-machine/emails/

# Build worksheet PDFs
./cohorts/cash-flow-machine/worksheets/build.sh
```
