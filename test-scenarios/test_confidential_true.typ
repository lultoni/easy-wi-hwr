// test-scenarios/test_confidential_true.typ
// Tests: confidential: true — full document Sperrvermerk
// Verifies:
//   1. confidential: true renders a full Sperrvermerk page before title page
//   2. company name appears in Sperrvermerk text
//   3. document structure still renders correctly afterwards

#import "../lib.typ": hwr

#show: hwr.with(
  doc-type: "ptb-1",
  title: "Analyse der internen Prozesse bei Muster GmbH",
  name: "Max Mustermann",
  matrikel: "12345678",
  supervisor: "Prof. Dr. Muster",
  company: "Muster GmbH",

  confidential: true,

  chapters: (
    [
      = Einleitung

      Diese Arbeit ist vollständig gesperrt.

      #pagebreak()

      = Ergebnisse

      Sensitive Ergebnisse.
    ],
  ),
)
