#!/usr/bin/make -f

THEME= aptosid-keres
BITMAPS= files background comic-fred aptosid

all: $(BITMAPS)

files:
	mkdir $(THEME)
	cp session.png $(THEME)
	cp system.png $(THEME)
	cp KdmGreeterTheme.desktop $(THEME)
	cp keres.xml $(THEME)
	cp oxygen.svg $(THEME)
	cp screenshot.png $(THEME)

background:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="$(THEME)/background.png" $@.svg

comic-fred:
	inkscape --without-gui --export-width=108 --export-height=116 \
		--export-png="$(THEME)/$@.png" $@.svg

aptosid:
	inkscape --without-gui --export-width=330 --export-height=190 \
		--export-png="$(THEME)/$@.png" $@.svg

clean:
	$(RM) -r $(THEME)
