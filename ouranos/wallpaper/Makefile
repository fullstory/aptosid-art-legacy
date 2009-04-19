#!/usr/bin/make -f

RELEASE= ouranos
NAME= sidux-$(RELEASE)
BITMAPS= $(NAME)-1600x1200.png $(NAME)-1920x1200.png
SVG= $(NAME).svg

all: $(BITMAPS)

%-1600x1200.png:
	inkscape --without-gui --export-width=1600 --export-height=1200 \
		--export-area=160:0:1760:1200 \
		--export-png="$@" $(SVG)

%-1920x1200.png:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="$@" $(SVG)

clean:
	$(RM) *.png
