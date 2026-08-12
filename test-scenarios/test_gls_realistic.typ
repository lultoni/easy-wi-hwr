#import "/lib.typ": hwr, gls, glspl

#show: hwr.with(
  doc-type: "hausarbeit",
  title: "Test",
  name: "Max Mustermann",
  matrikel: "12345678",
  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",
  glossary: (
    (key: "stakeholder", short: "Stakeholder", long: "Stakeholder",
     description: "Interessengruppen, die direkt oder indirekt von einem Projekt betroffen sind."),
  ),
  chapters: (
    [
      = Kapitel 1
      #lorem(200)
      Hier werden die #gls("stakeholder") erwähnt.
      #pagebreak()
      = Kapitel 2
      #lorem(200)
      Die #glspl("stakeholder") spielen eine Rolle.
      #pagebreak()
      = Kapitel 3
      #lorem(200)
      Nochmals die #gls("stakeholder").
    ],
  ),
  bibliography: bibliography("/template/refs.bib"),
)
