# LinkedIn Profile Refresh Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Restore a restrained academic layout, update the site's professional content from the current LinkedIn profile, and verify every page and link on desktop and mobile.

**Architecture:** Keep the existing Jekyll/al-folio structure. Content remains in `_pages`, `_data`, `_projects`, and `_bibliography`; small responsive corrections live in `_sass/_base.scss`; a PowerShell contract script provides fast regression checks before the deployed browser review.

**Tech Stack:** Jekyll, Liquid, YAML, SCSS, PowerShell, Prettier, GitHub Pages, browser-based visual QA.

---

### Task 1: Add the content and layout contract

**Files:**
- Create: `scripts/check-profile-site.ps1`

- [ ] Write assertions that require `pharmacometrics`, reject `quantitative pharmacology` and the venlafaxine title, require both current LinkedIn roles, require a non-fixed footer, and check navigation order.
- [ ] Run `powershell -ExecutionPolicy Bypass -File scripts/check-profile-site.ps1` and confirm it fails against the current source.
- [ ] Commit the design, plan, and failing contract check.

### Task 2: Restore the homepage hierarchy

**Files:**
- Modify: `_pages/about.md`
- Modify: `_config.yml`
- Modify: `_sass/_base.scss`

- [ ] Replace the dense homepage copy with a concise LinkedIn-aligned introduction.
- [ ] Disable homepage-selected papers and the duplicate social block.
- [ ] Set a non-fixed footer, enable the LinkedIn profile link, and remove the rejected terminology from site metadata.
- [ ] Constrain the portrait and contact block at desktop and mobile breakpoints.
- [ ] Run the contract check and Prettier on the edited files.

### Task 3: Update the CV and publication record

**Files:**
- Modify: `_data/cv.yml`
- Modify: `_bibliography/papers.bib`
- Modify: `_pages/cv.md`
- Modify: `_pages/publications.md`

- [ ] Add Academic Casual and Professional Casual experience exactly as supplied by LinkedIn.
- [ ] Align the summary, research areas, and tools with the LinkedIn headline and About section.
- [ ] Remove the venlafaxine bibliography entry and remove the preprint wording.
- [ ] Place CV before Publications in the navigation.
- [ ] Run the contract check and Prettier on the edited files.

### Task 4: Repair oversized and non-clickable sections

**Files:**
- Modify: `_pages/projects.md`
- Modify: `_pages/repositories.md`
- Modify: `_data/repositories.yml`
- Modify: `_projects/01_vancomycin-cts.md`
- Modify: `_projects/02_model-informed-dosing.md`
- Modify: `_projects/03_translational-pbpk.md`
- Modify: `_sass/_base.scss`

- [ ] Give each project card a working internal destination and moderate card-title typography.
- [ ] Replace blank third-party GitHub widgets with durable text links to the GitHub profile and selected repositories.
- [ ] Constrain cards and long text on narrow screens.
- [ ] Run the contract check and Prettier on all changed source files.

### Task 5: Build, deploy, and visually verify

**Files:**
- Verify generated GitHub Pages output and live URLs.

- [ ] Run all source contract, formatting, and link checks.
- [ ] Commit and push the implementation to `master`.
- [ ] Wait for GitHub Pages and repository checks to complete successfully.
- [ ] At 1280 x 800 and 390 x 844, inspect About, CV, Publications, Projects, Code, and all three project detail pages.
- [ ] Click every navigation item and the primary email, university, LinkedIn, GitHub, publication, and project links.
- [ ] Confirm no horizontal overflow, fixed-footer overlap, blank content, or disproportionate component remains.
