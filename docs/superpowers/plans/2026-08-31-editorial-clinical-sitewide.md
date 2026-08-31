# Editorial Clinical Sitewide Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Apply the approved editorial-clinical visual system across Zack Wang's academic CV website while preserving factual content, routes, controls, and responsive behaviour.

**Architecture:** Add small semantic hooks to existing Liquid layouts and Markdown pages, then implement the visual system in the existing Sass layer. Extend the current PowerShell source contract before implementation and use the existing GitHub Pages workflows as the production build and link gate.

**Tech Stack:** Jekyll, Liquid, al-folio, SCSS, Markdown/YAML, PowerShell regression checks, GitHub Actions, browser-based visual QA.

---

### Task 1: Extend the regression contract

**Files:**
- Modify: `scripts/check-profile-site.ps1`

- [ ] **Step 1: Add failing structural assertions**

Read `_layouts/about.liquid`, `_layouts/page.liquid`, `_layouts/cv.liquid`, `_includes/projects.liquid`, and `_pages/about.md`. Require the new classes `profile-hero`, `editorial-header`, `editorial-eyebrow`, `research-focus`, `selected-research`, `publication-index`, and `project-index`.

```powershell
Require-Match $aboutLayout 'profile-hero' 'The editorial home hero is missing.'
Require-Match $pageLayout 'editorial-header' 'Shared editorial page headings are missing.'
Require-Match $cvLayout 'editorial-eyebrow' 'The CV editorial label is missing.'
Require-Match $about 'research-focus' 'The research-focus labels are missing.'
Require-Match $about 'selected-research' 'The selected-research links are missing.'
Require-Match $projectInclude 'project-index' 'Project index labels are missing.'
Require-Match $styles 'prefers-reduced-motion' 'Reduced-motion handling is missing.'
```

- [ ] **Step 2: Run the contract and verify failure**

Run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/check-profile-site.ps1
```

Expected: FAIL with the new editorial-structure messages while all existing factual checks remain active.

- [ ] **Step 3: Commit the failing contract**

```powershell
git add scripts/check-profile-site.ps1
git commit -m "Add editorial site regression contract"
```

### Task 2: Add semantic editorial structure

**Files:**
- Modify: `_layouts/about.liquid`
- Modify: `_layouts/page.liquid`
- Modify: `_layouts/cv.liquid`
- Modify: `_includes/projects.liquid`
- Modify: `_pages/about.md`
- Modify: `_pages/projects.md`
- Modify: `_pages/repositories.md`

- [ ] **Step 1: Add shared heading hooks**

Wrap page headings with `editorial-header`, render a compact `editorial-eyebrow` from page front matter, and keep the existing title and description values. Apply the same pattern to CV and About without changing heading order.

```liquid
<header class="post-header editorial-header">
  {% if page.eyebrow %}<p class="editorial-eyebrow">{{ page.eyebrow }}</p>{% endif %}
  <h1 class="post-title">{{ page.title }}</h1>
  <p class="post-description">{{ page.description }}</p>
</header>
```

- [ ] **Step 2: Build the home hero and navigation aids**

Use `profile-hero` around the existing identity and photograph. Add four `research-focus` labels and two `selected-research` links using the already approved project routes.

```html
<div class="research-focus" aria-label="Research focus">
  <span>Pharmacometrics</span>
  <span>Clinical trial simulation</span>
  <span>Model-informed dosing</span>
  <span>Disease progression modelling</span>
</div>
```

- [ ] **Step 3: Add project and Code hooks**

Render a deterministic two-digit `project-index` from the project loop and add `code-intro` around the existing Code copy. Preserve each project destination and the GitHub URL.

- [ ] **Step 4: Run source checks and formatting**

Run the contract and Prettier on all modified Liquid and Markdown files. Expected: structural checks progress; Sass reduced-motion check remains the only new failure.

- [ ] **Step 5: Commit semantic structure**

```powershell
git add _layouts/about.liquid _layouts/page.liquid _layouts/cv.liquid _includes/projects.liquid _pages/about.md _pages/projects.md _pages/repositories.md
git commit -m "Add editorial structure across profile pages"
```

### Task 3: Implement the editorial-clinical visual system

**Files:**
- Modify: `_sass/_themes.scss`
- Modify: `_sass/_base.scss`

- [ ] **Step 1: Add theme tokens**

Define light and dark variables for editorial ink, teal, warm gold, soft surface, and shadow. Map dark-mode values to accessible lighter accents.

```scss
--global-editorial-ink: #163037;
--global-editorial-accent: #176b66;
--global-editorial-gold: #9a7436;
--global-editorial-surface: #f5f8f7;
```

- [ ] **Step 2: Style shared chrome and headings**

Use a native serif stack for display headings, a short active-navigation underline, compact eyebrow labels, fine rules, and a translucent navigation surface. Do not enlarge the existing controls.

- [ ] **Step 3: Style the home page**

Keep the photograph at 220px, add the teal lower-edge detail, style focus labels as compact outlined tags, and show the two selected research links as un-nested lightweight panels.

- [ ] **Step 4: Style CV, publications, projects, and Code**

Use row rules and editorial hierarchy rather than decorative page cards. Add warm-gold indices or markers, serif item titles, restrained project hover motion, and a compact GitHub call-to-action.

- [ ] **Step 5: Add responsive, focus, dark-mode, and reduced-motion rules**

At mobile widths, stack the hero, use one project column, let CV dates wrap, and constrain BibTeX blocks. Add `:focus-visible` styles and remove non-essential transitions under `prefers-reduced-motion: reduce`.

- [ ] **Step 6: Run contract and formatting**

Run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/check-profile-site.ps1
npm exec prettier -- _sass/_themes.scss _sass/_base.scss --check
```

Expected: PASS.

- [ ] **Step 7: Commit the visual system**

```powershell
git add _sass/_themes.scss _sass/_base.scss
git commit -m "Apply editorial clinical visual system"
```

### Task 4: Verify and deploy

**Files:**
- Modify: `.gitignore`
- Verify: all site source files and deployed pages

- [ ] **Step 1: Ignore local visual-companion artefacts**

Add `.superpowers/` to `.gitignore` so design-preview sessions remain local.

- [ ] **Step 2: Run final local checks**

Run the profile contract, Prettier across every changed source file, Python YAML parsing for `_config.yml`, `_data/cv.yml`, and `_data/repositories.yml`, plus `git diff --check`.

- [ ] **Step 3: Commit and push**

```powershell
git add .gitignore
git commit -m "Ignore local design previews"
git push origin master
```

- [ ] **Step 4: Confirm GitHub Actions**

Wait for Deploy site, source link check, deployed-site link check, and Prettier to complete successfully for the pushed head SHA.

- [ ] **Step 5: Perform desktop browser QA**

At approximately 1280px width, inspect About, CV, Publications, Projects, each project page, and Code. Confirm no horizontal overflow, profile width near 220px, moderate title sizes, stable layout, visible focus/hover states, and normal-flow footer.

- [ ] **Step 6: Perform mobile browser QA**

At approximately 390px width, inspect the same pages. Confirm the mobile menu opens, links are reachable, the home hero stacks, cards use one column, and CV/publication content remains within the viewport.

- [ ] **Step 7: Click-test the deployed site**

Click desktop and mobile navigation, four project cards, the first Bib control, GitHub, LinkedIn, University of Auckland, and available DOI/HTML links. Record external anti-bot restrictions separately from broken links.

- [ ] **Step 8: Mark the final site for delivery**

Open `https://zackwang.cn/` in the in-app browser after every gate passes and leave the final desktop page visible.
