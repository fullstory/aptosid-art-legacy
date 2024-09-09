#!/usr/bin/make -f

BITMAPS= logo.png
SVG= logo.svg


all: $(BITMAPS)

logo.png:
	mkdir -p aptosid-moros/balou
	inkscape \
		 --export-width=640 \
		 --export-height=480 \
		 --export-type="png" \
		 --export-filename="aptosid-moros/balou/$@" \
			$(SVG)
	cp themerc aptosid-moros/balou/
clean:
	$(RM) -r aptosid-moros/
