#!/usr/bin/make -f

include ../theme-control.make

CONTROLDIR = 1920x1200
SIZES      = 1280x1024 1600x1200 1920x1080 1920x1200

all: prepare $(SIZES) local-all

prepare:
	mkdir -p $(THEME)/$(CONTROLDIR)
	cp Preview.png $(THEME)/
	cp Theme.rc $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)

1280x1024 1600x1200: prepare
	mkdir -p $(THEME)/$@
	[ -f $(THEME)/$@/description.txt ] || ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/$@/description.txt
	inkscape \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-type="png" \
		 --export-filename="$(THEME)/$@/background.png" \
			background.svg

1920x1200: prepare
	mkdir -p $(THEME)/$@
	[ -f $(THEME)/$@/description.txt ] || ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/$@/description.txt
	inkscape \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-type="png" \
		 --export-filename="$(THEME)/$@/background.png" \
			background-wide.svg

1920x1080: prepare
	mkdir -p $(THEME)/$@
	[ -f $(THEME)/$@/description.txt ] || ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/$@/description.txt
	inkscape \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-type="png" \
		 --export-filename="$(THEME)/$@/background.png" \
			background-really-wide.svg

include local.make

clean:
	$(RM) -r $(THEME)
