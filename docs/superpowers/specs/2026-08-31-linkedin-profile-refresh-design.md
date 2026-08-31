# LinkedIn Profile Refresh Design

## Goal

Restore the restrained visual character of the site before `e96cc86`, retain the useful academic pages added later, and align all professional content with Zack Wang's current LinkedIn profile.

## Content Contract

- Use `pharmacometrics`; do not use the phrase `quantitative pharmacology`.
- Present the current University of Auckland roles from LinkedIn: Academic Casual from August 2026 and Professional Casual from December 2025 to July 2026.
- Describe current research as pharmacometrics, population PK/PD modelling, clinical trial simulation, model-informed dosing and target concentration intervention, Alzheimer disease progression modelling, and PBPK/PD modelling of antibody-drug conjugates.
- Keep claims bounded to the supplied LinkedIn text and existing verified publication records.
- Remove the venlafaxine preprint from the bibliography and all visible site content.

## Visual Direction

Use the existing al-folio theme and return the homepage to a quiet academic profile. The portrait remains on the right on desktop at a controlled width and moves above the text on mobile. The homepage contains a short introduction and a compact contact block, without an embedded publication list or a second social-link section.

Retain About, CV, Publications, Projects, and Code in the navigation, ordered by visitor intent. Use moderate heading sizes, compact project cards, normal body typography, and a non-fixed footer so content is never covered. External links must be visibly clickable and work without relying on third-party image services.

## Verification

- Source contract check for terminology, LinkedIn experience, navigation order, footer behaviour, and bibliography removal.
- Prettier check for edited YAML, Markdown, Liquid, and SCSS.
- Jekyll build through the repository's GitHub Pages workflow.
- Browser checks at 1280 x 800 and 390 x 844 for every navigation page.
- Click navigation, project cards, publication controls, GitHub, email, and university-profile links.
- Confirm no horizontal overflow, covered content, giant controls, blank primary sections, or broken routes.
