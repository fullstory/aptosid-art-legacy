#!/usr/bin/make -f

THEME= aptosid-apate
BITMAPS= files background fred

all: $(BITMAPS)

files:
	mkdir $(THEME)
	cp session.png $(THEME)
	cp system.png $(THEME)
	cp KdmGreeterTheme.desktop $(THEME)
	cp apate.xml $(THEME)
	cp oxygen.svg $(THEME)
	cp screenshot.png $(THEME)

background:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="$(THEME)/background.png" $@.svg

fred:
	inkscape --without-gui --export-width=94 --export-height=100 \
		--export-png="$(THEME)/$@.png" $@.svg

clean:
	$(RM) -r $(THEME)
