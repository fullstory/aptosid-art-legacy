#!/usr/bin/make -f

include ../theme-control.make

CONTROLDIR = 1920x1200
SIZES      = 1280x1024 1600x1200 1920x1080 1920x1200
FREDS      = fred0 fred1 fred2 fred3 fred4

all: prepare $(SIZES) $(FREDS)

prepare:
	mkdir -p $(THEME)/$(CONTROLDIR)
	cp Preview.png $(THEME)/
	cp Theme.rc $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)/

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

fred0 fred1 fred2 fred3 fred4:
	mkdir -p $(THEME)/1280x1024 $(THEME)/1600x1200 $(THEME)/1920x1080 $(THEME)/$(CONTROLDIR)
	./svg-anim.pl $@.svg 30 $@_anim.svg scaley,0:1,1:30,sin:base opacity,0.5:1,1:30,sin
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@_anim.svg
	ln -s  ../$(CONTROLDIR)/$@.png $(THEME)/1280x1024/$@.png
	ln -s  ../$(CONTROLDIR)/$@.png $(THEME)/1600x1200/$@.png
	ln -s  ../$(CONTROLDIR)/$@.png $(THEME)/1920x1080/$@.png
	$(RM) $@_anim.svg

clean:
	$(RM) -r $(THEME)
