#import "/lib.typ": hwr, abk

#show: hwr.with(
  doc-type: "hausarbeit",
  title: "Test",
  name: "Max Mustermann",
  matrikel: "12345678",
  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",
  abbreviations: (
    "DAP": "Digital Adoption Platform",
  ),
  chapters: (
    [
      = Test
      Das Unternehmen setzt auf WalkMe als Digital Adoption Platform (DAP) #abk("DAP"), das Anwender begleitet.
    ],
  ),
  bibliography: bibliography("/template/refs.bib"),
)
