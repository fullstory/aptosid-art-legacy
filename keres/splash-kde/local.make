local-all: letters

letters: a p t o sid

_anim: a_anim p_anim t_anim o_anim sid_anim
a_anim p_anim t_anim o_anim sid_anim:
	./svg-anim.pl $(firstword $(subst _, ,$@ )).svg 30 $@.svg translate,0~-950:1,0~0:15 opacity,0.2:1,0.2:14 opacity,0.2:15,1:30
	inkscape \
		 --export-type="png" \
		 --export-filename="$@.png" \
			$@.svg

b_anim: ab_anim pb_anim tb_anim ob_anim sidb_anim
ab_anim pb_anim tb_anim ob_anim sidb_anim:
	./svg-anim.pl $(firstword $(subst _, ,$@ )).svg 30 $@.svg translate,0~-950:1,0~950:30
	inkscape \
		 --export-type="png" \
		 --export-filename="$@.png" \
			$@.svg

a p t o sid: _anim b_anim $(SIZES)
	mkdir -p $(THEME)/1600x1200
	mkdir -p $(THEME)/1920x1200
	./composite_pngs.pl -o $(THEME)/1920x1200/$@.png $@b_anim.png $@_anim.png
	ln -s ../1920x1200/$@.png $(THEME)/1600x1200/$@.png
	$(RM) $@b_anim.png $@_anim.png $@_anim.svg $@b_anim.svg
