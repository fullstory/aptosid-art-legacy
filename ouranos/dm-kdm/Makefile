#!/usr/bin/make -f

BITMAPS= arrow.png background.png rect.png

all: $(BITMAPS)

background.png:
	inkscape --without-gui --export-png="$@" background.svg

clean:
	$(RM) *.png
