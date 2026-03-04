# Website Improvements Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Fix content mistakes, improve scientific narrative, upgrade TODO system, and polish design for the static HTML site at `/Users/ollie/Documents/website/`.

**Architecture:** Pure HTML/CSS/JS edits across 7 existing files. No new files, frameworks, or dependencies. Changes are grouped to minimize merge conflicts: CSS first, then page-by-page content fixes.

**Tech Stack:** Static HTML5, vanilla CSS, vanilla JavaScript. No build tools.

---

### Task 1: Add TODO and Badge CSS to styles.css

**Files:**
- Modify: `styles.css` (append new classes at end, before `@media` blocks)

**Step 1: Add TODO callout styles**

Insert before the `@media (max-width: 900px)` block in `styles.css`:

```css
/* -- TODO callouts -------------------------------------------------- */

.todo {
  background: #fff8e1;
  border-left: 4px solid #f9a825;
  border-radius: 0 8px 8px 0;
  padding: 0.9rem 1rem;
  margin: 1rem 0;
}

.todo__file {
  display: inline-block;
  font-family: 'SFMono-Regular', 'Consolas', 'Liberation Mono', monospace;
  font-size: 0.8rem;
  background: rgba(0, 0, 0, 0.06);
  padding: 0.15rem 0.5rem;
  border-radius: 4px;
  margin-bottom: 0.35rem;
}

.todo__text {
  margin: 0.35rem 0 0;
  color: #5f371f;
  font-size: 0.95rem;
}

/* -- Badges --------------------------------------------------------- */

.badge {
  display: inline-block;
  font-size: 0.72rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.03em;
  padding: 0.18rem 0.5rem;
  border-radius: 4px;
  color: #fff;
  vertical-align: middle;
}

.badge--accent {
  background: #d4a574;
}

.badge--teal {
  background: var(--sea);
}
```

**Step 2: Add mobile hamburger styles**

Insert inside the existing `@media (max-width: 900px)` block:

```css
  .nav-toggle {
    display: flex;
    align-items: center;
    justify-content: center;
    background: none;
    border: none;
    cursor: pointer;
    width: 2.2rem;
    height: 2.2rem;
    padding: 0;
  }

  .nav-toggle svg {
    width: 1.5rem;
    height: 1.5rem;
    color: var(--deep);
  }

  nav ul {
    display: none;
    flex-direction: column;
    position: absolute;
    top: 100%;
    right: 1rem;
    background: var(--surface);
    border: 1px solid var(--line);
    border-radius: 12px;
    box-shadow: var(--shadow);
    padding: 0.5rem;
    min-width: 160px;
  }

  nav ul.is-open {
    display: flex;
  }

  .header-wrap {
    position: relative;
  }
```

Also add outside all media queries (after the `.reveal.in-view` block):

```css
.nav-toggle {
  display: none;
}
```

**Step 3: Verify styles load**

Open `index.html` in browser, confirm no CSS errors in console.

**Step 4: Commit**

```bash
git add styles.css
git commit -m "feat: add TODO callout, badge, and mobile nav styles"
```

---

### Task 2: Add hamburger toggle to main.js and all page headers

**Files:**
- Modify: `main.js`
- Modify: `index.html`, `research.html`, `publications.html`, `cv.html`, `contact.html` (header only)

**Step 1: Add hamburger button to all pages**

In every HTML file, replace the `<nav>` block inside `<header>`:

```html
      <nav aria-label="Primary">
        <ul>
```

with:

```html
      <button class="nav-toggle" aria-label="Toggle navigation" aria-expanded="false">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round">
          <line x1="3" y1="6" x2="21" y2="6"/>
          <line x1="3" y1="12" x2="21" y2="12"/>
          <line x1="3" y1="18" x2="21" y2="18"/>
        </svg>
      </button>
      <nav aria-label="Primary">
        <ul>
```

This adds the button before `<nav>` in all 5 pages.

**Step 2: Add toggle logic to main.js**

Append before the closing `})();`:

```javascript
  // Mobile nav toggle
  const toggle = document.querySelector('.nav-toggle');
  const navList = document.querySelector('nav ul');
  if (toggle && navList) {
    toggle.addEventListener('click', () => {
      const open = navList.classList.toggle('is-open');
      toggle.setAttribute('aria-expanded', String(open));
    });
    document.addEventListener('click', (e) => {
      if (!toggle.contains(e.target) && !navList.contains(e.target)) {
        navList.classList.remove('is-open');
        toggle.setAttribute('aria-expanded', 'false');
      }
    });
  }
```

**Step 3: Test at narrow viewport**

Resize browser to 375px wide. Confirm hamburger appears and toggles nav dropdown.

**Step 4: Commit**

```bash
git add main.js index.html research.html publications.html cv.html contact.html
git commit -m "feat: add mobile hamburger navigation to all pages"
```

---

### Task 3: Fix index.html — hero, headshot, about, TODOs

**Files:**
- Modify: `index.html`

**Step 1: Fix hero section**

Replace the entire `<section class="hero reveal">` (lines 27-53) with:

```html
    <section class="hero reveal">
      <div class="hero-copy">
        <h1>Chan-Ye Ohh</h1>
        <p class="subhead">Postdoctoral Scholar, Marine Physical Laboratory, Scripps Institution of Oceanography, UC San Diego</p>
        <p>
          I combine laboratory experiments and data-driven analysis to understand how density stratification
          shapes fluid flows in the ocean. My work bridges wake dynamics, modal decomposition, and air-sea interaction.
        </p>
        <div class="hero-actions">
          <a class="btn btn-primary" href="cv.html">CV</a>
          <a class="btn btn-secondary" href="mailto:cohh@ucsd.edu">Email</a>
          <a class="btn btn-secondary" target="_blank" rel="noopener noreferrer" href="https://scholar.google.com/citations?user=3VvK59oAAAAJ&hl=en">Google Scholar</a>
        </div>
        <div class="link-row" style="margin-top:1rem;">
          <a target="_blank" rel="noopener noreferrer" href="https://orcid.org/0000-0002-7313-4291">ORCID</a>
          <a target="_blank" rel="noopener noreferrer" href="https://scripps.ucsd.edu/profiles/cohh">Scripps Profile</a>
          <a target="_blank" rel="noopener noreferrer" href="https://www.linkedin.com/in/chrischanyeohh">LinkedIn</a>
          <a target="_blank" rel="noopener noreferrer" href="https://www.researchgate.net/profile/Chan-Ye-Ohh">ResearchGate</a>
        </div>
      </div>
      <figure class="hero-card reveal">
        <img loading="eager" src="cy_ohh_assets/headshots/citations.jpeg" alt="Chan-Ye Ohh">
      </figure>
    </section>
```

Changes: corrected title/affiliation, broadened hero copy, swapped headshot to `citations.jpeg`, removed figcaption dev note, CV button links to cv.html (not disabled).

**Step 2: Rewrite About section**

Replace the About section (lines 55-66) with:

```html
    <section class="reveal" aria-labelledby="about-heading">
      <h2 id="about-heading" class="section-head">About</h2>
      <p class="section-intro">
        I am a postdoctoral scholar in the Marine Physical Laboratory at Scripps Institution of
        Oceanography, UC San Diego, working in the Air-Sea Interaction Laboratory. My research combines
        laboratory experiments and data-driven analysis to understand how density stratification shapes
        fluid flows in the ocean.
      </p>
      <p class="section-intro">
        I received my PhD from the University of Southern California in 2023, where I worked with
        Prof. Geoffrey Spedding in the Stratified Fluids Laboratory. My dissertation focused on the
        wakes generated by bluff bodies moving through stratified environments &mdash; a problem with
        direct connections to underwater vehicle hydrodynamics and oceanic turbulence. Using towed
        experiments in a large stratified water tank and dynamic mode decomposition (DMD), I developed
        new approaches for identifying and classifying wake regimes from limited flow measurements.
      </p>
      <div class="todo">
        <span class="todo__file">index.html</span>
        <p class="todo__text">
          Add a paragraph about your current research in the Air-Sea Interaction Laboratory
          with Luc Lenain &mdash; e.g., surface wave dynamics, air-sea fluxes, upper ocean
          turbulence, wave breaking, or remote sensing.
        </p>
      </div>
      <div class="todo">
        <span class="todo__file">index.html</span>
        <p class="todo__text">
          Add a forward-looking paragraph for faculty applications, e.g.: &ldquo;My research
          program aims to bridge lab-scale stratified flow experiments with field observations,
          developing new measurement and data-driven techniques for understanding ocean mixing
          and transport processes.&rdquo;
        </p>
      </div>
    </section>
```

**Step 3: Verify in browser**

Open `index.html`. Confirm: corrected title, new headshot, no figcaption, expanded About with yellow TODO callouts showing file paths, CV button links to cv.html.

**Step 4: Commit**

```bash
git add index.html
git commit -m "fix: correct hero title/headshot, expand About with Scripps context and TODOs"
```

---

### Task 4: Fix research.html — add Air-Sea theme, replace notices with TODOs

**Files:**
- Modify: `research.html`

**Step 1: Replace the intro notice with a TODO**

Replace the intro section (lines 27-38) with:

```html
    <section class="reveal">
      <h1 class="section-head" style="margin-top:0;">Research</h1>
      <p class="section-intro">
        I study how stable density stratification changes the structure and evolution of wakes. My work combines
        experimental fluid mechanics with data-driven, interpretable analysis to extract coherent dynamics and identify
        wake regimes across parameter space. I am interested in methods that connect physical mechanisms to measurements
        and support robust inference in geophysical and environmental flow contexts.
      </p>
      <div class="todo">
        <span class="todo__file">research.html</span>
        <p class="todo__text">
          Replace the paragraph above with a 2&ndash;4 sentence research vision statement that
          connects your PhD foundations (stratified wakes, DMD) with your current postdoc direction
          (air-sea interaction) and future faculty research program.
        </p>
      </div>
    </section>
```

**Step 2: Add Air-Sea Interaction theme**

Insert a new section after the Theme 3 (regime) section and before the Future Directions section:

```html
    <section id="theme-airsea" class="reveal" aria-labelledby="theme-airsea-title">
      <article class="panel">
        <h2 id="theme-airsea-title">Theme 4: Air-Sea Interaction</h2>
        <div class="todo">
          <span class="todo__file">research.html</span>
          <p class="todo__text">
            Describe your current postdoctoral research with Luc Lenain in the Air-Sea Interaction
            Laboratory. Topics may include: surface wave dynamics, air-sea fluxes, upper ocean
            turbulence, wave breaking, remote sensing, or instrumentation. Add a figure when available.
          </p>
        </div>
        <div class="link-row">
          <strong>Lab:</strong>&nbsp;
          <a target="_blank" rel="noopener noreferrer" href="https://airsea.ucsd.edu/">Air-Sea Interaction Laboratory</a>
        </div>
      </article>
    </section>
```

**Step 3: Replace Future Directions with TODO**

Replace the Future Directions section (lines 105-112) with:

```html
    <section class="panel reveal" aria-labelledby="future-title">
      <h2 id="future-title">Future Directions</h2>
      <div class="todo">
        <span class="todo__file">research.html</span>
        <p class="todo__text">
          Write 3&ndash;5 future direction bullet points that reflect your actual research
          trajectory, including both PhD-era work and your current postdoc direction. These
          should support a faculty application narrative.
        </p>
      </div>
    </section>
```

**Step 4: Add Air-Sea card to index.html Research Snapshot**

In `index.html`, inside the `.cards` div in the Research Snapshot section, add a 4th card after the existing 3:

```html
        <article class="card">
          <div class="card-body">
            <h3>Air-Sea Interaction</h3>
            <div class="todo">
              <span class="todo__file">index.html</span>
              <p class="todo__text">Add a summary and figure for your Air-Sea Interaction research.</p>
            </div>
            <div class="link-row"><a href="research.html#theme-airsea">Learn more</a></div>
          </div>
        </article>
```

**Step 5: Verify in browser**

Open `research.html`. Confirm: vision TODO at top, 4 themes (3 existing + Air-Sea with TODO), Future Directions with TODO. Open `index.html`, confirm 4th research card.

**Step 6: Commit**

```bash
git add research.html index.html
git commit -m "feat: add Air-Sea Interaction theme, replace notices with TODOs"
```

---

### Task 5: Fix publications.html — add badges

**Files:**
- Modify: `publications.html`

**Step 1: Add badges to Selected Publications cards**

In the JFM 2024 card (first card), add an Open Access badge after the `<h3>`:

```html
            <h3>JFM (2024) <span class="badge badge--teal">Open Access</span></h3>
```

In the PRF 2022 DMD card (second card), update the `<h3>`:

```html
            <h3>PRF (2022) <span class="badge badge--accent">Editor's Suggestion</span></h3>
```

**Step 2: Add badge to Complete Publication List**

In the second `pub-item` (PRF 2022 DMD, lines 89-100), update the `<h3>`:

```html
          <h3>2022 | Physical Review Fluids <span class="badge badge--accent">Editor's Suggestion</span></h3>
```

In the first `pub-item` (JFM 2024, lines 77-88), update:

```html
          <h3>2024 | Journal of Fluid Mechanics <span class="badge badge--teal">Open Access</span></h3>
```

**Step 3: Replace the bottom notice**

Replace the `.notice` at the end (lines 125-127) with:

```html
      <p class="section-intro" style="margin-top:1rem; font-size:0.9rem;">
        This list reflects publications available through the current CV and archive materials.
      </p>
```

This keeps the informational text but removes the TODO-like orange styling.

**Step 4: Verify in browser**

Open `publications.html`. Confirm badges appear on the correct papers.

**Step 5: Commit**

```bash
git add publications.html
git commit -m "feat: add Editor's Suggestion and Open Access badges to publications"
```

---

### Task 6: Fix cv.html — correct title, add TODOs

**Files:**
- Modify: `cv.html`

**Step 1: Replace the entire `<main>` content**

Replace everything inside `<main class="page-wrap">` with:

```html
    <section class="reveal">
      <h1 class="section-head" style="margin-top:0;">Curriculum Vitae</h1>
      <p class="section-intro">A full CV PDF will be posted here. Until then, this page provides a short web-ready summary.</p>
      <div class="todo">
        <span class="todo__file">cv.html</span>
        <p class="todo__text">
          Upload your CV PDF and replace the disabled button below with a direct download link.
        </p>
      </div>
      <div class="hero-actions" style="margin-top:1rem;">
        <a class="btn btn-primary disabled" aria-disabled="true" href="#">Download CV (coming soon)</a>
      </div>
    </section>

    <section class="split reveal" aria-labelledby="current-role-title">
      <article class="panel">
        <h2 id="current-role-title">Current Role</h2>
        <ul>
          <li>Postdoctoral Scholar, Marine Physical Laboratory, Scripps Institution of Oceanography, UC San Diego</li>
          <li>Lab: Air-Sea Interaction Laboratory (PI: Luc Lenain)</li>
        </ul>
        <div class="todo">
          <span class="todo__file">cv.html</span>
          <p class="todo__text">Add employment start date and any additional current roles.</p>
        </div>
      </article>
      <article class="panel">
        <h2>Education</h2>
        <ul>
          <li>PhD, University of Southern California (defended August 17, 2023)</li>
        </ul>
        <div class="todo">
          <span class="todo__file">cv.html</span>
          <p class="todo__text">Add dissertation title, degree conferral date, and any additional degrees (BS/MS).</p>
        </div>
      </article>
    </section>

    <section class="split reveal" aria-labelledby="research-areas-title">
      <article class="panel">
        <h2 id="research-areas-title">Research Areas</h2>
        <ul>
          <li>Stratified wakes</li>
          <li>Dynamic mode decomposition (DMD)</li>
          <li>Experimental fluid mechanics</li>
          <li>Air-sea interaction</li>
          <li>Geophysical and environmental flow inference</li>
        </ul>
      </article>
      <article class="panel">
        <h2>Identifiers and Profiles</h2>
        <ul>
          <li>ORCID: <a target="_blank" rel="noopener noreferrer" href="https://orcid.org/0000-0002-7313-4291">0000-0002-7313-4291</a></li>
          <li>Google Scholar: <a target="_blank" rel="noopener noreferrer" href="https://scholar.google.com/citations?user=3VvK59oAAAAJ&hl=en">profile</a></li>
          <li>Scripps profile: <a target="_blank" rel="noopener noreferrer" href="https://scripps.ucsd.edu/profiles/cohh">cohh</a></li>
        </ul>
      </article>
    </section>

    <section class="panel reveal" aria-labelledby="selected-cv-pubs-title">
      <h2 id="selected-cv-pubs-title">Selected Publications</h2>
      <ul>
        <li>Ohh and Spedding (2024), <em>Journal of Fluid Mechanics</em>, 997, A43.</li>
        <li>Ohh and Spedding (2022), <em>Physical Review Fluids</em>, 7, 024801. <span class="badge badge--accent">Editor's Suggestion</span></li>
        <li>Chinta, Ohh, Spedding, and Luhar (2022), <em>Physical Review Fluids</em>, 7, 033803.</li>
      </ul>
      <div class="link-row"><a href="publications.html">View full publication list</a></div>
    </section>

    <section class="panel reveal" aria-labelledby="presentations-title">
      <h2 id="presentations-title">Presentations</h2>
      <ul>
        <li>C.-Y. Ohh (2024). APS Division of Fluid Dynamics Meeting (DFD24), Salt Lake City, UT. <em>(Oral)</em></li>
        <li>C.-Y. Ohh and G. R. Spedding (2023). APS DFD, Washington, DC. <em>(Oral)</em></li>
        <li>C.-Y. Ohh and G. R. Spedding (2022). APS DFD, Indianapolis, IN. <em>(Oral)</em></li>
        <li>C.-Y. Ohh and G. R. Spedding (2021). APS DFD, Phoenix, AZ. <em>(Poster)</em></li>
        <li>C.-Y. Ohh and G. R. Spedding (2019). APS DFD, Seattle, WA. <em>(Oral)</em></li>
        <li>C.-Y. Ohh et al. (2016). APS DFD, Portland, OR. <em>(Poster)</em></li>
      </ul>
      <div class="todo">
        <span class="todo__file">cv.html</span>
        <p class="todo__text">Add talk titles and verify this list is complete.</p>
      </div>
    </section>

    <section class="panel reveal" aria-labelledby="awards-title">
      <h2 id="awards-title">Awards</h2>
      <ul>
        <li>APS Division of Fluid Dynamics Poster Award (2021)</li>
      </ul>
      <div class="todo">
        <span class="todo__file">cv.html</span>
        <p class="todo__text">Add any additional awards, fellowships, or honors.</p>
      </div>
    </section>
```

Changes: corrected role to "Postdoctoral Scholar", added PI/lab info, added "air-sea interaction" to research areas, removed "pending confirmation" text, added Presentations section (6 APS DFD talks), added Awards section (2021 poster award), added Editor's Suggestion badge, replaced all `.notice` boxes with `.todo` callouts.

**Step 2: Verify in browser**

Open `cv.html`. Confirm corrected title, TODOs with file paths, presentations, awards.

**Step 3: Commit**

```bash
git add cv.html
git commit -m "fix: correct CV title, add presentations/awards, replace notices with TODOs"
```

---

### Task 7: Fix contact.html — broaden scope

**Files:**
- Modify: `contact.html`

**Step 1: Update intro and collaboration text**

Replace the intro paragraph (line 30-32):

```html
      <p class="section-intro">
        I welcome conversations about fluid mechanics, ocean dynamics, and data-driven methods
        for experimental and geophysical flows.
      </p>
```

Replace the Collaboration section (lines 56-62):

```html
    <section class="panel reveal" aria-labelledby="collab-title">
      <h2 id="collab-title">Collaboration</h2>
      <p>
        If your group is working on stratified flow physics, air-sea interaction, modal decomposition
        methods, surface wave dynamics, or data-driven approaches for ocean measurements, feel free to reach out.
      </p>
      <div class="todo">
        <span class="todo__file">contact.html</span>
        <p class="todo__text">
          Revise collaboration interests to reflect your current and planned research directions.
        </p>
      </div>
    </section>
```

**Step 2: Update affiliation in Primary Contact**

In the contact list, replace:

```html
          <li><strong>Affiliation:</strong> Scripps Institution of Oceanography, UC San Diego</li>
```

with:

```html
          <li><strong>Affiliation:</strong> Marine Physical Laboratory, Scripps Institution of Oceanography, UC San Diego</li>
```

**Step 3: Verify in browser**

Open `contact.html`. Confirm broadened copy and TODO callout.

**Step 4: Commit**

```bash
git add contact.html
git commit -m "fix: broaden contact page scope to include postdoc research areas"
```

---

### Task 8: Visual verification

**Files:** None (read-only)

**Step 1: Desktop verification**

Open each page in browser at full width and verify:
- `index.html`: Corrected title, `citations.jpeg` headshot (no figcaption), expanded About with TODOs, 4 research cards, CV button links to cv.html
- `research.html`: Vision TODO, 4 research themes (Air-Sea with TODO), Future Directions with TODO
- `publications.html`: Open Access and Editor's Suggestion badges
- `cv.html`: Corrected role, presentations, awards, TODOs throughout
- `contact.html`: Broadened scope, TODO callout

**Step 2: Mobile verification**

Resize to 375px wide. Verify:
- Hamburger menu appears and toggles
- All content stacks to single column
- TODO callouts remain readable

**Step 3: Commit if any fixes needed**

```bash
git add -A
git commit -m "fix: visual polish from verification"
```

Only commit if changes were made during verification.
