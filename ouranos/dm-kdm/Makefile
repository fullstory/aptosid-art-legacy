#!/usr/bin/make -f

BITMAPS= background.png

all: $(BITMAPS)

background.png:
	inkscape --without-gui --export-png="$@" background.svg

clean:
	$(RM) *.png
