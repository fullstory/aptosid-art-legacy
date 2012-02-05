#!/usr/bin/make -f

THEME= aptosid-keres
CONTROLDIR= 1920x1200
SIZES = 1600x1200 1920x1200

all: letters prepare background

prepare:
	$(RM) -r $(THEME)
	mkdir -p $(THEME)/$(CONTROLDIR)
	mkdir -p $(THEME)/1600x1200
	cp Theme.rc $(THEME)/
	cp Preview.png $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)
	ln -s ../$(CONTROLDIR)/description.txt $(THEME)/1600x1200/description.txt

background: $(SIZES)

1600x1200:
	inkscape --without-gui --export-png="$(THEME)/1600x1200/background.png" background.svg

1920x1200:
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/background.png" background-wide.svg

letters: letsid leta letp lett leto

letsid:
	./make_the_letters sid

leta:
	./make_the_letters a

letp:
	./make_the_letters p

lett:
	./make_the_letters t

leto:
	./make_the_letters o

clean:
	$(RM) -r $(THEME)
