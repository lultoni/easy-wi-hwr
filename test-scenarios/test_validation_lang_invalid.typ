// test-scenarios/test_validation_lang_invalid.typ
// EXPECTED: compile FAILS with message:
//   lang must be "de" or "en", got: "fr"

#import "../lib.typ": hwr

#show: hwr.with(
  doc-type: "ptb-1",
  title: "Fehlerhafter lang-Wert",
  name: "Test User",
  matrikel: "99999999",
  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",
  lang: "fr",  // <-- invalid
)
