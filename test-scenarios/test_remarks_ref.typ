// test-scenarios/test_remarks_ref.typ
// Tests: remarks-ref auto-resolves appendix title to number (Audit 7.1)
// Verifies:
//   1. remarks-ref without remarks → "siehe Anhang N" (linked)
//   2. remarks-ref with remarks prefix → "<prefix>Anhang N" (linked)
//   3. No remarks, no remarks-ref → em-dash
//   4. Only remarks, no ref → plain text

#import "../lib.typ": hwr, abk, quelle

#show: hwr.with(
  doc-type: "ptb-1",
  title: "Test: remarks-ref",
  name: "Test User",
  matrikel: "99999999",
  supervisor: "Prof. Dr. Test",
  company: "Test GmbH",
  lang: "de",

  chapters: (
    [
      = Testkapitel

      Dieses Dokument testet das KI-Verzeichnis mit remarks-ref.

      #figure(
        table(
          columns: (1fr,),
          [Zeile 1],
        ),
        caption: [Testtabelle. #quelle()],
        kind: table,
      )
    ],
  ),

  appendix: (
    // Anhang 1
    (title: "Interviewleitfaden", content: [Hier steht der Interviewleitfaden.]),
    // Anhang 2
    (title: "Rohdaten", content: [Hier stehen Rohdaten.]),
    // Anhang 3 — this is the target for remarks-ref
    (title: "Prompt-Protokoll", content: [Hier stehen die Prompts.]),
    // Anhang 4
    (title: "Weitere Unterlagen", content: [Weitere Unterlagen.]),
  ),

  ai-tools: (
    // Case 1: remarks-ref without remarks → "siehe Anhang 3"
    (
      tool: "ChatGPT 4o",
      usage: "Textvorschläge",
      chapters: "Kapitel 1",
      remarks-ref: "Prompt-Protokoll",
    ),
    // Case 2: remarks-ref with remarks prefix → "Prompts: Anhang 3"
    (
      tool: "DeepL",
      usage: "Übersetzung",
      chapters: "Gesamte Arbeit",
      remarks: "Prompts: ",
      remarks-ref: "Prompt-Protokoll",
    ),
    // Case 3: no remarks, no ref → em-dash
    (
      tool: "Grammarly",
      usage: "Rechtschreibprüfung",
      chapters: "Gesamte Arbeit",
    ),
    // Case 4: only remarks, no ref → plain text
    (
      tool: "DALL-E",
      usage: "Bildgenerierung",
      chapters: "Kapitel 2",
      remarks: "Alle Bilder überarbeitet",
    ),
  ),

  bibliography: bibliography("../template/refs.bib"),
)
