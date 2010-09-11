#!/usr/bin/make -f

NAME= sidux-aether
SIZES= 400x250 1024x768 1280x800 1280x1024 1440x900 1600x1200 1920x1200 
SVG= $(NAME).svg

all: $(SIZES)

400x250:
	mkdir -p contents/
	$(RM) contents/screenshot.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="contents/screenshot.png" $(SVG)

1280x1024:
	mkdir -p contents/images/
	$(RM) contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-area=210:0:1710:1200 \
		--export-png="contents/images/$@.png" $(SVG)

1024x768 1600x1200:
	mkdir -p contents/images/
	$(RM) contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-area=160:0:1760:1200 \
		--export-png="contents/images/$@.png" $(SVG)

1280x800 1440x900 1920x1200:
	mkdir -p contents/images/
	$(RM) contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="contents/images/$@.png" $(SVG)

clean:
	$(RM) -r contents/
