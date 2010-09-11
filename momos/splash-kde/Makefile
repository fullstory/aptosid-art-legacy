#!/usr/bin/make -f

ICONS= icon1
THEME= aptosid-momos
CONTROLDIR= 1680x1050
BITMAPS= background text
ANIMCREATOR= ./svg-anim.pl

all: prepare $(ICONS)
all: $(BITMAPS)

prepare:
	$(RM) -r $(THEME)/$(CONTROLDIR)
	mkdir -p $(THEME)/$(CONTROLDIR)
	cp Theme.rc $(THEME)/
	cp Preview.png $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)

icon1:
	$(ANIMCREATOR) frames=20 effect=opacity:in < $@.svg > $@_anim.svg
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@_anim.png" $@_anim.svg
	$(RM) $@_anim.svg

background:
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@.svg

text:
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@.svg

clean:
	$(RM) -r $(THEME)
