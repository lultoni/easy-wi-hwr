// test-scenarios/test_validation_depth_invalid.typ
// EXPECTED: compile FAILS with message:
//   heading-depth must be an integer between 1 and 4, got: 5

#import "../lib.typ": hwr

#show: hwr.with(
  doc-type: "ptb-1",
  title: "Fehlerhafter heading-depth Wert",
  name: "Test User",
  matrikel: "99999999",
  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",
  heading-depth: 5,  // <-- invalid (max is 4)
)
