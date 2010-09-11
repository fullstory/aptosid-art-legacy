#!/usr/bin/make -f

BITMAPS= files background branding-icon aptosid-text

all: $(BITMAPS)


files:
	mkdir ./aptosid-moros
	cp language.png aptosid-moros/
	cp GdmGreeterTheme.desktop aptosid-moros/
	cp session.png aptosid-moros/
	cp system.png aptosid-moros/
	cp moros.xml aptosid-moros/
	cp screenshot.png aptosid-moros/

background:
	inkscape --without-gui --export-width=2134 --export-height=1200 \
		--export-png="./aptosid-moros/$@.png" $@.svg

branding-icon:
	inkscape --without-gui --export-width=100 --export-height=100 \
		--export-png="./aptosid-moros/$@.png" $@.svg

aptosid-text:
	inkscape --without-gui --export-width=190 --export-height=64 \
		--export-png="./aptosid-moros/$@.png" $@.svg

clean:
	$(RM) -r ./aptosid-moros
