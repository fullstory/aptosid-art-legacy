#!/usr/bin/make -f

BITMAPS= files background branding-icon aptosid-text

all: $(BITMAPS)


files:
	mkdir ./aptosid-momos
	cp language.png aptosid-momos/
	cp GdmGreeterTheme.desktop aptosid-momos/
	cp session.png aptosid-momos/
	cp system.png aptosid-momos/
	cp $(lastword $(subst -, ,$(THEME))).xml $(THEME)/
	cp screenshot.png aptosid-momos/

background:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="./aptosid-momos/$@.png" $@.svg

branding-icon:
	inkscape --without-gui --export-width=100 --export-height=100 \
		--export-png="./aptosid-momos/$@.png" $@.svg

aptosid-text:
	inkscape --without-gui --export-width=190 --export-height=64 \
		--export-png="./aptosid-momos/$@.png" $@.svg

clean:
	$(RM) -r ./aptosid-momos
