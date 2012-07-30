#!/usr/bin/make -f

THEME      = aptosid-void
CONTROLDIR = 1920x1200
SIZES      = 1280x1024 1600x1200 1920x1080 1920x1200

all: prepare $(SIZES) freds

prepare:
	mkdir -p $(THEME)/$(CONTROLDIR)
	cp Preview.png $(THEME)/
	cp Theme.rc $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)

1280x1024:
	mkdir -p $(THEME)/$@
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/$@/background.png" \
		 	background.svg

1600x1200:
	mkdir -p $(THEME)/$@
	inkscape --without-gui \
		 --export-png="$(THEME)/$@/background.png" \
			background.svg

1920x1080:
	mkdir -p $(THEME)/$@
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/$@/background.png" \
			background-really-wide.svg

1920x1200:
	mkdir -p $(THEME)/$@
	inkscape --without-gui \
		 --export-png="$(THEME)/$@/background.png" \
			background-wide.svg

streaked-fred:
	./svg-anim.pl streaked-fred.svg 30 streaked-fred_anim.svg scaley,0.25:1,1:30,sin:middle opacity,0:1,1:30,sin
	inkscape --without-gui \
		 --export-png="streaked-fred_anim.png" \
			streaked-fred_anim.svg
	$(RM) streaked-fred_anim.svg

unstreaked-fred:
	./svg-anim.pl unstreaked-fred.svg 30 unstreaked-fred_anim.svg opacity,0:1,1:30,sin
	inkscape --without-gui \
		 --export-png="unstreaked-fred_anim.png" \
			unstreaked-fred_anim.svg
	$(RM) unstreaked-fred_anim.svg

freds: streaked-fred unstreaked-fred
	./composite_pngs.pl -o $(THEME)/$(CONTROLDIR)/fred.png streaked-fred_anim.png unstreaked-fred_anim.png
	$(RM)	streaked-fred_anim.png \
		unstreaked-fred_anim.png
	ln -fs ../$(CONTROLDIR)/fred.png $(THEME)/1920x1080/fred.png
	ln -fs ../$(CONTROLDIR)/fred.png $(THEME)/1600x1200/fred.png
	ln -fs ../$(CONTROLDIR)/fred.png $(THEME)/1280x1024/fred.png

clean:
	$(RM) -r $(THEME)
