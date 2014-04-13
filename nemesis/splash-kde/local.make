streaked-fred unstreaked-fred:
	./svg-anim.pl $@.svg 30 $@_anim.svg scaley,0.25:1,1:30,sin:middle opacity,0:1,1:30,sin
	inkscape --without-gui \
		 --export-png="$@_anim.png" \
			$@_anim.svg
	$(RM) $@_anim.svg

local-all: $(SIZES) streaked-fred unstreaked-fred
	./composite_pngs.pl -o $(THEME)/$(CONTROLDIR)/fred.png streaked-fred_anim.png unstreaked-fred_anim.png
	$(RM)	streaked-fred_anim.png \
		unstreaked-fred_anim.png
	ln -fs ../$(CONTROLDIR)/fred.png $(THEME)/1920x1080/fred.png
	ln -fs ../$(CONTROLDIR)/fred.png $(THEME)/1600x1200/fred.png
	ln -fs ../$(CONTROLDIR)/fred.png $(THEME)/1280x1024/fred.png
