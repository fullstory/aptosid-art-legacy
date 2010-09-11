#!/usr/bin/make -f

BITMAPS= files background branding-icon sidux-text

all: $(BITMAPS)


files:
	mkdir ./sidux-momos
	cp language.png sidux-momos/
	cp GdmGreeterTheme.desktop sidux-momos/
	cp session.png sidux-momos/
	cp system.png sidux-momos/
	cp momos.xml sidux-momos/
	cp screenshot.png sidux-momos/

background:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="./sidux-momos/$@.png" $@.svg

branding-icon:
	inkscape --without-gui --export-width=100 --export-height=100 \
		--export-png="./sidux-momos/$@.png" $@.svg

sidux-text:
	inkscape --without-gui --export-width=190 --export-height=64 \
		--export-png="./sidux-momos/$@.png" $@.svg

clean:
	$(RM) -r ./sidux-momos
