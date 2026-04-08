# Curriculum Deck Design System

## Source of Truth
The canonical reference is Session 1: `/cohorts/cash-flow-machine/decks/session-1-the-revenue-reset.html`

## Colors (CSS Custom Properties)
```css
--black: #000000;
--dark: #0a0a0a;          /* page background */
--dark-card: #111111;      /* card backgrounds */
--card-border: #1C1C1C;   /* card borders */
--white: #f5f5f7;
--white-high: #ffffff;     /* primary text */
--white-mid: rgba(245,245,247,0.7);  /* secondary text */
--white-low: rgba(245,245,247,0.4);  /* muted text */
--lime: #D9FC67;           /* accent ONLY: dots, borders, eyebrows, numbers, progress bar */
--lime-dim: rgba(217,252,103,0.15);  /* subtle lime backgrounds */
--red: #FF4D4D;            /* negative indicators */
--red-dim: rgba(255,77,77,0.15);
```

**Lime rules**: NEVER for titles, headers, or body text. Only for: eyebrow labels, framework numbers, dots, thin borders, progress bar, severity bars, animated accents.

## Typography
- Font: `'Helvetica Neue', Helvetica, Arial, sans-serif` ONLY
- NO Google Fonts. NO Playfair Display. NO serif. NO cursive.
- Weight hierarchy: 800 (headlines/billboard), 700 (subheads), 600 (large text), 400 (body), 300 (secondary/reading)

### Size Scale
```css
--billboard: clamp(72px, 12vw, 160px);   /* billboard statement slides */
--hero: clamp(64px, 9vw, 120px);         /* title slides */
--headline: clamp(56px, 7vw, 100px);     /* section headlines */
--subhead: clamp(40px, 4.5vw, 64px);     /* subsection titles */
--large: clamp(28px, 3vw, 40px);         /* framework text */
--reading: clamp(22px, 2.2vw, 28px);     /* readable body */
--body: clamp(20px, 1.8vw, 24px);        /* standard body */
--eyebrow: 18px;                          /* labels */
--small: 15px;                            /* fine print */
```

All text must be readable on Zoom without squinting. Minimum body: 20px.

## Layout
- `scroll-snap-type: y mandatory` on html
- Each slide: `min-height: 100vh; scroll-snap-align: start; display: flex; align-items: center; justify-content: center;`
- Content width: `min(1100px, 82vw)` or `min(800px, 72vw)` for narrow

## Fixed Elements
- Progress bar: 2px lime at top, width updates on scroll
- Nav watermark: "FOUNDER OS" top-left, 14px uppercase, white-low
- Slide counter: bottom-right, "01 / 30" format, tabular-nums
- Scroll hint: bottom-center on first slide, fades after scroll

## Cards
- Background: `var(--dark-card)` (#111111)
- Border: `1px solid var(--card-border)` (#1C1C1C)
- Border-radius: 16px
- Padding: 32px
- Hover: `background: rgba(255,255,255,0.06); border-color: rgba(255,255,255,0.15);`

## Billboard Slides
- `.billboard-slide`: centered, padded, full viewport
- `.billboard-text`: font-weight 800, clamp(72px,12vw,160px), letter-spacing -0.05em
- Must FILL the screen like a Pentagram poster
- 2-3 per deck, sprinkled at natural pause points
- Hardest-hitting word gets lime squiggly SVG underline

## Squiggly Underline (Animated)
SVG background-image with mask overlay that slides away left-to-right on reveal:
```css
.squiggly-underline::after {
  content: '';
  position: absolute;
  bottom: 0; right: 0;
  width: 100%; height: 16px;
  background: var(--dark);
  transition: width 1.2s cubic-bezier(0.16, 1, 0.3, 1);
  transition-delay: 0.5s;
}
.visible .squiggly-underline::after { width: 0%; }
```

## Animations (All IntersectionObserver-triggered)
- Reveal: opacity 0 -> 1, translateY 16px -> 0, 0.5s
- Staggered children: 0.1s increment delays
- Bar fills: width 0 -> target, 2s cubic-bezier(0.16,1,0.3,1)
- Scale animations: scaleX(0) or scaleY(0) -> 1
- Counter animation: JS counts from 0 to target over 2s
- Gauge fills: stroke-dashoffset animation
- Pulse: `box-shadow 0 0 20px -> 40px` for active lime elements
- Timeline: line draws left-to-right, dots pop sequentially, active dot pulses

## Branding
- Favicon: `https://cdn.prod.website-files.com/673ff72afe499201ca5b3d58/682b25e288fcb16455c047c1_6502233257c93f97737f04d5_favicon.png`
- No em dashes anywhere (use -- or reword)
- WCAG 2.1 AA contrast on all text
