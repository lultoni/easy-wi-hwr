// test-scenarios/test_multi_author.typ
// Tests: multiple authors + authors: array syntax + group-signature: auto
// Verifies:
//   1. authors: array of dicts (standard multi-author syntax)
//   2. group-signature: auto → all authors sign (no warning)
//   3. ptb-3 doc-type compiles
//   4. city: override works

#import "../lib.typ": hwr, abk

#show: hwr.with(
  doc-type: "ptb-3",
  title: "Entwicklung eines Prototyps für ein cloudbasiertes ERP-System",

  authors: (
    (name: "Max Mustermann", matrikel: "12345678"),
    (name: "Lisa Müller",    matrikel: "87654321"),
    (name: "Tom Beispiel",   matrikel: "55556666"),
  ),

  supervisor: "Prof. Dr. Muster",
  company: "Muster GmbH",

  lang: "de",
  field-of-study: "Wirtschaftsinformatik",
  cohort: "2022",
  semester: "6",

  city: "Hamburg",  // non-default city

  group-signature: auto,  // all three authors sign (no warning)

  abbreviations: (
    "ERP": "Enterprise Resource Planning",
    "API": "Application Programming Interface",
    "KI":  "Künstliche Intelligenz",
  ),

  chapters: (
    [
      = Einleitung

      Diese Arbeit wurde von drei Autoren gemeinsam verfasst.
      #abk("ERP")-Systeme sind zentral für moderne Unternehmen.
      #abk("API")-Schnittstellen ermöglichen die Integration.
      #abk("KI") wird zunehmend eingesetzt.

      #pagebreak()

      = Fazit

      Die Zusammenarbeit war erfolgreich.
      #abk("ERP") hat sich bewährt.
    ],
  ),
)
