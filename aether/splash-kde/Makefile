#!/usr/bin/make -f

ICONS= icon
THEME= aptosid-aether
CONTROLDIR= 1024x768
ANIMCREATOR= ./svg-anim.pl

all: $(ICONS)

icon:
	$(ANIMCREATOR) frames=30 effect=opacity:cycle < $@.svg > $@_anim.svg
	inkscape --without-gui --export-png="$@_anim.png" $@_anim.svg

clean:
	$(RM) -r *_anim.png *_anim.svg
