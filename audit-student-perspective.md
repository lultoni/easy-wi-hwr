# Student Perspective Audit — easy-wi-hwr Template

**Date:** 2026-04-21 (updated after maintainer feedback)
**Persona:** A 2nd-semester HWR Berlin Wirtschaftsinformatik student who has never used Typst, has only written papers in Word, and just found this template on Typst Universe or GitHub. They follow the README top-to-bottom and try to produce their first PTB.

**Status legend:**
- ✅ Confirmed by maintainer — action needed
- 👍 Agreed by maintainer (no objection) — exists / should be fixed, no specific comment given
- ℹ️ Acknowledged — low priority or by-design (maintainer explicitly deprioritized)
- ❌ Dismissed — auditor error or not applicable
- 🔧 Fix already applied (this session)

---

## Table of Contents

1. [README & Onboarding](#1-readme--onboarding)
2. [Installation & Setup (Steps 1-3)](#2-installation--setup-steps-1-3)
3. [The main.typ Experience](#3-the-mainttyp-experience)
4. [Writing in Chapter Files](#4-writing-in-chapter-files)
5. [Abbreviations System](#5-abbreviations-system)
6. [Bibliography & Citations](#6-bibliography--citations)
7. [AI Tools Register](#7-ai-tools-register)
8. [Appendix System](#8-appendix-system)
9. [Glossary](#9-glossary)
10. [Confidentiality Notice (Sperrvermerk)](#10-confidentiality-notice-sperrvermerk)
11. [PDF Output Issues](#11-pdf-output-issues)
12. [English Language Support](#12-english-language-support)
13. [Pretty Mode & Logos](#13-pretty-mode--logos)
14. [The init.sh Script](#14-the-initsh-script)
15. [Error Messages & Troubleshooting](#15-error-messages--troubleshooting)
16. [Documentation Inconsistencies](#16-documentation-inconsistencies)
17. [Code-Level Observations](#17-code-level-observations)
18. [Missing Features a Student Would Expect](#18-missing-features-a-student-would-expect)

---

## 1. README & Onboarding

### 1.1 — Two READMEs with duplicated content but subtle differences 👍
- `README.md` (German) and `README-en.md` (English) are near-identical translations. Maintaining two full copies means they can drift.
- **Maintainer:** No objection — accepted as a reality of bilingual docs.

### 1.2 — README.md opens with an English block before German content ✅
- Lines 5-6 of `README.md` have a full English paragraph before the German content. This was originally required by Typst Universe moderator feedback.
- **Maintainer:** Now that `README-en.md` exists, the English duplicate can be removed. Maintainer wants to **merge** the English summary with the German intro and add a TOC below.
- **Follow-up action:** Rework `README.md` intro — combine the English summary text with the German introduction, remove standalone English paragraph, add an intra-page TOC below the intro. Mirror changes in `README-en.md`.

### 1.3 — "Was ist Typst?" section is good but could be stronger 👍
- A pure Word user might not understand "plain text files". The comparison to Word is helpful but a one-liner concrete example ("You type `= Einleitung` and it becomes a formatted heading") would help.
- **Maintainer:** No objection.

### 1.4 — No quickstart for the truly impatient 👍
- A "30-second quickstart" box at the top would help confident users.
- **Maintainer:** No objection.

### 1.5 — Version number hardcoded everywhere 👍
- `0.1.2` appears in ~10+ places (READMEs, main.typ, kapitel imports, init.sh). Manual sync on every bump.
- **Maintainer:** No objection. Known pain point, already tracked in `requirements/publishing.md`. The `publish.sh` script handles some of this.

---

## 2. Installation & Setup (Steps 1-3)

### 2.1 — Minimum Typst version unclear in practice 👍
- `typst.toml` says `0.13.1`, README shows version output `0.14.2`. The `mmdr` package may require a different version.
- **Maintainer:** No objection.

### 2.2 — ZIP download + script execution trust issue ✅
- The ZIP download path exists primarily for the `init.sh` script. Prior moderator/community feedback flagged that telling users to run a downloaded script is risky.
- **Maintainer:** "Critical, weil ich nicht zurückrudern will was eig von feedback mal 'gefixed' wurde." The README already tells users to review the script first and links to the specific commit. Keep as-is; the trust warning must stay.

### 2.3 — init.sh: German-only 👍
- The setup script is entirely in German. An English-speaking student cannot use it.
- **Maintainer:** No objection.

### 2.4 — init.sh generates `bibliography(title: "Literaturverzeichnis")` — dead code ✅
- `lib.typ` overrides the bibliography title via l10n. The generated `title:` parameter does nothing.
- **Maintainer:** Should be fixed.
- **Follow-up action:** Remove `title: "Literaturverzeichnis"` from init.sh bibliography generation (line ~488).

### 2.5 — init.sh doesn't import `gls`/`glspl` ✅
- Generated `main.typ` only imports `hwr, abk`, missing `gls, glspl`.
- **Maintainer:** Should be fixed.
- **Follow-up action:** Update init.sh import line to include all four: `hwr, abk, gls, glspl`.

### 2.6 — curl-pipe-to-bash pattern 👍
- The `bash <(curl ...)` line is inside a comment in the script itself, not in the README. Risk is minimal given the existing script review notice.
- **Maintainer:** No objection.

---

## 3. The main.typ Experience

### 3.1 — Overwhelming parameter list 👍
- 180 lines with extensive comments. Intimidating for a Word user but necessary for discoverability.
- **Maintainer:** No objection. The comments serve as inline docs.

### 3.2 — Three author syntaxes: README documents only one ✅
- Template supports top-level `name:`/`matrikel:`, bare dict, and array of dicts.
- The README parameter table only documents the array form. The example uses the top-level shorthand. The shorthand is **not in the README parameter tables at all**.
- **Follow-up action:** Add `name:` / `matrikel:` shorthand to the README parameter table with a note that it's equivalent to a single-author `authors:`.

### 3.3 — Trailing-comma trap for single-author dict 👍
- `authors: (name: "...", matrikel: "...")` (bare dict) vs `authors: ((name: "...", matrikel: "..."),)` (array). Template handles both, FAQ mentions it. Typst gotcha, not a template issue.
- **Maintainer:** No objection.

### 3.4 — `#show: hwr.with(...)` must be first 👍
- Documented in main.typ comments and FAQ. Typst fundamental, not fixable by template.
- **Maintainer:** No objection.

### 3.5 — `date: auto` shows today's date — clarification needed ℹ️
- **Maintainer asked:** "inwiefern ist das gefährlich?"
- **Explanation:** It's not dangerous, but it's a subtle gotcha. If a student compiles on Monday and the deadline is Tuesday, their PDF says Monday. If they recompile Tuesday morning for a fix, the date changes. For submission-critical documents where the date on the paper matters (and examiners check it), `auto` means the date depends on *when you last compiled*, not when you *intended* to submit. It's a convenience default that's fine for drafts but risky for final submission.
- **No action needed** — just something students should be aware of. The README already documents manual date entry.

### 3.6 — `field-of-study` defaults to "Wirtschaftsinformatik" 👍
- Correct for target audience. Other-programme students need to override it.
- **Maintainer:** No objection.

---

## 4. Writing in Chapter Files

### 4.1 — Chapter files 03-05 missing `#import abk` ✅
- `01_einleitung.typ` and `02_grundlagen.typ` have the import. `03_methodik.typ`, `04_ergebnisse.typ`, `05_fazit.typ` do not. Using `#abk()` in those files would fail.
- **Maintainer:** "wenn es hier einen universal fix gibt, dann mache das, sonst änder es so, dass jedes erstelltes chapter so eine import line hat"
- **Investigation:** There is no universal Typst mechanism to auto-import into included files. Each file that uses `abk` must import it.
- **Follow-up action:** Add `#import "@preview/easy-wi-hwr:0.1.2": abk` (and the local dev equivalent as comment) to `03_methodik.typ`, `04_ergebnisse.typ`, and `05_fazit.typ`. Also update init.sh to generate the import line in every chapter file.

### 4.2 — Chapter files have inconsistent header/comment styles ✅
- Some have imports + headers, others have just a one-line comment.
- **Follow-up action:** Standardize all chapter file headers (handled by 4.1 fix).

### 4.3 — `#lorem()` placeholder text is confusing for beginners 👍
- Typst-literate users understand it. The init.sh-generated chapters use "Schreibe hier deinen Text" which is better.
- **Maintainer:** No objection.

### ~~4.4 — Bold/italic syntax confusion~~ ❌ REMOVED
- Auditor error. Typst `*text*` = bold, `_text_` = italic. The README is correct. This point was wrong.

### 4.5 — No guidance on heading levels per chapter 👍
- Works correctly as-is. Could add a one-liner note but not urgent.
- **Maintainer:** No objection.

---

## 5. Abbreviations System

### 5.1 — `long:` parameter semantics: clarification ℹ️
- **Maintainer initially said:** "ja long ist doch nicht für das ausgeschribene sondern für mehrzahl oder?"
- **Investigation result:** No — `long:` IS for the full written-out form (Langform), NOT for plural. The function signature is `#let abk(key, long: none)`. When `long:` is provided, it overrides the dict lookup for the full form. There is **no plural support** in the abbreviation system at all.
- **The `api-design.md` shows wrong positional syntax** — see 16.2.
- **Maintainer to decide:** Is plural abbreviation support wanted in a future version?

### 5.2 — Abbreviation not defined → silent failure 👍
- If `#abk("XY")` is used but "XY" isn't in the dict, it just shows "XY" with no warning.
- **Maintainer:** No objection.

### 5.3 — "API" defined in dict but never used in example text 👍
- Dead weight in the example. Not a bug.
- **Maintainer:** No objection.

### 5.4 — Abbreviation links to the list entry 👍
- Undocumented but nice UX.
- **Maintainer:** No objection.

---

## 6. Bibliography & Citations

### 6.1 — `bibliography: bibliography("refs.bib")` reads like a tautology 👍
- Valid Typst, just confusing for beginners.
- **Maintainer:** No objection.

### 6.2 — init.sh generates dead `title:` parameter ✅
- Same as 2.4. The generated `title: "Literaturverzeichnis"` is silently ignored.
- **Follow-up action:** See 2.4.

### 6.3 — Only one bib entry actually cited 👍
- Standard BibTeX behavior. Could add a note to the README.
- **Maintainer:** No objection.

### 6.4 — `read()` for custom CSL is fragile 👍
- Edge case with BOM/whitespace. Unlikely in practice.
- **Maintainer:** No objection.

### 6.5 — `lang: "en"` doesn't auto-switch citation style 👍
- Documented behavior.
- **Maintainer:** No objection.

### 6.6 — Double bibliography heading in TOC ✅ CONFIRMED BUG
- **Maintainer initially doubted this:** "wo siehst du das?"
- **Investigation confirmed:** The `show heading: none` in `lib.typ:416` hides the bibliography's auto-generated heading *visually* but does NOT prevent it from registering in the `outline()`. The template creates its own heading "Literaturverzeichnis" via l10n (line 414), and the bibliography function also generates a heading (Typst default: "Bibliografie" in German). Both appear in the TOC — only the template's heading should appear.
- **Root cause:** `show heading: none` suppresses rendering but not outline registration. Need to use `show heading: it => { set heading(outlined: false); hide(it) }` or similar approach to prevent the auto-generated heading from registering in the TOC.
- **Follow-up action:** Fix the bibliography heading suppression in `lib.typ:416` to also exclude it from the outline/TOC. Potential approaches:
  1. `show heading: it => { }` (completely consume)
  2. Use `show heading: set heading(outlined: false)` + `show heading: none`
  3. Wrap in a scope that overrides outline behavior

### 6.7 — README doesn't explain that only cited sources appear in bibliography 👍
- Standard BibTeX behavior. A one-liner in the README would help beginners.
- **Maintainer:** No objection.

---

## 7. AI Tools Register

### 7.1 — Cross-reference to appendix is manual ✅
- `remarks: "Prompts: siehe Anhang 4"` — student must count appendix numbers manually. If they reorder, this breaks silently.
- **Maintainer:** "huge huge"
- **Follow-up action:** Brainstorm automatic cross-referencing for AI tools ↔ appendix. This is non-trivial in Typst (labels don't work across the parameter boundary) but could be explored. One approach: accept a label reference instead of a string for the `remarks` field.

### 7.2 — `bemerkungen:` alias not in README 👍
- Works but undocumented.
- **Maintainer:** No objection.

### 7.3 — Declaring AI tools has formal implications 👍
- No warning that filling `ai-tools:` changes the Ehrenwörtliche Erklärung. Could add a comment in main.typ.
- **Maintainer:** No objection.

---

## 8. Appendix System

### 8.1 — File naming (a_, b_) contradicts rendered numbers (1, 2, 3) 👍
- Intentional: letters are for filesystem ordering, numbers are the HWR format.
- **Maintainer:** No objection.

### 8.2 — 7 appendix entries for a 10-page PTB 👍
- These showcase diverse appendix types (text, data, images, code, mermaid). Not meant as a realistic PTB.
- **Maintainer:** No objection.

### 8.3 — No guidance on when to enable `show-appendix-toc` 👍
- Could add a hint like "consider for 5+ appendix entries".
- **Maintainer:** No objection.

### 8.4 — Both `include()` and `image()` work as appendix content 👍
- Flexibility is good but only `include()` is shown in the example.
- **Maintainer:** No objection.
- **Follow-up action (low priority):** Add a comment in main.typ showing `content: image(...)` as an alternative.

---

## 9. Glossary

### 9.1 — Glossary entirely commented out in example ✅
- No working glossary example anywhere. A student has to guess the format from comments.
- **Follow-up action:** Uncomment the glossary example in main.typ and add `#gls()` / `#glspl()` calls in at least one chapter file to demonstrate working usage.

### 9.2 — Glossary vs. Abbreviations distinction unclear in README 👍
- Only explained in `api-design.md`. The README parameter table description is too terse.
- **Maintainer:** No objection.
- **Follow-up action:** Add a brief explanation in the README.

### 9.3 — `gls()`/`glspl()` imported but never used ✅
- Same as 9.1.
- **Follow-up action:** See 9.1.

---

## 10. Confidentiality Notice (Sperrvermerk)

### 10.1 — `confidential: true` without `company:` is unvalidated ✅
- Bachelorarbeit doesn't require `company:`. If someone sets `confidential: true` on a Bachelorarbeit, the Sperrvermerk text will be missing the company name.
- **Follow-up action:** Add validation — error if `confidential` is set and `company` is `none`.

### 10.2 — Signature block code duplicated between declaration.typ and confidentiality.typ ✅
- Nearly identical code in both files.
- **Maintainer:** "na dann ziehen wir das raus in eine standardisierte sache"
- **Maintainer also asked:** "kann man generell noch mehr sachen standardisieren in diesem projekt?"
- **Follow-up action:** Extract signature-rendering code into a shared helper (e.g., `helper/signature.typ`). Also audit for other duplication opportunities across `pages/`. Candidates to check: date formatting patterns, page break + heading patterns, margin/font set rules that repeat.

---

## 11. PDF Output Issues

### 11.1 — Double bibliography entry in TOC ✅ CONFIRMED BUG
- See 6.6 for details. The template heading + the bibliography's auto-generated heading both appear in the TOC.
- **Follow-up action:** See 6.6.

### 11.2 — Abstract starts at page II (cover is invisible I) 👍
- Correct per HWR FMT-30. Not a bug.
- **Maintainer:** No objection.

### 11.3 — Page numbers missing in compliant mode 🔧 FIX APPLIED
- **Maintainer confirmed:** "ich sehe gerade, dass bei 'compliant' einfach gar keine seitennummer da steht??"
- **Root cause:** The v0.1.2 pretty-mode feature (commit df7b485) introduced `_page-header` with a conditional that had no `else` branch. When no logos were set (compliant mode), `_page-header` evaluated to `none`, and `set page(header: none)` suppressed automatic page number placement.
- **Fix applied this session:** Added `else { auto }` branch so `header: auto` preserves default page numbering when no logos are set. Also added a `numbering:` conditional to only suppress numbering when logos are active (since the logo header renders its own page number).
- **This is a regression from v0.1.2 — should be released as a patch.**

### ~~11.4 — No hyphenation visible~~ ❌ DISMISSED
- **Maintainer:** "also bei mir klappt hyphenation"
- Auditor error. Typst's `set text(lang: ...)` enables hyphenation by default. It works correctly.

### 11.5 — Table/figure captions auto-localize 👍
- Works correctly. Just undocumented.
- **Maintainer:** No objection.

---

## 12. English Language Support

### 12.1 — `lang: "en"` doesn't auto-switch `field-of-study` or citation style 👍
- Accepted. Field-of-study is user data, citation style is a separate choice.
- **Maintainer:** No objection.

### 12.2 — Declaration in English is legally untested ✅
- **Maintainer:** "ich dachte es steht in der readme, dass die declaration maybe sonst nicht legal ist - wir können auch einfach den default auf de stellen"
- **Follow-up action:** Consider changing `declaration-lang` default from `auto` to `"de"` so the declaration is always German (legally safe) unless explicitly overridden. Add a README note explaining why.

### 12.3 — `pretty-warning` l10n key defined but never used ✅
- Exists in both `de.ftl` and `en.ftl` but no template code references it.
- **Follow-up action:** Either use it (add a rendered warning when `style: "pretty"` is active) or remove it from both FTL files.

---

## 13. Pretty Mode & Logos

### 13.1 — README references `hwr-logo.png` but template ships `school-logo.svg` ✅
- README example: `image("images/hwr-logo.png")`. Template ships: `school-logo.svg`, `company-logo.svg`.
- **Follow-up action:** Update README examples to use the actual shipped filenames (`school-logo.svg`, `company-logo.svg`).

### 13.2 — `style: "pretty"` without logos = title decoration only 👍
- Documented behavior. Not confusing once you read the docs.
- **Maintainer:** No objection.

### 13.3 — Logo header moves page number from top-right to center 👍
- This is by design (number sits between the two logos). Could document it.
- **Maintainer:** No objection.

---

## 14. The init.sh Script

### 14.1 — Doesn't support group work 👍
- Single-author only. Group syntax shown as comment in generated file.
- **Maintainer:** No objection.

### 14.2 — Chapter names are hardcoded German 👍
- No language question in the script.
- **Maintainer:** No objection.

### 14.3 — No Matrikelnummer format validation 👍
- Accepts any string. Minor.
- **Maintainer:** No objection.

### 14.4 — Script link in README points to old commit hash ✅
- `README.md` line 125 links to commit `b896349...`, which is old.
- **Follow-up action:** Update the script link to point to the latest commit or use a branch-relative link.

### 14.5 — init.sh is missing many features from v0.1.2 ✅
- Missing: pretty mode, glossary, lang selection, heading-depth, declaration-lang, city, show-appendix-toc, group-signature, signature images, remarks field (only uses bemerkungen), `gls`/`glspl` imports.
- **Follow-up action:** Update init.sh to support all current template features. This is a larger effort — could be scoped as a separate task.

---

## 15. Error Messages & Troubleshooting

### 15.1 — Error messages are excellent 👍
- Clear, actionable messages. Among the best in Typst templates.
- **Maintainer:** No objection.

### 15.2 — Misspelled parameter names fail silently 👍
- Typst limitation — named parameters that don't match are silently ignored via `..rest`.
- **Maintainer:** No objection.

### 15.3 — No `heading-depth` range validation 👍
- Could add a check.
- **Maintainer:** No objection.

### 15.4 — No `lang` value validation 👍
- Only `"de"` and `"en"` supported. Could add validation.
- **Maintainer:** No objection.
- **Follow-up action:** Add validation that `lang` is `"de"` or `"en"`.

---

## 16. Documentation Inconsistencies

### 16.1 — api-design.md §1 shows `author:` (singular) instead of `authors:` (plural) ✅
- **Follow-up action:** Fix `api-design.md` §1 to use `authors:`.

### 16.2 — api-design.md §3 shows wrong inline `abk()` syntax ✅
- Shows positional `#abk("API", "Application Programming Interface")` but actual signature is `#abk("API", long: "Application Programming Interface")`.
- **Follow-up action:** Fix `api-design.md` §3 to use the correct named parameter syntax.

### 16.3 — CLAUDE.md phrasing of `chapters:` 👍
- Pedantic concern. Not misleading in practice.
- **Maintainer:** No objection.

### 16.4 — Example template doesn't trigger figure/table lists (< 5 entries) 👍
- By design — demonstrating the ≥5 threshold would require more content.
- **Maintainer:** No objection.

### 16.5 — "Lokale Entwicklung" section could confuse students 👍
- Clearly labeled. Low risk.
- **Maintainer:** No objection.

### 16.6 — `read()` not explained for CSL 👍
- Could add a one-liner.
- **Maintainer:** No objection.

---

## 17. Code-Level Observations

### 17.1 — `_abk-dict` state ordering 👍
- `setup-abbreviations` runs before body. No actual issue.
- **Maintainer:** No objection.

### 17.2 — Signature rendering duplication ✅
- See 10.2. To be extracted to shared helper.

### 17.3 — `_bibliography = bibliography` alias 👍
- Standard Typst workaround for name shadowing. Documented in code.
- **Maintainer:** No objection.

### 17.4 — No `.typstignore` file 👍
- `exclude` in `typst.toml` handles publishing. Not needed.
- **Maintainer:** No objection.

### 17.5 — `styles/` directory has only one file 👍
- Naming is fine.
- **Maintainer:** No objection.

### 17.6 — Heading show rule specificity 👍
- Typst resolves show rules in stack order (last wins for matching elements). The specific level-1/level-2 rules apply via `.where()` which is more specific than the generic `show heading`. Would need testing to confirm if there's an actual issue.
- **Maintainer:** No objection.

---

## 18. Missing Features a Student Would Expect

### 18.1 — No word/page count indicator 👍
- Acknowledged in `backlog.md` as v1.1 candidate.
- **Maintainer:** No objection.

### 18.2 — No Word output guidance ✅
- HWR requires Word + PDF (though maintainer says: "ich musste noch nie mehr als die pdf für meine PTBs abgeben").
- **Investigation:** HWR guidelines do mention Word+PDF for Bachelorarbeiten. For PTBs, examiners may accept PDF only.
- **Maintainer wants:** A Perplexity prompt to research the best Typst→Word conversion tools.
- **Follow-up action:** Research and add a brief section in the README about Word conversion options. **Perplexity prompt:**
  > "What are the best tools to convert Typst (.typ) files or Typst-generated PDFs to Microsoft Word (.docx) format in 2026? Compare approaches: direct Typst→DOCX conversion, PDF→DOCX conversion (Adobe Acrobat, online tools), Pandoc-based workflows. Which preserves formatting best for academic papers with figures, tables, citations, and a table of contents?"

### 18.3 — No draft/watermark mode ✅
- **Maintainer:** "lowkey smarte idee - das könnte man dann über sowas wie 'final: true' oder so wieder entfernen"
- **Follow-up action:** Brainstorm a `draft: true` parameter (default `false`) that overlays "ENTWURF" / "DRAFT" (l10n-aware) as a watermark on every page. Could also suppress the signature field in draft mode. The inverse (`final: true`) could remove it — but `draft: true` as opt-in is simpler and less risky (default = no watermark = final).

### 18.4 — No automatic source attribution under figures ✅
- HWR requires "Quelle: Eigene Darstellung" or "Quelle: Author (Year)" under figures.
- **Maintainer:** "lets brainstorm about this as well"
- **Follow-up action:** Brainstorm a `#quelle()` or source-attribution helper. Options:
  1. `#quelle()` → outputs "Quelle: Eigene Darstellung" (default)
  2. `#quelle("Mustermann", 2024)` → outputs "Quelle: Mustermann (2024)"
  3. `#quelle(cite: <mustermann2024>)` → outputs "Quelle: Mustermann (2024)" from bib
  4. Could be integrated into a custom figure wrapper: `#hwr-figure(image("..."), caption: [...], source: "eigen")`
  - The simplest approach is a standalone function that students put inside `caption: [... #quelle()]`.

### 18.5 — No blockquote formatting for long quotes ✅
- HWR FMT-07 requires long quotes (>40 words / >3 lines) to be single-spaced and indented.
- **Maintainer:** "ah really? didn't know that yet - ja dann müssen wir das wohl machen"
- **Follow-up action:** Implement a `#blockquote()` or configure Typst's built-in `#quote(block: true)` with:
  - Left indent (typically 1cm)
  - Single line spacing (1.0 instead of 1.5)
  - Same font size (12pt)
  - No quotation marks (academic style)
  - Verify exact HWR FMT-07 requirements before implementing.

### 18.6 — No Genderhinweis page ℹ️
- **Maintainer:** "ich sag sowas ist ja keine eigene komplette seite eigentlich sondern eher so ein satz in der einleitung"
- Correct — a Genderhinweis is typically just a sentence or small paragraph in the introduction, not a separate template page. Not something the template needs to provide. Students write it themselves.

---

## Summary: Top 10 Issues by Impact (Updated)

| Priority | Issue | Section | Type | Status |
|---|---|---|---|---|
| 1 | **Page numbers missing in compliant mode** (regression from v0.1.2 pretty mode) | 11.3 | Bug | 🔧 Fixed |
| 2 | **Double bibliography TOC entry** — both template heading + auto heading appear | 6.6, 11.1 | Bug | ✅ Needs fix |
| 3 | **Chapter files 03-05 missing `#import abk`** — breaks abbreviation usage | 4.1 | Bug | ✅ Needs fix |
| 4 | **init.sh outdated** — missing 13+ features from v0.1.2, dead code, wrong imports | 14.5, 2.4, 2.5 | Staleness | ✅ Needs fix |
| 5 | **api-design.md wrong `abk()` syntax + wrong `author:` field name** | 16.1, 16.2 | Doc bug | ✅ Needs fix |
| 6 | **AI tools cross-reference to appendix is manual** — breaks on reorder | 7.1 | UX gap | ✅ Needs brainstorm |
| 7 | **Blockquote formatting missing** — HWR FMT-07 requires indent + single-spacing | 18.5 | Missing feature | ✅ Needs impl |
| 8 | **Glossary has zero working examples** — entirely commented out | 9.1 | Discoverability | ✅ Needs fix |
| 9 | **Signature rendering duplicated** between declaration.typ + confidentiality.typ | 10.2 | Code quality | ✅ Needs refactor |
| 10 | **`pretty-warning` l10n key unused** — dead code in both FTL files | 12.3 | Cleanup | ✅ Needs decision |

---

## Follow-Up Actions Registry

### Bugs to Fix
1. **Bibliography double TOC entry** (6.6) — 🔧 DONE: `show outline.entry` filter in `pages/indices.typ`
2. **Chapter imports** (4.1) — 🔧 DONE: added `#import` to 03/04/05_*.typ, updated init.sh

### Documentation to Update
3. **README intro** (1.2) — 🔧 DONE: merged English summary with German intro, added TOC
4. **README author shorthand** (3.2) — 🔧 DONE: documented `name:`/`matrikel:` in parameter table
5. **README logo filenames** (13.1) — 🔧 DONE: corrected to `school-logo.svg`, `company-logo.svg`
6. **api-design.md** (16.1, 16.2) — 🔧 DONE: fixed `author:` → `authors:`, positional → named `abk()` syntax
7. **README script link** (14.4) — 🔧 DONE: updated to branch-relative URL
8. **Declaration-lang default** (12.2) — 🔧 DONE: added recommendation note in both READMEs

### Code to Refactor
9. **Signature helper** (10.2) — 🔧 DONE: extracted to `helper/signatures.typ`
10. **Confidential validation** (10.1) — 🔧 DONE: error when `confidential` is set but `company` is `none`
11. **init.sh overhaul** (14.5) — 🔧 PARTIAL: fixed imports (`gls`/`glspl`), removed dead `title:`, added `abk` import to chapters. Full feature parity (pretty mode, glossary, lang selection, etc.) deferred.
12. **`pretty-warning` key** (12.3) — 🔧 DONE: rendered as yellow warning when pretty mode / logos active

### Features to Brainstorm/Implement
13. **Draft/watermark mode** (18.3) — 🔧 DONE: `draft: true` parameter with l10n watermark
14. **Source attribution helper** (18.4) — 🔧 DONE: `#quelle()` function
15. **Blockquote formatting** (18.5) — 🔧 DONE: `#blockquote[]` with indent + single spacing
16. **Word conversion guidance** (18.2) — 🔧 DONE: added README section with conversion options
17. **Glossary working example** (9.1) — 🔧 DONE: uncommented in main.typ, added `#gls()` in chapter 02

### To Research
18. **Typst→Word conversion** (18.2) — 🔧 DONE: researched; no direct Typst→DOCX path exists. PDF→DOCX (Adobe Acrobat best, free tools available) is the practical approach. Added guidance to README.
19. **AI tools auto cross-referencing** (7.1) — 🔧 RESEARCHED: feasible via `remarks-ref` field. See notes below.

---

## Research Notes: AI Tools Auto Cross-Referencing (#19)

**Finding:** Typst labels are document-wide. The appendix already creates `<anhang-1>`, `<anhang-2>` etc. These can be queried and linked from anywhere.

**Problem:** The `remarks` field is a plain string — `ref()` and `link()` don't execute inside strings.

**Recommended approach:** Add an optional `remarks-ref: 4` field (integer) alongside `remarks`. The template auto-appends a clickable "Anhang 4" link with page number:

```typst
ai-tools: (
  (
    tool: "ChatGPT 4o",
    usage: "Textvorschläge",
    chapters: "Kapitel 1",
    remarks: "Prompts: siehe ",
    remarks-ref: 4,  // → auto-generates "Anhang 4 (S. X)" with hyperlink
  ),
),
```

**Benefits:** Zero breaking changes, simple API, reuses existing `query(label())` + `link()` pattern from appendix TOC. Auto-resolves if appendix order changes.

**Implementation:** Modify `_render-ai-tools()` in `pages/appendix.typ` to check for `remarks-ref` and append a resolved link. Estimated effort: ~15 lines of code.
