# ─── Makefile für die Typst-Vorlage ─────────────────────────────────────────
# Das Literaturverzeichnis liegt eine Ebene höher; daher muss --root .. gesetzt
# werden, damit Typst auch auf bilder/ zugreifen darf.

TYPST   = typst
ROOT    = ..
SRC     = main.typ
OUT     = Arbeit.pdf

.PHONY: all clean watch

all: $(OUT)

$(OUT): $(SRC) meta.typ template.typ \
        abschnitte/deckblatt.typ \
        abschnitte/erklaerung.typ \
        abschnitte/abkuerzungsverzeichnis.typ \
        abschnitte/einleitung.typ \
        abschnitte/stand_forschung.typ \
        abschnitte/auswertung.typ \
        abschnitte/zusammenfassung.typ \
        abschnitte/anhang.typ
	$(TYPST) compile --root $(ROOT) $(SRC) $(OUT)

watch:
	$(TYPST) watch --root $(ROOT) $(SRC) $(OUT)

clean:
	rm -f $(OUT)
