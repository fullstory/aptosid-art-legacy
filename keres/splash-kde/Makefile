#!/usr/bin/make -f

THEME= aptosid-keres
CONTROLDIR= 1920x1200

all: prepare background letters

prepare:
	$(RM) -r $(THEME)
	mkdir -p $(THEME)/$(CONTROLDIR)
	mkdir -p $(THEME)/1600x1200
	cp Theme.rc $(THEME)/
	cp Preview.png $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)
	ln -s ../$(CONTROLDIR)/description.txt $(THEME)/1600x1200/description.txt

background:
	inkscape --without-gui --export-png="$(THEME)/1600x1200/$@.png" $@.svg
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@-wide.svg

letters:
	./make_the_letters

clean:
	$(RM) -r $(THEME)
