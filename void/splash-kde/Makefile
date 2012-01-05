#!/usr/bin/make -f

THEME= aptosid-void
CONTROLDIR= 1920x1200

all: prepare background freds

prepare:
	$(RM) -r $(THEME)
	mkdir -p $(THEME)/$(CONTROLDIR)
	mkdir -p $(THEME)/1920x1080
	mkdir -p $(THEME)/1600x1200
	mkdir -p $(THEME)/1280x1024
	cp Preview.png $(THEME)/
	cp Theme.rc $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)

background:
	inkscape --without-gui --export-width=1280 --export-height=1024 \
		--export-png="$(THEME)/1280x1024/$@.png" $@.svg
	inkscape --without-gui --export-png="$(THEME)/1600x1200/$@.png" $@.svg
	inkscape --without-gui --export-width=1920 --export-height=1080 \
		--export-png="$(THEME)/1920x1080/$@.png" $@-really-wide.svg
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@-wide.svg

freds:
	./make_the_freds
	ln -s  ../$(CONTROLDIR)/fred.png $(THEME)/1920x1080/fred.png
	ln -s  ../$(CONTROLDIR)/fred.png $(THEME)/1600x1200/fred.png
	ln -s  ../$(CONTROLDIR)/fred.png $(THEME)/1280x1024/fred.png

clean:
	$(RM) -r $(THEME)
