local-all: aptosid freds

aptosid: $(CONTROLDIR)
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@.svg

little-fred big-fred: $(CONTROLDIR)
	./svg-anim.pl $@.svg 30 $@_anim.svg opacity,0:1,1:30
	inkscape --without-gui \
		 --export-png="$(THEME)/$(CONTROLDIR)/$@.png" \
			$@_anim.svg
	$(RM) $@_anim.svg

freds: little-fred big-fred
