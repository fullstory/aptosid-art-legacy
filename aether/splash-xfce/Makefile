#!/usr/bin/make -f

BITMAPS= logo.png
SVG= logo.svg

all: $(BITMAPS)

logo.png:
	inkscape --without-gui --export-width=400 --export-height=247 \
		--export-png="$@" $(SVG)

clean:
	$(RM) *.png
