#!/bin/sh

set -e

# releases not using svg, no contents available
#	chaos:Χάος:2007-01::
#	tartaros:Τάρταρς:2007-02::

# releases not currently buildable, as they've not yet been ported from kde3 
# to kde4 (check graphics)
#	gaia:Γάια:2007-03:
#	eros:Έρως:2007-04:
#	nyx:Νυξ:2008-01:
#	erebos:Έρεβος:2008-02:
#	ourea:Ουρέα:2008-03:
#	pontos:Πόντος:2008-04:
#	ouranos:Οὐρανος:2009-01:

# old style, currently not yet supported, the packaging needs to be fixed
#	aether:Αιθήρ:2009-02:

# no aptosid, check graphics
#	momos:Μώμος:2009-03:
#	moros:Μόρος:2009-04:
#	hypnos:Ύπνος:2010-01:

RELEASES="
	void:άκυρος:void:
	keres:Κῆρες:2010-02:
	apate:Ἀπάτη:2010-03:
	geras:Γῆρας:2011-01:
	imera:Ἡμέρα:2011-02:
	ponos:Πόνος:2011-03:
	thanatos:Θάνατος:2012-01:
	hesperides:Ἑσπερίδες:2013-01:
	nemesis:Νέμεσις:2015-01:
"

# not yet released
#	nemesis:Νέμεσις:2013-02:

# clean up obsolete stuff
rm -f	./debian/*.install \
	./debian/*.links \
	./debian/*.postinst \
	./debian/*.postrm

# write toplevel Makefile
for i in $RELEASES; do
	ALL_CODENAME_SAFE="${ALL_CODENAME_SAFE} $(echo ${i} | cut -d\: -f1)"
done
sed	-e "s/\@ALL_CODENAME_SAFE\@/${ALL_CODENAME_SAFE}/g" \
		./debian/templates/Makefile.in \
			> ./Makefile

# create basic structure
ALL_THEMES="dm-kdm dm-sddm splash-kde splash-xfce wallpaper theme-grub"
for i in $RELEASES; do
	for j in $ALL_THEMES; do
		# create directory structure
		mkdir -p "$(echo ${i} | cut -d\: -f1)/${j}"

		# create internal Makefiles
		[ -r "./debian/templates/theme/${j}/Makefile.in" ] || continue
		cat "./debian/templates/theme/${j}/Makefile.in" \
			> "$(echo ${i} | cut -d\: -f1)/${j}/Makefile"
		chmod +x "$(echo ${i} | cut -d\: -f1)/${j}/Makefile"
	done

	# write sublevel release Makefiles
	sed	-e "s/\@ALL_CODENAME_SAFE\@/${ALL_THEMES}/g" \
			./debian/templates/Makefile.in \
				> "$(echo ${i} | cut -d\: -f1)/Makefile"

	# write theme-control.make
	printf "THEME = %s\n" "aptosid-$(echo ${i} | cut -d\: -f1)" \
		> "$(echo ${i} | cut -d\: -f1)/theme-control.make"
done

[ -d ./debian ] || exit 1
cat ./debian/templates/control.source.in > debian/control
for i in $RELEASES; do

	# write debian/control from templates
	TEMPLATES_BIN="./debian/templates/control.binary.in"

	sed	-e s/\@CODENAME_SAFE\@/$(echo ${i} | cut -d\: -f1)/g \
		-e s/\@CODENAME\@/$(echo ${i} | cut -d\: -f2)/g \
		-e s/\@VERSION\@/$(echo ${i} | cut -d\: -f3)/g \
			${TEMPLATES_BIN} >> ./debian/control

	# write debian/*.install from templates
	for j in kde kdm ksplash sddm wallpaper xfce xsplash grub; do
		if [ -r  ./debian/templates/aptosid-art-${j}-CODENAME_SAFE.install.in ]; then
			sed	-e s/\@CODENAME_SAFE\@/$(echo ${i} | cut -d\: -f1)/g \
					./debian/templates/aptosid-art-${j}-CODENAME_SAFE.install.in \
						> ./debian/aptosid-art-${j}-$(echo ${i} | cut -d\: -f1).install
		else
			continue
		fi
	done

	# link KDE4 style wallpapers to /usr/share/wallpapers/
	sed	-e s/\@CODENAME_SAFE\@/$(echo ${i} | cut -d\: -f1)/g \
			./debian/templates/aptosid-art-wallpaper-CODENAME_SAFE.links.in \
				> ./debian/aptosid-art-wallpaper-$(echo ${i} | cut -d\: -f1).links
done
