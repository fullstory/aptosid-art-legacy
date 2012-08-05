#!/usr/bin/make -f

THEME      = aptosid-keres
CONTROLDIR = 1920x1200
SIZES      = 1280x1024 1600x1200 1920x1080 1920x1200

all: prepare $(SIZES) aptosid letters

prepare:
	mkdir -p $(THEME)/$(CONTROLDIR)
	cp Preview.png $(THEME)/
	cp Theme.rc $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)

1280x1024 1600x1200: prepare
	mkdir -p $(THEME)/$@
	[ -f $(THEME)/$@/description.txt ] || ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/$@/description.txt
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/$@/background.png" \
			background.svg

1920x1080 1920x1200: prepare
	mkdir -p $(THEME)/$@
	[ -f $(THEME)/$@/description.txt ] || ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/$@/description.txt
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/$@/background.png" \
			background-really-wide.svg

aptosid:
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@.svg

letters: a p t o sid

_anim: a_anim p_anim t_anim o_anim sid_anim
a_anim p_anim t_anim o_anim sid_anim:
	./svg-anim.pl $(firstword $(subst _, ,$@ )).svg 30 $@.svg translate,0~-950:1,0~0:15 opacity,0.2:1,0.2:14 opacity,0.2:15,1:30
	inkscape --without-gui \
		 --export-png="$@.png" \
			$@.svg

b_anim: ab_anim pb_anim tb_anim ob_anim sidb_anim
ab_anim pb_anim tb_anim ob_anim sidb_anim:
	./svg-anim.pl $(firstword $(subst _, ,$@ )).svg 30 $@.svg translate,0~-950:1,0~950:30
	inkscape --without-gui \
		 --export-png="$@.png" \
			$@.svg

a p t o sid: _anim b_anim
	mkdir -p $(THEME)/1600x1200
	mkdir -p $(THEME)/1920x1200
	./composite_pngs.pl -o aptosid-keres/1920x1200/$@.png $@b_anim.png $@_anim.png
	ln -s ../1920x1200/$@.png aptosid-keres/1600x1200/$@.png
	$(RM) $@b_anim.png $@_anim.png $@_anim.svg $@b_anim.svg

clean:
	$(RM) -r $(THEME)
