# Chan-Ye Ohh — Personal Website Design (Draft)

Status: **design + content outline only** (no implementation in this phase)

## Goal
Create a fast, faculty-search-committee-friendly personal site that:
- communicates research focus and independence quickly
- showcases key publications with visual thumbnails
- provides one-click access to CV and contact links
- is easy to maintain (add papers, talks, news)

## Primary Audiences
- Faculty search committees (skim-first, time-poor)
- Potential collaborators (topic-matching)
- Prospective students (fit + mentorship signal)

## Assets Reviewed (Available)
Source folder: `cy_ohh_assets/`

Headshot options:
- `headshots/chan-ye_ohh_airsea_300x350.jpg` (professional portrait from Air-Sea Interaction Lab people page; 300x350 so best for small avatar, not a large hero image)
- `headshots/citations.jpeg` (most “formal” look, but low-res 256x256; best as small avatar)
- `headshots/headshot_square_800.jpg` (+ circle/400 variants) (high-res, casual background)
- `headshots/stratlab_headshot_square_800.png` (+ circle/400 variants) (high-res, lab context)
- `headshots/stratlab_thesis_photo_square_800.png` (presentation context; not a headshot)

Headshot verdict (for faculty-job-market vibe):
- Best “professional portrait” composition: `headshots/chan-ye_ohh_airsea_300x350.jpg` (but too small to be a large hero image).
- Best current hero fallback (resolution + “research context”): `headshots/stratlab_headshot_square_800.png`.
- Still recommended: obtain a new 1200px+ professional headshot to replace both.

Publication visuals (good for thumbnails / research cards):
- `figures/JFM_2024_997_A43_Fig10_vorticity_trajectory.png`
- `figures/JFM_2024_997_A43_Fig2_experimental_setup.png`
- `figures/PRF_2022_024801_Fig1_regime_diagrams.png`
- `figures/PRF_2022_024801_Fig6_snapshots_DMD_modes.png`
- `figures/PRF_2022_024801_Fig13_TDMD_example.png`

Publication PDFs + structured metadata:
- `metadata/publications.json`, `metadata/publications.bib`
- `pubs/Ohh_Spedding_2024_JFM_997_A43.pdf` (Open Access CC BY 4.0 per `metadata/README.md`)
- `pubs/Ohh_Spedding_2022_PRF_024801.pdf` (APS ©; likely OK for author personal site, confirm)

## Key Constraints / Gaps
- No official CV PDF included (only `metadata/cv_stub.md` summary).
- No teaching/mentoring/service content included.
- Education details are incomplete (we have a PhD defense date, but not dissertation title / official degree date / prior degrees).
- Current “official” title string and lab/PI affiliation for homepage needs confirmation (public pages vary).
- Most paper figures include page headers/captions; for web thumbnails we should crop/clean later.
- Best-looking “formal” headshot is low-resolution; ideally replace with a high-res professional photo.

Web research notes and remaining info gaps are tracked in:
- `docs/plans/2026-03-03-chan-ye-ohh-missing-info-web-research.md`

## Hosting (GitHub Pages)
Assumption: the site will be hosted on **GitHub Pages** (static hosting).

Implications for implementation later:
- Must be fully static (no server-side code required to render pages).
- Be careful with base paths if the site is served from `/<repo>/` instead of a custom domain.
- Prefer relative/portable asset links and a predictable output directory.
- If using a build output folder (e.g., `dist/`), deploy via GitHub Actions or a `gh-pages` branch; add `.nojekyll` if needed to prevent Jekyll processing.

## Information Architecture (3 Approaches)

Decision: **Approach A selected** (confirmed 2026-03-03).

### Approach A (Recommended): 1-page home + 2–3 deep pages
Nav:
- Home
- Research
- Publications
- CV
- Contact

Why:
- Home handles skim-readers.
- Research/Publications pages support deeper evaluation and citations.
- Easy to grow without turning Home into a wall of text.

### Approach B: Single-page scrolling site (anchors only)
Pros:
- Simple, “everything in one place”
Cons:
- Long-scroll fatigue, weaker SEO for research themes, harder to keep tidy as content grows

### Approach C: Publication-first (for strong paper record)
Pros:
- Immediately demonstrates output/impact
Cons:
- Can undersell teaching, future direction, and broader framing

## Page Layouts (Wireframe-Level)

### Home (`/`)
Above the fold (desktop):
- Left: Name + title line + 1-sentence research focus + 3 quick-link buttons
  - Buttons: `CV (PDF)`, `Email`, `Google Scholar`
- Right: Headshot (circle crop), with subtle “ocean stratification” gradient behind it

Below the fold:
- “Research snapshot” (3 cards)
  - Card image: one of the provided figures (or a cropped detail)
  - Card text: 2 lines max + “Learn more”
- “Selected publications” (3 items)
  - Each item: thumbnail + citation + 1-sentence contribution + DOI/PDF links
- “Affiliation + contact” strip
  - ORCID, LinkedIn, ResearchGate, Scripps profile

### Research (`/research`)
Structure:
- 1-paragraph overview (what, why it matters, why now)
- 3 themes (sections)
  - Suggested themes (based on current assets): stratified wakes; data-driven/modal decomposition (DMD); regime identification from limited measurements
  - Optional 3rd/4th theme (if relevant to current postdoc work): mesoscale eddies / air-sea interaction (would need new visuals)
  - Theme header + “methods” bullet list + “recent results” bullet list
  - “Representative work” links to the relevant papers
- Optional: “Future directions” block (3 bullets, intentionally high-level)

Visuals:
- Use figure crops as section headers (very subtle, low opacity) or as right-rail images.

### Publications (`/publications`)
Structure:
- “Selected” (3–5) at top, with thumbnails and short summaries
- “All publications” list below
  - Group by year
  - Each item shows: authors, title, venue, DOI, PDF, bibtex

Notes:
- Pull list from `metadata/publications.json`.
- Add an optional toggle: “show abstracts” (collapsed by default).

### CV (`/cv`)
Structure:
- Primary: embedded PDF viewer + download link
- Fallback: a simple HTML/Markdown version

Until a real CV is available:
- Display the `metadata/cv_stub.md` content as a placeholder with a prominent “Replace with official CV” note.

### Contact (`/contact`)
Structure:
- Short invitation line (collaboration, prospective students)
- Email (prefer current institutional email)
- ORCID + Google Scholar + LinkedIn

## Optional Pages (Faculty Search Add-Ons)
Not required for v1, but commonly expected during faculty hiring:
- Teaching (`/teaching`): teaching interests + courses supported + mentoring philosophy + example materials.
- Students (`/students`): what projects are available, what background helps, how to contact.
- Talks (`/talks`): invited talks + conference presentations + recordings when available.
- Service (`/service`): reviewing, committees, outreach.

## Visual Direction
Tone: clean, ocean-adjacent, research-forward, not “startup.”

Color system (suggested):
- Base: deep navy + off-white
- Accents: seafoam/teal + a restrained warm accent (from the vorticity colormap)
- Avoid heavy rainbow gradients; use them only inside research figures.

Typography (suggested):
- Headings: a sharp serif (e.g., Fraunces or Source Serif) for “academic gravity”
- Body/UI: a neutral sans (e.g., Source Sans 3 or IBM Plex Sans) for readability

Motif:
- Subtle contour-line or internal-wave pattern in backgrounds (very low contrast).
- Use generous whitespace and strong section headings for skimmability.

## Content Modules (Reusable Components)
- Hero block (name, title, links, headshot)
- Research theme card (image + 2-line summary)
- Publication card (thumbnail, citation, links, 1-sentence contribution)
- “Links” row (ORCID/Scholar/LinkedIn/etc.)
- Short callout (e.g., “Open to collaborations in …”)

## Accessibility / UX Requirements
- High contrast text, visible focus states, keyboard navigable nav
- Alt text for all images (especially research figures)
- Motion: minimal and meaning-driven (staggered reveals only if it doesn’t distract)
- Performance: optimize images, lazy-load below-the-fold figures

## Suggested Asset Usage (Concrete)
- Default avatar: `headshots/chan-ye_ohh_airsea_300x350.jpg` (display small to avoid pixelation)
- Backup avatar: `headshots/citations.jpeg` (only if rendered small, 96–128 px)
- Default hero/headshot for larger display (until a high-res professional headshot is provided): `headshots/stratlab_headshot_square_800.png`
- Research card images:
  - Stratification effects / near-wake geometry: `figures/JFM_2024_997_A43_Fig10_vorticity_trajectory.png`
  - Experimental setup / measurement: `figures/JFM_2024_997_A43_Fig2_experimental_setup.png` (crop to diagram area later)
  - DMD / data-driven identification: `figures/PRF_2022_024801_Fig6_snapshots_DMD_modes.png`

## Immediate Next Inputs Needed From Chan-Ye
- Preferred name display on the site: **Chan-Ye Ohh** (confirmed 2026-03-03)
- Official CV PDF
- 2–4 sentence “research vision” paragraph for the Home page
- One high-res, professional headshot (ideal: 1200px+ square crop)

## Implementation Status (Executed 2026-03-03)
Implemented static website files:
- `index.html`
- `research.html`
- `publications.html`
- `cv.html`
- `contact.html`
- `styles.css`
- `main.js`

Implemented GitHub Pages deployment artifacts:
- `.github/workflows/pages.yml`
- `.nojekyll`

Implemented verification:
- `tests/site_structure_test.sh` (passes after implementation)
- `tests/local_refs_test.sh` (passes after implementation)

## TODOs (With Source Files To Edit)
Goal: make it obvious what to change and **where** (which source file) to change it.

Content TODOs:
- [ ] Add/confirm the 2–4 sentence research vision paragraph.  
  Edit: `docs/plans/2026-03-03-chan-ye-ohh-prose-copy.md` (Research Page Overview)  
  Also update: `docs/plans/2026-03-03-chan-ye-ohh-site-copy-draft.md` (placeholder `[[RESEARCH_VISION_2_4_SENTENCES]]`)
- [ ] Decide the official homepage title line (MPL “Postdoctoral Scholar” vs lab “Postdoctoral Researcher”).  
  Edit: `docs/plans/2026-03-03-chan-ye-ohh-prose-copy.md` (Home Hero variants)  
  Also update: `docs/plans/2026-03-03-chan-ye-ohh-site-copy-draft.md` (Home Hero)
- [ ] Provide CV PDF link/path.  
  Edit: `docs/plans/2026-03-03-chan-ye-ohh-site-copy-draft.md` (placeholder `[[CV_PDF_LINK]]`)
- [ ] Confirm whether to name the Scripps PI/group on the site (and exact wording).  
  Edit: `docs/plans/2026-03-03-chan-ye-ohh-site-copy-draft.md` (placeholder `[[SCRIPPS_PI_OR_GROUP]]`)  
  Also update: `docs/plans/2026-03-03-chan-ye-ohh-prose-copy.md` (Home Short About optional line)
- [ ] Teaching/mentoring/service blurbs (even brief; helpful for faculty applications).  
  Edit: `docs/plans/2026-03-03-chan-ye-ohh-prose-copy.md` (Optional Teaching section)  
  Optional add-on: extend `docs/plans/2026-03-03-chan-ye-ohh-site-copy-draft.md` with `/teaching` and `/service` pages.
- [ ] Headshot: default to `cy_ohh_assets/headshots/chan-ye_ohh_airsea_300x350.jpg` for a small avatar; replace with a 1200px+ professional headshot when available.  
  Edit: `docs/plans/2026-03-03-chan-ye-ohh-site-copy-draft.md` (Headshot line under Home Hero)

Evidence / verification TODOs:
- [ ] Confirm any additional publications/preprints (2025–2026) not in the asset kit.  
  Track: `docs/plans/2026-03-03-chan-ye-ohh-missing-info-web-research.md` (Publications open items)
- [ ] Confirm whether there is a reusable public recording for the PRF Journal Club talk (APS page is blocked from automated access).  
  Track: `docs/plans/2026-03-03-chan-ye-ohh-missing-info-web-research.md` (Media / Video)

Hosting / deployment TODOs (GitHub Pages; for implementation later):
- [ ] Confirm the GitHub Pages publishing mode (custom domain vs `/<repo>/` path) so we can set the correct base path.  
  Edit: `docs/plans/2026-03-03-chan-ye-ohh-website-design.md` (Hosting section)
- [x] Add an automated Pages deploy workflow once the site is implemented.  
  Create: `.github/workflows/pages.yml` (build + deploy)  
  Optional: create `.nojekyll` at the published root if the output contains directories starting with `_` (completed).
