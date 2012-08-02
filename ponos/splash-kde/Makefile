#!/usr/bin/make -f

THEME      = aptosid-ponos
CONTROLDIR = 1920x1200
SIZES      = 1280x1024 1600x1200 1920x1080
FREDS      = fred0 fred1 fred2 fred3 fred4

all: prepare $(SIZES) background $(FREDS)

prepare:
	mkdir -p $(THEME)/$(CONTROLDIR)
	cp Preview.png $(THEME)/
	cp Theme.rc $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)

1280x1024:
	mkdir -p $(THEME)/$@
	ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/$@/description.txt 
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/$@/background.png" \
			background.svg

1600x1200:
	mkdir -p $(THEME)/$@
	ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/$@/description.txt
	inkscape --without-gui \
		 --export-png="$(THEME)/1600x1200/background.png" \
			background.svg

1920x1080:
	mkdir -p $(THEME)/$@
	ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/$@/description.txt
	inkscape --without-gui \
		 --export-width=$(firstword $(subst x, ,$@ )) \
		 --export-height=$(lastword $(subst x, ,$@ )) \
		 --export-png="$(THEME)/$@/background.png" \
			background-really-wide.svg

background:
	inkscape --without-gui \
		 --export-png="$(THEME)/$(CONTROLDIR)/background.png" \
			background-wide.svg

fred0:
	mkdir -p $(THEME)/1280x1024 $(THEME)/1600x1200 $(THEME)/1920x1080 $(THEME)/$(CONTROLDIR)
	./svg-anim.pl fred0.svg 30 fred0_anim.svg scaley,0:1,1:30,sin:base opacity,0.5:1,1:30,sin
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/fred0.png" fred0_anim.svg
	ln -s  ../$(CONTROLDIR)/fred0.png $(THEME)/1280x1024/fred0.png
	ln -s  ../$(CONTROLDIR)/fred0.png $(THEME)/1600x1200/fred0.png
	ln -s  ../$(CONTROLDIR)/fred0.png $(THEME)/1920x1080/fred0.png
	$(RM) fred0_anim.svg

fred1:
	mkdir -p $(THEME)/1280x1024 $(THEME)/1600x1200 $(THEME)/1920x1080 $(THEME)/$(CONTROLDIR)
	./svg-anim.pl fred1.svg 30 fred1_anim.svg scaley,0:1,1:30,sin:base opacity,0.5:1,1:30,sin
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/fred1.png" fred1_anim.svg
	ln -s  ../$(CONTROLDIR)/fred1.png $(THEME)/1280x1024/fred1.png
	ln -s  ../$(CONTROLDIR)/fred1.png $(THEME)/1600x1200/fred1.png
	ln -s  ../$(CONTROLDIR)/fred1.png $(THEME)/1920x1080/fred1.png
	$(RM) fred1_anim.svg

fred2:
	mkdir -p $(THEME)/1280x1024 $(THEME)/1600x1200 $(THEME)/1920x1080 $(THEME)/$(CONTROLDIR)
	./svg-anim.pl fred2.svg 30 fred2_anim.svg scaley,0:1,1:30,sin:base opacity,0.5:1,1:30,sin
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/fred2.png" fred2_anim.svg
	ln -s  ../$(CONTROLDIR)/fred2.png $(THEME)/1280x1024/fred2.png
	ln -s  ../$(CONTROLDIR)/fred2.png $(THEME)/1600x1200/fred2.png
	ln -s  ../$(CONTROLDIR)/fred2.png $(THEME)/1920x1080/fred2.png
	$(RM) fred2_anim.svg

fred3:
	mkdir -p $(THEME)/1280x1024 $(THEME)/1600x1200 $(THEME)/1920x1080 $(THEME)/$(CONTROLDIR)
	./svg-anim.pl fred3.svg 30 fred3_anim.svg scaley,0:1,1:30,sin:base opacity,0.5:1,1:30,sin
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/fred3.png" fred3_anim.svg
	ln -s  ../$(CONTROLDIR)/fred3.png $(THEME)/1280x1024/fred3.png
	ln -s  ../$(CONTROLDIR)/fred3.png $(THEME)/1600x1200/fred3.png
	ln -s  ../$(CONTROLDIR)/fred3.png $(THEME)/1920x1080/fred3.png
	$(RM) fred3_anim.svg

fred4:
	mkdir -p $(THEME)/1280x1024 $(THEME)/1600x1200 $(THEME)/1920x1080 $(THEME)/$(CONTROLDIR)
	./svg-anim.pl fred4.svg 30 fred4_anim.svg scaley,0:1,1:30,sin:base opacity,0.5:1,1:30,sin
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/fred4.png" fred4_anim.svg
	ln -s  ../$(CONTROLDIR)/fred4.png $(THEME)/1280x1024/fred4.png
	ln -s  ../$(CONTROLDIR)/fred4.png $(THEME)/1600x1200/fred4.png
	ln -s  ../$(CONTROLDIR)/fred4.png $(THEME)/1920x1080/fred4.png
	$(RM) fred4_anim.svg

clean:
	$(RM) -r $(THEME)
