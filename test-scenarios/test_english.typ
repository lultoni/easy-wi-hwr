// test-scenarios/test_english.typ
// Tests: English language mode + abstract + glossary + studienarbeit doc-type
// Verifies:
//   1. lang: "en" compiles without errors (all l10n keys resolve)
//   2. abstract: renders its own page
//   3. glossary: entries render a Glossary section
//   4. studienarbeit doc-type works
//   5. citation-style: "auto" selects Harvard (EN)

#import "../lib.typ": hwr, abk, gls, glspl

#show: hwr.with(
  doc-type: "studienarbeit",
  lang: "en",
  title: "Digital Transformation in SMEs: A Qualitative Study",
  name: "Jane Doe",
  matrikel: "11223344",
  supervisor: "Prof. Dr. Test",
  company: "Example Corp",

  field-of-study: "Business Informatics",
  cohort: "2024",
  semester: "4",

  abstract: [
    This paper examines the adoption of digital technologies in small and medium-sized
    enterprises (SMEs). The study finds that organizational culture is the primary
    barrier to digital transformation. A qualitative approach involving ten case studies
    was used to gather insights across different industries.
  ],

  abbreviations: (
    "SME":  "Small and Medium-sized Enterprise",
    "ERP":  "Enterprise Resource Planning",
    "API":  "Application Programming Interface",
  ),

  glossary: (
    (key: "agile", short: "Agile", long: "Agile Methodology",
     description: "An iterative approach to project management and software development."),
    (key: "scrum",  short: "Scrum", long: "Scrum Framework",
     description: "A framework for implementing Agile principles in software development."),
  ),

  ai-tools: (
    (
      tool: "ChatGPT 4o",
      usage: "Grammar and style suggestions",
      chapters: "Entire paper",
    ),
    (
      tool: "DeepL",
      usage: "Translation of excerpts",
      chapters: "Chapter 2",
      remarks: "Used for translation of German primary sources.",
    ),
  ),

  chapters: (
    [
      = Introduction

      Digital transformation affects organizations of all sizes.
      #abk("SME") are particularly challenged by this trend.

      The #abk("ERP") market is growing rapidly.
      Organizations use #gls("agile") practices to adapt.

      #pagebreak()

      = Theoretical Background

      #abk("API") integrations are central to modern IT architecture.
      Teams using #gls("scrum") deliver faster.

      #pagebreak()

      = Methodology

      A qualitative approach was used. #abk("SME") cases were studied.

      #pagebreak()

      = Results

      Results here.

      #pagebreak()

      = Conclusion

      Digital transformation requires cultural change in #glspl("scrum") environments.
    ],
  ),

  appendix: (
    (title: "Interview Guide", content: [Interview questions listed here.]),
  ),

  bibliography: bibliography("../template/refs.bib"),
  citation-style: "auto",  // should resolve to harvard-anglia-ruskin-university for EN

  declaration-lang: "de",  // explicitly keep declaration in German (legal safety)
)
