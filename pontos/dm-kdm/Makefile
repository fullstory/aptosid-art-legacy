#!/usr/bin/make -f

BITMAPS= background aptosid-logo

all: $(BITMAPS)

$(BITMAPS):
	inkscape --without-gui --export-png="$@.png" $@.svg

clean:
	$(RM) *.png
