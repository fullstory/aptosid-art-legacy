#!/usr/bin/make -f

BITMAPS= background branding-icon oxygen-box

all: $(BITMAPS)

background:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="$@.png" $@.svg

branding-icon:
	inkscape --without-gui --export-width=96 --export-height=96 \
		--export-png="$@.png" $@.svg

oxygen-box:
	inkscape --without-gui --export-width=400 --export-height=300 \
		--export-png="$@.png" $@.svg

clean:
	$(RM) oxygen-box.png branding-icon.png background.png
