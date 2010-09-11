#!/usr/bin/make -f

BITMAPS= logo.png
SVG= logo.svg


all: $(BITMAPS)

logo.png:
	mkdir -p sidux-moros/balou
	inkscape --without-gui --export-width=640 --export-height=480 \
		--export-png="sidux-moros/balou/$@" $(SVG)
	cp themerc sidux-moros/balou/
clean:
	$(RM) -r sidux-moros/
