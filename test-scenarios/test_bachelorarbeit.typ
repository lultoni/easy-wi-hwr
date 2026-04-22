// test-scenarios/test_bachelorarbeit.typ
// Tests: bachelorarbeit doc-type with examiners + show-appendix-toc + draft mode
// Verifies:
//   1. bachelorarbeit uses first-examiner/second-examiner (not supervisor/company)
//   2. show-appendix-toc: true renders the optional Anhangsverzeichnis page
//   3. draft: true adds watermark
//   4. group-signature: false triggers warning (only 1 author anyway → no warning)

#import "../lib.typ": hwr, abk

#show: hwr.with(
  doc-type: "bachelorarbeit",
  title: "Digitale Transformation: Eine empirische Studie",
  name: "Lisa Müller",
  matrikel: "87654321",

  first-examiner:  "Prof. Dr. Anna Muster",
  second-examiner: "Prof. Dr. Ben Beispiel",

  lang: "de",
  heading-depth: 3,

  draft: true,  // watermark on every page

  show-appendix-toc: true,  // optional Anhangsverzeichnis

  abbreviations: (
    "HWR": "Hochschule für Wirtschaft und Recht",
  ),

  chapters: (
    [
      = Einleitung

      Diese Arbeit ist ein Test für das Bachelorarbeits-Template.
      #abk("HWR") ist eine Hochschule in Berlin.

      == Hintergrund

      Hintergrundtext.

      === Detailabschnitt

      Detail.

      #pagebreak()

      = Fazit

      Abschlussteil.
    ],
  ),

  appendix: (
    (title: "Rohdaten", content: [Rohdaten-Tabelle hier.]),
    (title: "Interviewleitfaden", content: [Leitfaden hier.]),
  ),

  ai-tools: (
    (
      tool: "ChatGPT 4o",
      usage: "Grammatikprüfung",
      chapters: "Gesamte Arbeit",
      remarks-ref: "Rohdaten",
    ),
  ),

  bibliography: bibliography("../template/refs.bib"),
)
