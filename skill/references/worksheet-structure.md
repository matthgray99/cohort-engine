# Worksheet Structure

## Format
HTML with print-optimized CSS. "Download PDF" button triggers `window.print()`. `@media print` hides the button and optimizes for A4.

## Design System
- White background, near-black (#0a0a0a) text
- Helvetica Neue font stack only
- Lime (#D9FC67) accent for section header underlines and session badge
- Clean, generous white space for handwriting
- Dotted lines for fill-in fields, bordered boxes for larger responses
- Professional, premium feel

## Structure Per Worksheet (5-7 pages printed)

### 1. Header
- "FOUNDER OS" logo text (top-left, 12px uppercase gray)
- Session badge (top-right, lime on dark, "SESSION 0X")
- Worksheet title (32px, weight 800)
- Subtitle (18px, gray)
- Participant name + date fill-in fields

### 2. Key Concepts (1 page)
- Section title with lime underline
- Framework overview matching the deck content
- Checkbox list of key principles
- Visual summary (simplified version of deck diagram)

### 3. Self-Assessment / Diagnostic (1-2 pages)
- Tables with editable cells
- Scoring frameworks
- Specific to session content (revenue audit, offer inventory, pricing calc, etc.)

### 4. Implementation (1-2 pages)
- Guided exercises with fill-in fields
- Step-by-step matching the deck's live exercise
- "What a good answer looks like" hints in gray

### 5. Action Plan (1 page)
- 1-3 action cards with fields: Action | By When | Accountability
- Numbered cards with lime numbers on dark background
- Specific, not generic

### 6. DFY Velocity Pitch (half page)
- Dark background box (#0a0a0a) with white text
- Lime eyebrow: "WHAT'S NEXT"
- Session-specific pitch copy (see velocity-pitch-progression.md for per-session angles)
- Booking CTA or seed depending on session number

### 7. Notes (1 page)
- 10+ lined rows for session notes
- Clean, generous spacing

## DFY Pitch Per Worksheet
| WS | Pitch |
|----|-------|
| 01 | "Identified your revenue leak? Imagine if we fixed it for you in 30 days." |
| 02 | "Compressed your offer? What if we built the content system to sell it?" |
| 03 | "Pricing dialed? Imagine if your content, brand, and sales got the same treatment." |
| 04 | "Mapped your lead engine? We build it. In 30 days. Trained on your voice." |
| 05 | "Sales process simpler? What if your content did the selling 24/7?" |
| 06 | "You have the plan. We have the team. Book a call to get your social media machine built." |

## Print CSS Requirements
- @page { size: A4; margin: 0; }
- Download button hidden
- Page breaks: avoid inside sections, break before DFY pitch if needed
- Full width layout (no max-width constraint in print)
