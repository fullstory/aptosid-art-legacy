#!/usr/bin/make -f

include ../theme-control.make

CONTROLDIR = 1920x1200
SIZES      = 1280x1024 1600x1200 1920x1080 1920x1200

all: prepare $(SIZES) freds

prepare:
	mkdir -p $(THEME)/$(CONTROLDIR)
	cp Preview.png $(THEME)/
	cp Theme.rc $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)

1280x1024 1600x1200: prepare
	mkdir -p $(THEME)/$@
	[ -f $(THEME)/$@/description.txt ] || ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/$@/description.txt
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/$@/background.png" \
		 	background.svg

1920x1080 1920x1200: prepare
	mkdir -p $(THEME)/$@
	[ -f $(THEME)/$@/description.txt ] || ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/$@/description.txt
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/$@/background.png" \
			background-really-wide.svg

streaked-fred unstreaked-fred:
	./svg-anim.pl $@.svg 30 $@_anim.svg scaley,0.25:1,1:30,sin:middle opacity,0:1,1:30,sin
	inkscape --without-gui \
		 --export-png="$@_anim.png" \
			$@_anim.svg
	$(RM) $@_anim.svg

freds: streaked-fred unstreaked-fred
	./composite_pngs.pl -o $(THEME)/$(CONTROLDIR)/fred.png streaked-fred_anim.png unstreaked-fred_anim.png
	$(RM)	streaked-fred_anim.png \
		unstreaked-fred_anim.png
	ln -fs ../$(CONTROLDIR)/fred.png $(THEME)/1920x1080/fred.png
	ln -fs ../$(CONTROLDIR)/fred.png $(THEME)/1600x1200/fred.png
	ln -fs ../$(CONTROLDIR)/fred.png $(THEME)/1280x1024/fred.png

clean:
	$(RM) -r $(THEME)
