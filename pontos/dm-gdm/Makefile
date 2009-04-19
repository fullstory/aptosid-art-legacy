#!/usr/bin/make -f

BITMAPS= arrow.png background.png gobutton.png sidux-logo.png

all: $(BITMAPS)

arrow.png:
	inkscape --without-gui --export-width=32 --export-height=32 \
		--export-png="$@" arrow.svg

background.png:
	inkscape --without-gui --export-width=1600 --export-height=1200 \
		--export-png="$@" background.svg

gobutton.png:
	inkscape --without-gui --export-width=32 --export-height=32 \
		--export-png="$@" gobutton.svg

sidux-logo.png:
	inkscape --without-gui --export-width=600 \
		--export-png="$@" sidux-logo.svg
	

clean:
	$(RM) *.png
