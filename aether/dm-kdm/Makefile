#!/usr/bin/make -f

BITMAPS= background branding-icon

all: $(BITMAPS)

background:
	inkscape --without-gui --export-png="$@.png" $@.svg

branding-icon:
	inkscape --without-gui --export-width=96 --export-height=96 \
		--export-png="$@.png" $@.svg

clean:
	$(RM) background.png branding-icon.png
