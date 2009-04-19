#!/usr/bin/make -f

BITMAPS= splash_active_bar.png splash_bottom.png splash_inactive_bar.png splash_top.png
SVG= splash.svg

all: $(BITMAPS)

splash_active_bar.png:
	inkscape --without-gui --export-area=0:19:400:83 --export-dpi=90 \
		--export-png="$@" $(SVG)

splash_bottom.png:
	inkscape --without-gui --export-area=0:0:400:19 --export-dpi=90 \
		--export-png="$@"  $(SVG)

splash_inactive_bar.png:
	inkscape --without-gui --export-area=0:83:400:147 --export-dpi=90 \
		--export-png="$@" $(SVG)

splash_top.png:
	inkscape --without-gui --export-area=0:147:400:395 --export-dpi=90 \
		--export-png="$@" $(SVG)


clean:
	$(RM) $(BITMAPS)
