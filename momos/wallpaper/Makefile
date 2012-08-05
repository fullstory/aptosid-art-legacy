#!/usr/bin/make -f

NAME= aptosid-momos
SIZES= 400x250 1024x768 1280x800 1280x1024 1440x900 1600x1200 1920x1200
SVG= aptosid-momos.svg

all: $(SIZES)
	mkdir -p aptosid-momos
	cp metadata.desktop aptosid-momos/

400x250:
	mkdir -p aptosid-momos/contents/
	$(RM) aptosid-momos/contents/screenshot.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="aptosid-momos/contents/screenshot.png" $(SVG)

1280x1024:
	mkdir -p aptosid-momos/contents/images/
	$(RM) aptosid-momos/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-area=183.75:0:1496.25:1050 \
		--export-png="aptosid-momos/contents/images/$@.png" $(SVG)

1024x768 1600x1200:
	mkdir -p aptosid-momos/contents/images/
	$(RM) aptosid-momos/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-area=140:0:1540:1050 \
		--export-png="aptosid-momos/contents/images/$@.png" $(SVG)

1280x800 1440x900 1920x1200:
	mkdir -p aptosid-momos/contents/images/
	$(RM) aptosid-momos/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="aptosid-momos/contents/images/$@.png" $(SVG)

clean:
	$(RM) -r aptosid-momos/
