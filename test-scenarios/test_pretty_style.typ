// test-scenarios/test_pretty_style.typ
// Tests: style: "pretty" + warnings: false + date: manual string
// Verifies:
//   1. style: "pretty" compiles without errors (decorative title page)
//   2. warnings: false suppresses the pretty-mode warning block
//   3. date: manual string renders correctly
//   4. hausarbeit doc-type works

#import "../lib.typ": hwr

#show: hwr.with(
  doc-type: "hausarbeit",
  title: "Agile Methoden in der Softwareentwicklung",
  name: "Anna Beispiel",
  matrikel: "99887766",
  supervisor: "Prof. Dr. Muster",
  company: "Muster GmbH",

  lang: "de",
  date: "15. März 2026",  // manual date string

  style: "pretty",      // decorative title page
  warnings: false,      // suppress pretty-mode warning in PDF

  chapters: (
    [
      = Einleitung

      Diese Hausarbeit verwendet das dekorative Layout.

      #pagebreak()

      = Fazit

      Das Template funktioniert korrekt.
    ],
  ),
)
