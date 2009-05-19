#!/usr/bin/make -f

BITMAPS= background sidux-logo

all: $(BITMAPS)

$(BITMAPS):
	inkscape --without-gui --export-png="$@.png" $@.svg

clean:
	$(RM) *.png
