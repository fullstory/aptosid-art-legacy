#!/bin/sh

set -e

RELEASES="
	gaia:Γάια:2007-03::
	eros:Έρως:2007-04:edu:
	nyx:Νυξ:2008-01:edu:
	erebos:Έρεβος:2008-02:edu:
	ourea:Ουρέα:2008-03:edu:
	pontos:Πόντος:2008-04::
	ouranos:Οὐρανος:2009-01::
	aether:Αιθήρ:2009-02::
	momos:Μώμος:2009-03:edu:
	hypnos:Ύπνος:2010-01::
"

[ -d ./debian ] || exit 1

cat ./debian/templates/control.source.in > debian/control
for i in $RELEASES; do
	# write debian/control from templates
	TEMPLATES_BIN="./debian/templates/control.binary.in"
	if [ "x$(echo ${i} | cut -d\: -f4)" = "xedu" ]; then
		TEMPLATES_BIN="${TEMPLATES_BIN} ./debian/templates/control.edu.in"
	fi

	sed	-e s/\@CODENAME_SAFE\@/$(echo ${i} | cut -d\: -f1)/g \
		-e s/\@CODENAME\@/$(echo ${i} | cut -d\: -f2)/g \
		-e s/\@VERSION\@/$(echo ${i} | cut -d\: -f3)/g \
			${TEMPLATES_BIN} >> ./debian/control

	# write debian/*.install from templates
	# FIXME

	# write debian/*.postinst from templates
	cat "./debian/templates/postinst" \
		> "./debian/sidux-art-wallpaper-$(echo ${i} | cut -d\: -f1).postinst"

	if [ "x$(echo ${i} | cut -d\: -f4)" = "xedu" ]; then
		cat "./debian/templates/postinst" \
			> "./debian/sidux-art-wallpaper-$(echo ${i} | cut -d\: -f1)-edu.postinst"
	fi
done
