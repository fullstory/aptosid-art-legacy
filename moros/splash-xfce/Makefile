#!/usr/bin/make -f

BITMAPS= logo.png
SVG= logo.svg


all: $(BITMAPS)

logo.png:
	mkdir -p aptosid-moros/balou
	inkscape --without-gui --export-width=640 --export-height=480 \
		--export-png="aptosid-moros/balou/$@" $(SVG)
	cp themerc aptosid-moros/balou/
clean:
	$(RM) -r aptosid-moros/
