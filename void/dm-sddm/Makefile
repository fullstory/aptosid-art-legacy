#!/usr/bin/make -f

include ../theme-control.make

BITMAPS = background angle-down rectangle preview

all: $(BITMAPS) files

files:
	mkdir -p $(THEME)
	cp Main.qml $(THEME)
	cp theme.conf $(THEME)
	sed \
		-e s/\@CODENAME_SAFE\@/$(lastword $(subst -, ,$(THEME)))/ \
		-e s/\@VERSION\@/$(shell dpkg-parsechangelog --file ../../debian/changelog --show-field Version || echo 0.1)/ \
			metadata.desktop.in >$(THEME)/metadata.desktop
	sed \
		-e s/\@CODENAME_SAFE\@/$(lastword $(subst -, ,$(THEME)))/ \
			README.in >$(THEME)/README

background:
	mkdir -p $(THEME)
	inkscape \
		 --export-width=1920 \
		 --export-height=1080 \
		 --export-type="png" \
		 --export-filename="$(THEME)/$@.png" \
			$@.svg
	convert "$(THEME)/$@.png" "$(THEME)/$@.jpg"
	$(RM) "$(THEME)/$@.png"

angle-down:
	mkdir -p $(THEME)
	inkscape \
		 --export-width=72 \
		 --export-height=72 \
		 --export-type="png" \
		 --export-filename="$(THEME)/$@.png" \
			$@.svg

rectangle:
	mkdir -p $(THEME)
	inkscape \
		 --export-area=800:380:1120:700 \
		 --export-width=416 \
		 --export-height=262 \
		 --export-type="png" \
		 --export-filename="$(THEME)/$@.png" \
			$@.svg

preview:
	mkdir -p $(THEME)
	inkscape \
		 --export-width=1920 \
		 --export-height=1080 \
		 --export-type="png" \
		 --export-filename="$(THEME)/_$(lastword $(subst -, ,$(THEME)))-back.png" \
			background.svg
	inkscape \
		 --export-width=1920 \
		 --export-height=1080 \
		 --export-type="png" \
		 --export-filename="$(THEME)/_$(lastword $(subst -, ,$(THEME)))-rect.png" \
			rectangle.svg
	convert \
		"$(THEME)/_$(lastword $(subst -, ,$(THEME)))-back.png" \
		"$(THEME)/_$(lastword $(subst -, ,$(THEME)))-rect.png" \
			-composite "$(THEME)/_$(lastword $(subst -, ,$(THEME)))_0.png"
	$(RM)	"$(THEME)/_$(lastword $(subst -, ,$(THEME)))-back.png" \
		"$(THEME)/_$(lastword $(subst -, ,$(THEME)))-rect.png"
	convert \
		"$(THEME)/_$(lastword $(subst -, ,$(THEME)))_0.png" \
		preview-mask.png \
			-composite "$(THEME)/$(lastword $(subst -, ,$(THEME))).jpg"
	$(RM) "$(THEME)/_$(lastword $(subst -, ,$(THEME)))_0.png"

clean:
	$(RM) -r $(THEME)
