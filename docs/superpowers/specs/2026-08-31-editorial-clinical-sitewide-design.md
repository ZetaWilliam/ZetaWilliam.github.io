# Editorial Clinical Sitewide Design

## Objective

Improve the visual hierarchy of Zack Wang's academic CV website without changing its approved information architecture or turning it into a marketing page. The finished site should feel precise, contemporary, and recognisably connected to pharmacometrics and clinical research.

The approved direction is **Editorial clinical**: deep teal, restrained warm-gold accents, editorial typography, fine rules, compact labels, and moderate component sizes.

## Scope

Apply one visual system across:

- About/home page
- CV
- Publications
- Projects and individual project pages
- Code
- Shared navigation and footer
- Light and dark themes
- Desktop and mobile layouts

## Content Rules

- Preserve all approved biographical, employment, education, research, publication, and contact information.
- Continue to use `pharmacometrics`; do not introduce `quantitative pharmacology`.
- Do not restore the deleted venlafaxine publication.
- Do not invent achievements, metrics, affiliations, methods, or publications.
- Keep the existing navigation order: About, CV, Publications, Projects, Code.
- Keep every existing destination URL stable.

## Visual System

### Colour

- Primary ink: deep blue-green for headings and strong dividers.
- Primary accent: clinical teal for active states, links, labels, and project markers.
- Secondary accent: muted warm gold used only for small indices, timeline markers, and fine details.
- Surfaces: white or a very pale cool grey in light mode; dark neutral surfaces in dark mode.
- Body text remains neutral and high contrast.

The palette must not become a single-colour teal interface. Warm gold and neutral greys provide contrast, but neither should dominate.

### Typography

- Use a restrained native serif stack for page titles, section titles, and selected item headings.
- Keep body text in the theme's existing readable sans-serif stack.
- Desktop page titles should remain approximately 2.25-2.75rem; mobile titles approximately 2rem.
- Compact panels and cards use 1.1-1.35rem headings.
- Letter spacing is zero for normal text. Uppercase eyebrow labels may use slight positive tracking.

### Shape and Depth

- Use square or very lightly rounded surfaces.
- Use fine borders and subtle shadows only where they clarify interactive cards.
- Do not use decorative floating cards, gradients, or background orbs.
- Hover states may lift a project card by a few pixels and strengthen its border or shadow without resizing the layout.

## Shared Navigation and Footer

- Keep the navigation quiet and compact.
- Add a subtle translucent background and fine bottom rule while preserving readability in both themes.
- Use a short teal underline for the active page.
- Preserve the existing mobile collapse control and dark-mode control.
- Keep the footer in normal document flow with a fine top rule.

## Home Page

### Hero

- Present `Zack (Zehua) Wang` as the primary identity signal.
- Add the eyebrow `Pharmacometrics researcher` above the name.
- Use the supporting line `Model-informed evidence for better dosing, clinical trials, and treatment decisions.`
- Keep the approved profile photograph at approximately 220px wide on desktop and centred at no more than 220px on mobile.
- Add a teal lower-edge detail to the photograph instead of increasing its size.
- Keep concise role, institution, location, email, and LinkedIn information adjacent to the photograph.

### Research Focus

Add four compact focus labels using information already present on the site:

- Pharmacometrics
- Clinical trial simulation
- Model-informed dosing
- Disease progression modelling

### Selected Research

Show two compact links after the biography:

- Vancomycin AUC-guided dosing
- Alzheimer's disease progression

These are navigation aids to existing project pages, not new claims or portfolio cards. A clear `View all projects` link accompanies them.

## CV

- Keep the existing content order and YAML data source.
- Replace the plain stacked sections with an editorial section rhythm: fine dividers, teal uppercase section labels, and serif item titles.
- Use muted warm-gold markers for dated experience and education entries.
- Keep dates readable without creating a wide fixed sidebar on mobile.
- Avoid enclosing every section in a decorative card.
- Keep technical capabilities compact and scannable.

## Publications

- Preserve the existing bibliography generation, Bib toggle, copy control, DOI/HTML links, and ordering.
- Add a compact publication index and use clearer title, author, journal, and year hierarchy.
- Use fine row rules rather than separate cards.
- Keep buttons at normal control size and ensure expanded BibTeX remains readable on mobile.

## Projects

- Retain the two-column desktop and one-column mobile layout.
- Use a slim teal top or left rule, a small warm-gold project index/category label, and a serif project title.
- Use restrained hover movement and a visible focus state.
- Keep each full card clickable without nested-link conflicts.
- Individual project pages inherit the same editorial page-heading treatment and readable body width.

## Code

- Keep the page intentionally simple.
- Use an editorial introductory block and one stable GitHub call-to-action.
- Do not restore third-party repository stat or trophy images.
- Keep the GitHub button compact, clearly clickable, and accessible.

## Responsive Behaviour

- Test at a desktop viewport near 1280px wide and a mobile viewport near 390px wide.
- No page may have horizontal scrolling.
- The home hero stacks cleanly on mobile with the photograph centred.
- Project cards become one column.
- CV dates and descriptions wrap without overlap.
- Publication titles, controls, and BibTeX blocks remain within the viewport.
- Navigation links remain reachable through the mobile collapse control.

## Accessibility and Interaction

- Maintain WCAG-aware contrast in both light and dark themes.
- Preserve semantic heading order.
- Provide visible keyboard focus for links, controls, and clickable project cards.
- Respect `prefers-reduced-motion` by removing non-essential transitions.
- Do not rely on colour alone to identify the active navigation item or clickable content.

## Verification

Before deployment:

- Extend the profile-site regression script to cover the new structural classes and content constraints.
- Run the regression script, Prettier, YAML parsing, and `git diff --check`.
- Confirm that Jekyll builds through the existing GitHub Pages workflow.

After deployment:

- Inspect About, CV, Publications, Projects, individual project pages, and Code in a real browser.
- Inspect both desktop and mobile viewports for overflow, clipping, oversized typography, and layout shifts.
- Click the desktop navigation, mobile navigation, all project cards, publication Bib controls, DOI/HTML links, LinkedIn, University of Auckland profile, and GitHub call-to-action where automated access permits.
- Confirm that all GitHub Actions complete successfully.

## Non-Goals

- No landing-page marketing copy.
- No new blog or contact form.
- No animated charts, decorative illustrations, or large hero imagery.
- No changes to factual CV content beyond the visual labels and navigation text defined above.
- No framework migration or broad refactor of the al-folio theme.
