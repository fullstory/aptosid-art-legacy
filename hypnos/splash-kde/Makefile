#!/usr/bin/make -f

THEME= aptosid-hypnos
CONTROLDIR= 1920x1200
PARTS= fred bar

all: prepare background $(PARTS) letters

prepare:
	$(RM) -r $(THEME)
	mkdir -p $(THEME)/$(CONTROLDIR)
	mkdir -p $(THEME)/1920x1080
	mkdir -p $(THEME)/1600x1200
	mkdir -p $(THEME)/1280x1024
	cp Theme.rc $(THEME)/
	cp Preview.png $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)

background:
	inkscape --without-gui --export-width=1280 --export-height=1024 \
		--export-png="$(THEME)/1280x1024/$@.png" $@.svg
	inkscape --without-gui --export-width=1600 --export-height=1200 \
		--export-png="$(THEME)/1600x1200/$@.png" $@.svg
	inkscape --without-gui --export-width=1920 --export-height=1080 \
		--export-png="$(THEME)/1920x1080/$@.png" $@-wide.svg
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@-wide.svg

fred:
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@.svg

bar:
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@.svg

letters:
	./make_the_letters

clean:
	$(RM) -r $(THEME)
