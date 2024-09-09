#!/usr/bin/make -f

include ../theme-control.make

BITMAPS = logo.png
SVG     = logo.svg

all: $(BITMAPS)

logo.png:
	mkdir -p $(THEME)/balou
	inkscape \
		 --export-width=640 \
		 --export-height=480 \
		 --export-type="png" \
		 --export-filename="$(THEME)/balou/$@" \
			$(SVG)
	cp themerc $(THEME)/balou/

clean:
	$(RM) -r $(THEME)/
