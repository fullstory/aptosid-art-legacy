#!/usr/bin/make -f

NAME= sidux-momos
SIZES= 400x250 1024x768 1280x800 1280x1024 1440x900 1600x1200 1920x1200 
SVG= sidux-momos.svg

all: $(SIZES)
	mkdir -p sidux-momos
	cp metadata.desktop sidux-momos/

400x250:
	mkdir -p sidux-momos/contents/
	$(RM) sidux-momos/contents/screenshot.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="sidux-momos/contents/screenshot.png" $(SVG)

1280x1024:
	mkdir -p sidux-momos/contents/images/
	$(RM) sidux-momos/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-area=183.75:0:1496.25:1050 \
		--export-png="sidux-momos/contents/images/$@.png" $(SVG)

1024x768 1600x1200:
	mkdir -p sidux-momos/contents/images/
	$(RM) sidux-momos/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-area=140:0:1540:1050 \
		--export-png="sidux-momos/contents/images/$@.png" $(SVG)

1280x800 1440x900 1920x1200:
	mkdir -p sidux-momos/contents/images/
	$(RM) sidux-momos/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="sidux-momos/contents/images/$@.png" $(SVG)

clean:
	$(RM) -r sidux-momos/
