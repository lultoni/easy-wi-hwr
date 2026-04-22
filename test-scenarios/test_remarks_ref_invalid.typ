// test-scenarios/test_remarks_ref_invalid.typ
// EXPECTED: compile FAILS with message:
//   remarks-ref: "Nicht-Existierend" not found in appendix:. Check that the title matches exactly.

#import "../lib.typ": hwr

#show: hwr.with(
  doc-type: "ptb-1",
  title: "Test: remarks-ref invalid title",
  name: "Test User",
  matrikel: "99999999",
  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",
  chapters: (
    [= Test \ Haupttext],
  ),
  appendix: (
    (title: "Echter Anhang", content: [Inhalt.]),
  ),
  ai-tools: (
    (
      tool: "ChatGPT",
      usage: "Test",
      chapters: "Kap. 1",
      remarks-ref: "Nicht-Existierend",  // <-- no appendix entry with this title
    ),
  ),
)
