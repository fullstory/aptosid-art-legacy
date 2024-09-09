#!/usr/bin/make -f

BITMAPS= logo.png
SVG= logo.svg

all: $(BITMAPS)

logo.png:
	inkscape \
		 --export-width=400 \
		 --export-height=247 \
		 --export-type="png" \
		 --export-filename="$@" \
			$(SVG)

clean:
	$(RM) *.png
