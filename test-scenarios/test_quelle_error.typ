// test-scenarios/test_quelle_error.typ
// EXPECTED: compile FAILS with message:
//   quelle(): year is required when author is set. ...

#import "../lib.typ": hwr, quelle

#show: hwr.with(
  doc-type: "ptb-1",
  title: "Test: quelle without year",
  name: "Test User",
  matrikel: "99999999",
  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",
  chapters: (
    [
      = Test

      #figure(
        rect(width: 2cm),
        caption: [Fehler. #quelle("Mustermann")],  // <-- author without year
      )
    ],
  ),
)
