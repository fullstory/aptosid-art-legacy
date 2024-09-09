local-all: fred0 fred1 fred2 fred3 fred4

fred0 fred1 fred2 fred3 fred4: $(SIZES)
	mkdir -p $(THEME)/1280x1024 $(THEME)/1600x1200 $(THEME)/1920x1080 $(THEME)/$(CONTROLDIR)
	./svg-anim.pl $@.svg 30 $@_anim.svg scaley,0:1,1:30,sin:base opacity,0.5:1,1:30,sin
	inkscape \
		 --export-type="png" \
		 --export-filename="$(THEME)/$(CONTROLDIR)/$@.png" \
			$@_anim.svg
	ln -s  ../$(CONTROLDIR)/$@.png $(THEME)/1280x1024/$@.png
	ln -s  ../$(CONTROLDIR)/$@.png $(THEME)/1600x1200/$@.png
	ln -s  ../$(CONTROLDIR)/$@.png $(THEME)/1920x1080/$@.png
	$(RM) $@_anim.svg
