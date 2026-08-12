// Happy path: include-appendix-in-lists: false (default) — appendix figures excluded
#import "/lib.typ": hwr

#show: hwr.with(
  doc-type: "hausarbeit",
  title: "Test",
  name: "Max Mustermann",
  matrikel: "12345678",
  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",
  include-appendix-in-lists: false,
  chapters: (
    [
      = Kapitel
      #for i in range(6) {
        figure(
          rect(width: 3cm, height: 2cm),
          caption: [Abbildung im Text #(i+1)],
        )
      }
      #for i in range(6) {
        figure(
          table(columns: 2, [A], [B]),
          caption: [Tabelle im Text #(i+1)],
        )
      }
    ],
  ),
  appendix: (
    (title: "Anhang mit Abbildung", content: [
      #figure(rect(width: 3cm, height: 2cm), caption: [Abbildung im Anhang])
      #figure(table(columns: 2, [X], [Y]), caption: [Tabelle im Anhang])
    ]),
  ),
  bibliography: bibliography("/template/refs.bib"),
)
