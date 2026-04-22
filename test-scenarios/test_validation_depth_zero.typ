// test-scenarios/test_validation_depth_zero.typ
// EXPECTED: compile FAILS with message:
//   heading-depth must be an integer between 1 and 4, got: 0

#import "../lib.typ": hwr

#show: hwr.with(
  doc-type: "ptb-1",
  title: "Fehlerhafter heading-depth Wert 0",
  name: "Test User",
  matrikel: "99999999",
  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",
  heading-depth: 0,  // <-- invalid (min is 1)
)
