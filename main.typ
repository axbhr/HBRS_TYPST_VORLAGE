// ─── Hauptdokument ───────────────────────────────────────────────────────────
// Entspricht Arbeit.tex
//
// Kompilieren: typst compile main.typ

#import "meta.typ": *
#import "template.typ": hbrs-template

// Vorlage aktivieren (Schrift, Absatz, Überschriften)
#show: hbrs-template

// ─── Deckblatt (keine Kopf-/Fußzeile, keine Seitenzahl) ─────────────────────
#set page(
  paper:      "a4",
  margin:     (left: 40mm, right: 20mm, top: 25mm, bottom: 20mm),
  numbering:  none,
  header:     none,
  footer:     none,
)

#include "abschnitte/deckblatt.typ"

// ─── Vorspann: Erklärung, Verzeichnisse (römische Seitenzahlen) ───────────────
#set page(
  numbering: "i",
  header: [
    #align(right, text(size: 10pt, thesis-title))
    #v(-0.5em)
    #line(length: 100%, stroke: 0.4pt)
  ],
  footer: context align(right, counter(page).display("i")),
)
#counter(page).update(1)

#include "abschnitte/erklaerung.typ"

// Inhaltsverzeichnis
#pagebreak()
#outline(
  title:  [Inhaltsverzeichnis],
  indent: auto,
  depth:  3,
)

// Abbildungsverzeichnis
#pagebreak()
#heading(numbering: none, outlined: false)[Abbildungsverzeichnis]
#outline(
  title:  none,
  target: figure.where(kind: image),
)

// Abkürzungsverzeichnis
#pagebreak()
#include "abschnitte/abkuerzungsverzeichnis.typ"

// ─── Hauptteil (arabische Seitenzahlen, Reset auf 1) ─────────────────────────
#set page(
  numbering: "1",
  header: [
    #align(right, text(size: 10pt, thesis-title))
    #v(-0.5em)
    #line(length: 100%, stroke: 0.4pt)
  ],
  footer: context align(right, counter(page).display()),
)
#counter(page).update(1)

#include "abschnitte/einleitung.typ"

#pagebreak()
#include "abschnitte/stand_forschung.typ"

#pagebreak()
#include "abschnitte/auswertung.typ"

#pagebreak()
#include "abschnitte/zusammenfassung.typ"

// ─── Literaturverzeichnis ────────────────────────────────────────────────────
#pagebreak()
#bibliography(
  "../Literaturverzeichnis.bib",
  title:  "Literaturverzeichnis",
  style:  "chicago-author-date",
  full:   false,
)

// ─── Anhang ──────────────────────────────────────────────────────────────────
#pagebreak()
#include "abschnitte/anhang.typ"
