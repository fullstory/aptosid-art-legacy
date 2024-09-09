#!/usr/bin/make -f

include ../theme-control.make

all: background logo font icons theme menu slider highlight
icons: icons/*.svg

dir:
	mkdir -p $(THEME)

iconsdir:
	mkdir -p $(THEME)/icons

background: dir
	inkscape \
		 --export-width=1600 \
		 --export-height=1200 \
		 --export-type="png" \
		 --export-filename="$(THEME)/$@.png" \
			$@.svg

logo: dir
	inkscape \
		 --export-width=440 \
		 --export-height=240 \
		 --export-type="png" \
		 --export-filename="$(THEME)/logo.png" \
			logo.svg

font: dir
	grub-mkfont -s 16 -o $(THEME)/u_vga16_16.pf2 u_vga16.bdf

slider_n: dir
	inkscape \
		 --export-area=0:16:32:32 \
		 --export-type="png" \
		 --export-filename="$(THEME)/slider_n.png" \
			dot_white.svg

slider_c: dir
	inkscape \
		 --export-area=0:16:32:17 \
		 --export-type="png" \
		 --export-filename="$(THEME)/slider_c.png" \
			dot_white.svg

slider_s: dir
	inkscape \
		 --export-area=0:0:32:16 \
		 --export-type="png" \
		 --export-filename="$(THEME)/slider_s.png" \
			dot_white.svg

slider: slider_n slider_c slider_s

menu_e: dir
	inkscape \
		 --export-area=16:16:32:17 \
		 --export-type="png" \
		 --export-filename="$(THEME)/menu_e.png" \
			dot_black.svg

menu_c: dir
	inkscape \
		 --export-area=16:16:17:17 \
		 --export-type="png" \
		 --export-filename="$(THEME)/menu_c.png" \
			dot_black.svg

menu: menu_c menu_e

highlight_w: dir
	inkscape \
		 --export-area=0:0:16:32 \
		 --export-type="png" \
		 --export-filename="$(THEME)/highlight_w.png" \
			dot_black.svg

highlight_c: dir
	inkscape \
		 --export-area=16:0:17:32 \
		 --export-type="png" \
		 --export-filename="$(THEME)/highlight_c.png" \
			dot_black.svg

highlight_e: dir
	inkscape \
		 --export-area=16:0:32:32 \
		 --export-type="png" \
		 --export-filename="$(THEME)/highlight_e.png" \
			dot_black.svg

highlight: highlight_w highlight_c highlight_e

icons/*.svg: iconsdir
	inkscape \
		 --export-width=28 \
		 --export-height=28 \
		 --export-type="png" \
		 --export-filename="$(patsubst icons/%.svg,$(THEME)/icons/%.png,$@)" \
			$@

theme:
	cp theme.txt $(THEME)

clean:
	$(RM) -r $(THEME)/
