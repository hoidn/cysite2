# Chan-Ye Ohh — Website Copy (Draft)

This is a **complete first-pass draft** for a multi-page academic website (Approach A). It is written in first person and should be reviewed by Chan-Ye for accuracy and preference.

## Remaining Placeholders / Confirmations
- `[[CV_PDF_LINK]]` Official CV PDF link/path
- `[[RESEARCH_VISION_2_4_SENTENCES]]` A short research vision paragraph (replace the default draft if desired)
- `[[SCRIPPS_PI_OR_GROUP]]` Current PI(s) / group name at Scripps (if you want it on the site)
- Replace the current avatar headshot with a high-resolution professional headshot when available.

---

## Global Elements

### Site Title (header / browser title)
Chan-Ye Ohh

### Short tagline (optional; header or homepage)
Stratified wakes • Experimental fluid mechanics • Data-driven modal decomposition (DMD)

### Primary navigation
- Home
- Research
- Publications
- CV
- Contact

### Footer (sitewide)
© Chan-Ye Ohh. Last updated [[YYYY-MM-DD]].

---

## Home (`/`)

### Hero
Hi, I’m **Chan-Ye Ohh**.

I am a **Postdoctoral Scholar** at **Scripps Institution of Oceanography (UC San Diego)**.

I study **stratified wakes** and develop **data-driven, interpretable methods** to identify and understand coherent structure in complex flows.

Buttons:
- CV (PDF): [[CV_PDF_LINK]]
- Email: `cohh@ucsd.edu`
- Google Scholar: `https://scholar.google.com/citations?user=3VvK59oAAAAJ&hl=en`

Secondary links:
- ORCID: `https://orcid.org/0000-0002-7313-4291`
- Scripps profile: `https://scripps.ucsd.edu/profiles/cohh`
- LinkedIn: `https://www.linkedin.com/in/chrischanyeohh`
- ResearchGate: `https://www.researchgate.net/profile/Chan-Ye-Ohh`

Headshot:
- `cy_ohh_assets/headshots/chan-ye_ohh_airsea_300x350.jpg` (display small to avoid pixelation; replace with a 1200px+ professional headshot when available)

### About
I work at the intersection of **stratified flows**, **wake dynamics**, and **data-driven modal decomposition**. My goal is to connect measurable features of wakes to physical mechanisms and to build analysis tools that remain reliable when measurements are limited or noisy.

[[SCRIPPS_PI_OR_GROUP]]

### Research Snapshot
Three themes:

1. **Stratification and near-wake dynamics**  
   How stable density stratification reshapes wake geometry, vortex organization, and internal-wave signatures.

2. **Dynamic mode decomposition for wake identification**  
   Using energetic modal content to classify wake regimes and build compact, interpretable descriptors.

3. **Regime identification from limited measurements**  
   Reduced sensing and sparse modeling approaches that support classification and inference in practical settings.

Link: “More on Research”

### Selected Publications
Show 3 entries with thumbnails and 1–2 sentence summaries (full list on Publications page).

1. **Ohh & Spedding (2024, JFM)**  
   *The effects of stratification on the near wake of 6:1 prolate spheroid.*  
   Experiments in uniform and stratified backgrounds quantify how stratification and pitch angle alter near-wake structure and internal-wave signatures, while later evolution converges toward established stratified-wake behavior.  
   Links: DOI `10.1017/jfm.2024.829` | PDF

2. **Ohh & Spedding (2022, Physical Review Fluids; Editors’ Suggestion)**  
   *Wake identification of stratified flows using dynamic mode decomposition.*  
   DMD-based features support automated classification of stratified wake regimes; we propose an algorithm that is robust when data quality and dimensionality are sufficient.  
   Links: DOI `10.1103/PhysRevFluids.7.024801` | PDF

3. **Chinta, Ohh, Spedding & Luhar (2022, Physical Review Fluids)**  
   *Regime identification for stratified wakes from limited measurements: a library-based sparse regression formulation.*  
   A sparse-regression framework identifies regimes from limited measurements by fitting observations to an interpretable library of candidate features.  
   Links: DOI `10.1103/PhysRevFluids.7.033803` | arXiv `2202.04119`

Link: “All Publications”

### Contact Strip
Email: `cohh@ucsd.edu`  
ORCID: `0000-0002-7313-4291`

---

## Research (`/research`)

### Overview
[[RESEARCH_VISION_2_4_SENTENCES]]

Default draft (replace as desired):
I study how **stable density stratification** changes the structure and evolution of wakes. I combine **experimental fluid mechanics** with **data-driven, interpretable analysis** to extract coherent dynamics and identify wake regimes across parameter space. My broader interest is in methods that connect physical mechanisms to measurements and enable robust inference in geophysical and environmental flow contexts.

### Theme 1: Stratified Wakes and Near-Wake Physics
Focus:
- How stratification modifies wake spacing, separation, and vortex organization
- How wake geometry and incidence affect downstream evolution
- How wakes generate internal-wave signatures in stratified environments

Methods:
- Controlled towing-tank experiments
- Parameter sweeps (Re, Fr, incidence/pitch)
- Quantitative wake metrics + scaling comparisons across bodies

Representative work:
- Ohh & Spedding (2024, JFM): stratification effects in the near wake of a prolate spheroid

### Theme 2: Modal Decomposition and Interpretable Signatures (DMD)
Focus:
- Extracting energetic coherent structures from time-resolved data
- Building compact descriptors for classification and comparison

Methods:
- Dynamic mode decomposition (DMD) and variants
- Feature selection from energetic modes
- Comparison across simulation/experiment data quality

Representative work:
- Ohh & Spedding (2022, PRF): wake identification of stratified flows using DMD

### Theme 3: Regime Identification from Limited Measurements
Focus:
- Classification when only partial sensing is available
- Modeling strategies that remain interpretable and physically grounded

Methods:
- Library-based sparse regression
- Reduced measurement strategies and validation against regime maps

Representative work:
- Chinta, Ohh, Spedding & Luhar (2022, PRF): limited-measurement regime identification

### Future Directions (Draft)
Replace with Chan-Ye’s preferred framing. Example bullets:
- Identify minimal measurement sets that reliably distinguish wake regimes in stratified environments.
- Connect near-wake structure to far-wake signatures and internal-wave radiation in realistic settings.
- Develop interpretable, uncertainty-aware models for regime identification and forecasting from observations.

---

## Publications (`/publications`)

### Intro
My work focuses on stratified wake dynamics and data-driven identification of flow regimes, with an emphasis on experiments and interpretable reduced-order analysis.

### Selected Publications

**2024 | Journal of Fluid Mechanics**  
Ohh, Chan-Ye and Spedding, Geoffrey R. “The effects of stratification on the near wake of 6:1 prolate spheroid.” *J. Fluid Mech.*, 997, A43.  
Links: DOI `10.1017/jfm.2024.829` | PDF | BibTeX

**2022 | Physical Review Fluids (Editors’ Suggestion)**  
Ohh, Chan-Ye and Spedding, Geoffrey R. “Wake identification of stratified flows using dynamic mode decomposition.” *Phys. Rev. Fluids*, 7, 024801.  
Links: DOI `10.1103/PhysRevFluids.7.024801` | PDF | BibTeX

**2022 | Physical Review Fluids**  
Chinta, Vamsi Krishna; Ohh, Chan-Ye; Spedding, Geoffrey; Luhar, Mitul. “Regime identification for stratified wakes from limited measurements: a library-based sparse regression formulation.” *Phys. Rev. Fluids*, 7, 033803.  
Links: DOI `10.1103/PhysRevFluids.7.033803` | arXiv `2202.04119` | BibTeX

### Other Publications

**2016 | APS Division of Fluid Dynamics Meeting (abstract)**  
Ohh, Chan-Ye; Huang, Yangyang; Wen, Ziteng; Kanso, Eva; Luhar, Mitul. “Leveraging fluid-structure interaction for passive control of flapping locomotion.”  
Links: APS abstract | PDF

---

## CV (`/cv`)

### CV
Download: [[CV_PDF_LINK]]

If CV PDF is not yet available:
I will post a complete CV PDF here. In the meantime, below is a short summary.

Short summary (placeholder):
- Postdoctoral Scholar, Scripps Institution of Oceanography (UC San Diego)
- Research: stratified wakes; experimental fluid mechanics; dynamic mode decomposition (DMD)
- ORCID: 0000-0002-7313-4291

---

## Contact (`/contact`)

### Get in touch
I welcome conversations about stratified flows, wake dynamics, and data-driven methods for experimental and geophysical fluid mechanics.

Email:
- `cohh@ucsd.edu`

Profiles:
- ORCID: `https://orcid.org/0000-0002-7313-4291`
- Google Scholar: `https://scholar.google.com/citations?user=3VvK59oAAAAJ&hl=en`
- LinkedIn: `https://www.linkedin.com/in/chrischanyeohh`
- ResearchGate: `https://www.researchgate.net/profile/Chan-Ye-Ohh`

Affiliation:
- Scripps Institution of Oceanography, UC San Diego (La Jolla, CA)
