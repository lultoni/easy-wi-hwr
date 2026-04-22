// test-scenarios/test_abk_undefined_key.typ
// EXPECTED: compile FAILS with message:
//   abk("UNDEFINIERT"): abbreviation not defined. Either add it to the
//   abbreviations: dict in hwr() or use abk("UNDEFINIERT", long: "...") on first use.

#import "../lib.typ": hwr, abk

#show: hwr.with(
  doc-type: "ptb-1",
  title: "Test: abk undefined key",
  name: "Test User",
  matrikel: "99999999",
  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",
  chapters: (
    [
      = Test

      Hier wird eine undefinierte Abkürzung verwendet: #abk("UNDEFINIERT")
    ],
  ),
)
