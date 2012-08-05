#!/usr/bin/make -f

THEME      = aptosid-apate
CONTROLDIR = 1920x1200
SIZES      = 1280x1024 1600x1200 1920x1080 1920x1200

all: prepare $(SIZES) aptosid freds

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

aptosid:
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@.svg

little-fred big-fred:
	./svg-anim.pl $@.svg 30 $@_anim.svg opacity,0:1,1:30
	inkscape --without-gui \
		 --export-png="$(THEME)/$(CONTROLDIR)/$@.png" \
			$@_anim.svg
	$(RM) $@_anim.svg

freds: little-fred big-fred

clean:
	$(RM) -r $(THEME)
