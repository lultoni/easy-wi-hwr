// test-scenarios/test_confidential.typ
// Tests: confidential: true and confidential with specific chapters
// Verifies:
//   1. confidential: true renders full Sperrvermerk page
//   2. confidential with chapters: renders chapter-specific Sperrvermerk

#import "../lib.typ": hwr

#show: hwr.with(
  doc-type: "ptb-2",
  title: "Test: Sperrvermerk",
  name: "Max Mustermann",
  matrikel: "12345678",
  supervisor: "Prof. Dr. Muster",
  company: "Muster GmbH",

  confidential: (
    chapters: (
      (number: "3", title: "Methodik"),
      (number: "4", title: "Ergebnisse"),
    ),
    filename: "PTB_Mustermann_public.pdf",
  ),

  chapters: (
    [
      = Einleitung

      Dieser PTB enthält einen Sperrvermerk für Kapitel 3 und 4.

      #pagebreak()

      = Grundlagen

      Grundlagenkapitel.

      #pagebreak()

      = Methodik

      Gesperrte Methodik.

      #pagebreak()

      = Ergebnisse

      Gesperrte Ergebnisse.

      #pagebreak()

      = Fazit

      Fazit.
    ],
  ),
)
