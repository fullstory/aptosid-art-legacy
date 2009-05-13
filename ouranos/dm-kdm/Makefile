#!/usr/bin/make -f

BITMAPS= arrow.png background.png rect.png

all: $(BITMAPS)

arrow.png:
	inkscape --without-gui --export-width=32 --export-height=32 \
		--export-png="$@" arrow.svg

background.png:
	inkscape --without-gui --export-png="$@" background.svg

rect.png:
	inkscape --without-gui --export-png="$@" rect.svg

clean:
	$(RM) *.png
