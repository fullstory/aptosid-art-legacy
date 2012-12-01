#!/usr/bin/make -f

include ../theme-control.make

THEMEWIDE       = $(THEME)-wide
THEMEREALLYWIDE = $(THEME)-really-wide
SIZES          = 400x250 1024x768 1366x768 1280x800 1280x1024 1440x900 1600x1200 1920x1080 1920x1200

all: $(SIZES)
	mkdir -p $(THEME)
	cp metadata.desktop $(THEME)/

400x250:
	mkdir -p $(THEME)/contents/
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/contents/screenshot.png" \
			$(THEMEWIDE).svg

1280x1024:
	mkdir -p $(THEME)/contents/images/
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/contents/images/$@.png" \
			$(THEME).svg

1024x768 1600x1200:
	mkdir -p $(THEME)/contents/images/
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/contents/images/$@.png" \
			$(THEME).svg

1280x800 1440x900 1920x1200:
	mkdir -p $(THEME)/contents/images/
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/contents/images/$@.png" \
			$(THEMEWIDE).svg

1366x768 1920x1080:
	mkdir -p $(THEME)/contents/images/
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/contents/images/$@.png" \
			$(THEMEREALLYWIDE).svg

clean:
	$(RM) -r $(THEME)/
