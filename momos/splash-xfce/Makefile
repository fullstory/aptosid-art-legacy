#!/usr/bin/make -f

BITMAPS= logo.png
SVG= logo.svg


all: $(BITMAPS)

logo.png:
	mkdir -p aptosid-momos/balou
	inkscape --without-gui --export-width=640 --export-height=480 \
		--export-png="aptosid-momos/balou/$@" $(SVG)
	cp themerc aptosid-momos/balou/
clean:
	$(RM) -r aptosid-momos/
