#!/usr/bin/make -f

THEME   = aptosid-ponos
BITMAPS = files background fred

all: $(BITMAPS)

files:
	mkdir -p $(THEME)
	cp language.png $(THEME)/
	cp GdmGreeterTheme.desktop $(THEME)/
	cp session.png $(THEME)/
	cp system.png $(THEME)/
	cp ponos.xml $(THEME)/
	cp screenshot.png $(THEME)/

background:
	mkdir -p $(THEME)
	inkscape --without-gui \
		 --export-width=1920 \
		 --export-height=1200 \
		 --export-png="./$(THEME)/$@.png" \
			$@.svg

fred:
	mkdir -p $(THEME)
	inkscape --without-gui \
		 --export-width=94 \
		 --export-height=100 \
		 --export-png="./$(THEME)/$@.png" \
			$@.svg

clean:
	$(RM) -r $(THEME)
