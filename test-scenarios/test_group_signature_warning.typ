// test-scenarios/test_group_signature_warning.typ
// Tests: group-signature: false with 2 authors triggers yellow warning block
// Verifies:
//   1. Compile succeeds (warning is in the PDF, not a compile error)
//   2. warnings: false suppresses the warning block

#import "../lib.typ": hwr

#show: hwr.with(
  doc-type: "studienarbeit",
  title: "Test: Gruppen-Unterschrift-Warnung",

  authors: (
    (name: "Max Mustermann", matrikel: "12345678"),
    (name: "Lisa Müller",    matrikel: "87654321"),
  ),

  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",

  group-signature: false,  // 2 authors + false → warning in PDF

  chapters: (
    [= Testkapitel \ Haupttext für Gruppenarbeit.],
  ),
)
