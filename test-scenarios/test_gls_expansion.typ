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
    (key: "dap", short: "DAP", long: "Digital Adoption Platform",
     description: "Software die Nutzer durch digitale Prozesse führt."),
  ),
  chapters: (
    [
      = Test Kapitel
      Erste Verwendung singular: #gls("stakeholder"). \
      Zweite Verwendung singular: #gls("stakeholder"). \
      Erste Verwendung plural: #glspl("stakeholder"). \
      Zweite Verwendung plural: #glspl("stakeholder"). \
      Abkürzung first use: #gls("dap"). \
      Abkürzung second use: #gls("dap"). \
    ],
  ),
  bibliography: bibliography("/template/refs.bib"),
)
