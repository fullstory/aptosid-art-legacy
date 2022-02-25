local-all: bar letters

bar: $(CONTROLDIR)
	inkscape --without-gui --export-png="$(THEME)/$(CONTROLDIR)/$@.png" $@.svg

letters: a p t o sid

a p t o sid:
	./svg-anim-r2skew2-fix.pl $@.svg 30 $@_anim.svg scaley,0:1,1:30,sin:base opacity,0:1,1:30,sin
	./svg-anim-r2skew2-fix.pl $@s.svg 30 $@s_anim.svg skewX,0:1,-45:30,sin scaley,0:0,1:30,sin:base opacity,0:1,1:30,sin
	inkscape --without-gui --export-png=$@_anim.png $@_anim.svg
	inkscape --without-gui --export-png=$@s_anim.png $@s_anim.svg
	./composite_pngs.pl -o $(THEME)/$(CONTROLDIR)/$@.png $@s_anim.png $@_anim.png
	$(RM) $@s_anim.png $@_anim.png $@_anim.svg $@s_anim.svg
