#!/usr/bin/make -f

RELEASE= pontos
NAME= sidux-$(RELEASE)
BITMAPS= $(NAME)-1600x1200.png $(NAME)-1920x1200.png
SVG= sidux-pontos.svg

all: $(BITMAPS)

%-1600x1200.png:
	inkscape --without-gui --export-width=1600 --export-height=1200 \
		--export-png="$@" $(SVG)

%-1920x1200.png:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-dpi=108 --export-area=0:50:1600:1050 \
		--export-png="$@" $(SVG)

clean:
	$(RM) *.png
