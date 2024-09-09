#!/usr/bin/make -f

RELEASE= pontos
NAME= aptosid-$(RELEASE)
BITMAPS= $(NAME)-1600x1200.png $(NAME)-1920x1200.png
SVG= aptosid-pontos.svg

all: $(BITMAPS)

%-1600x1200.png:
	inkscape \
		 --export-width=1600 \
		 --export-height=1200 \
		 --export-type="png" \
		 --export-filename="$@" \
			$(SVG)

%-1920x1200.png:
	inkscape \
		 --export-width=1920 \
		 --export-height=1200 \
		 --export-dpi=108 \
		 --export-area=0:50:1600:1050 \
		 --export-type="png" \
		 --export-filename="$@" \
			$(SVG)

clean:
	$(RM) *.png
