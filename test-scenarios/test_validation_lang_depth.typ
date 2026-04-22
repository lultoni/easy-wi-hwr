// test-scenarios/test_validation_lang_depth.typ
// Tests: lang: "en" + heading-depth: 1 compile fine (edge case validation)
// Expected: clean compile, English labels, only H1 numbered in TOC

#import "../lib.typ": hwr, abk, quelle

#show: hwr.with(
  doc-type: "studienarbeit",
  title: "Test: English Language + Minimal Heading Depth",
  name: "Test User",
  matrikel: "99999999",
  supervisor: "Prof. Dr. Test",
  company: "Test Company Ltd.",
  lang: "en",
  heading-depth: 1,

  chapters: (
    [
      = Introduction

      This document tests English language mode and heading-depth: 1.
      Only level 1 headings are numbered; deeper levels are unnumbered.

      == Subsection (no number)

      This subsection must NOT appear numbered in the TOC.

      === Sub-subsection (no number)

      Also unnumbered.

      #pagebreak()

      = Conclusion

      End of test.
    ],
  ),

  bibliography: bibliography("../template/refs.bib"),
)
