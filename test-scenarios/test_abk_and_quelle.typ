// test-scenarios/test_abk_and_quelle.typ
// Tests: abk() inline mode (Mode 2) + quelle() positional and keyword syntax
// Verifies:
//   1. abk() Mode 1: central dict → expands on first use, short on second
//   2. abk() Mode 2: inline long: → first use expands, short thereafter, appears in Abkürzungsverzeichnis
//   3. abk() Mode 2: inline definition via old positional syntax (long: as named arg)
//   4. quelle() bare → "Quelle: Eigene Darstellung"
//   5. quelle(<key>) → "Quelle: Mustermann (2024)" (clickable cite link)
//   6. quelle(<key>, "S. 42") → cite link with page supplement
//   7. quelle("Author", 2024) → "Quelle: Author (2024)" (plain text, backward-compat)
//   8. quelle("Author", 2024, "S. 5") → "Quelle: Author (2024), S. 5"
//   9. quelle(author: "Author", year: 2024, s: "S. 10") keyword syntax
//   10. blockquote[] renders indented

#import "../lib.typ": hwr, abk, quelle, blockquote

#show: hwr.with(
  doc-type: "hausarbeit",
  title: "Test: abk + quelle",
  name: "Test User",
  matrikel: "99999999",
  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",
  lang: "de",

  // Central dict (Mode 1)
  abbreviations: (
    "KI":  "Künstliche Intelligenz",
    "ERP": "Enterprise Resource Planning",
  ),

  chapters: (
    [
      = Abkürzungstest

      Mode 1 — erster Aufruf (expandiert): #abk("KI")

      Mode 1 — zweiter Aufruf (kurz): #abk("KI")

      Mode 1 — andere Abkürzung erster Aufruf: #abk("ERP")

      Mode 2 — erster Aufruf mit long: (expandiert): #abk("API", long: "Application Programming Interface")

      Mode 2 — zweiter Aufruf (kurz): #abk("API")

      Mode 2 — neue Abkürzung: #abk("REST", long: "Representational State Transfer")

      Mode 2 — REST kurz beim zweiten Aufruf: #abk("REST")

      #pagebreak()

      = Quellentest

      Abbildung mit eigener Darstellung:
      #figure(
        rect(width: 3cm, height: 1cm),
        caption: [Platzhaltergrafik. #quelle()],
      )

      Abbildung mit Bib-Key (klickbarer Link):
      #figure(
        rect(width: 3cm, height: 1cm),
        caption: [Datenübersicht. #quelle(<mustermann2024>)],
      )

      Abbildung mit Bib-Key und Seitenangabe:
      #figure(
        rect(width: 3cm, height: 1cm),
        caption: [Entwicklung. #quelle(<mueller2023>, "S. 42")],
      )

      Abbildung mit positionalem Autor/Jahr (Freitext):
      #figure(
        rect(width: 3cm, height: 1cm),
        caption: [Vergleich. #quelle("Mustermann", 2024)],
      )

      Abbildung mit positionalem Autor/Jahr/Seite:
      #figure(
        rect(width: 3cm, height: 1cm),
        caption: [Zeitreihe. #quelle("Müller", 2023, "S. 42")],
      )

      Abbildung mit Keyword-Syntax:
      #figure(
        rect(width: 3cm, height: 1cm),
        caption: [Schema. #quelle(author: "Schmidt", year: 2022, s: "S. 10")],
      )

      #pagebreak()

      = Blockquote-Test

      Ein längeres wörtliches Zitat wird eingerückt und einzeilig:

      #blockquote[
        „Dies ist ein längeres wörtliches Zitat, das über mehrere Zeilen geht
        und daher eingerückt und einzeilig formatiert wird, wie es die
        HWR-Richtlinien für Zitate über 40 Wörter oder drei Zeilen vorschreiben."
        @mustermann2024[S. 42]
      ]

      Weitergehender Fließtext nach dem Blockquote.
    ],
  ),

  bibliography: bibliography("../template/refs.bib"),
)
