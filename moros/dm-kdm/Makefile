#!/usr/bin/make -f

BITMAPS= files background branding-icon sidux-text

all: $(BITMAPS)

files:
	mkdir ./sidux-moros
	cp session.png ./sidux-moros
	cp system.png ./sidux-moros
	cp KdmGreeterTheme.desktop ./sidux-moros
	cp moros.xml ./sidux-moros
	cp oxygen.svg ./sidux-moros
	cp screenshot.png ./sidux-moros

background:
	inkscape --without-gui --export-width=2134 --export-height=1200 \
		--export-png="./sidux-moros/$@.png" $@.svg

branding-icon:
	inkscape --without-gui --export-width=100 --export-height=100 \
		--export-png="./sidux-moros/$@.png" $@.svg

sidux-text:
	inkscape --without-gui --export-width=190 --export-height=64 \
		--export-png="./sidux-moros/$@.png" $@.svg

clean:
	$(RM) -r sidux-moros
