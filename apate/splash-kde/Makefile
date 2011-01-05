#!/usr/bin/make -f

THEME= aptosid-apate
CONTROLDIR= 1920x1200

all: prepare background aptosid freds

prepare:
	$(RM) -r $(THEME)
	mkdir -p $(THEME)/$(CONTROLDIR)
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
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@-wide.svg

aptosid:
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@.svg

freds:
	./make_the_freds

clean:
	$(RM) -r $(THEME)
