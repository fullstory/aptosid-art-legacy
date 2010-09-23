#!/usr/bin/make -f

THEME= aptosid-keres
BITMAPS= logo.png
SVG= logo.svg


all: $(BITMAPS)

logo.png:
	mkdir -p $(THEME)/balou
	inkscape --without-gui --export-width=640 --export-height=480 \
		--export-png="$(THEME)/balou/$@" $(SVG)
	cp themerc $(THEME)/balou/
clean:
	$(RM) -r $(THEME)/
