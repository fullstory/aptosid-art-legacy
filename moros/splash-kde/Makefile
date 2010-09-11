#!/usr/bin/make -f

ICONS= icon1
THEME= sidux-moros
CONTROLDIR= 1920x1200
BITMAPS= background text
ANIMCREATOR= ./svg-anim.pl

all: prepare $(ICONS)
all: $(BITMAPS)

prepare:
	$(RM) -r $(THEME)/$(CONTROLDIR)
	mkdir -p $(THEME)/$(CONTROLDIR)
	$(RM) -r $(THEME)/1600x1200
	mkdir -p $(THEME)/1600x1200
	$(RM) -r $(THEME)/1280x1024
	mkdir -p $(THEME)/1280x1024
	cp Theme.rc $(THEME)/
	cp Preview.png $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)

icon1:
	$(ANIMCREATOR) frames=20 effect=opacity:in < $@.svg > $@_anim.svg
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@_anim.png" $@_anim.svg
	$(RM) $@_anim.svg

background:
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@-wide.svg
	inkscape --without-gui --export-width=1600 --export-height=1200 \
	         --export-png="$(THEME)/1600x1200/$@.png" $@.svg
	inkscape --without-gui --export-width=1280 --export-height=1024 \
		 --export-area=50:0:1550:1200 \
	         --export-png="$(THEME)/1280x1024/$@.png" $@.svg

text:
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@.svg

clean:
	$(RM) -r $(THEME)
