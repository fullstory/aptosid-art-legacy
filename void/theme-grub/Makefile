#!/usr/bin/make -f

include ../theme-control.make

all: background logo font icons theme menu slider highlight
icons: icons/*.svg

dir:
	mkdir -p $(THEME)

iconsdir:
	mkdir -p $(THEME)/icons

background: dir
	inkscape --without-gui \
		 --export-width=1600 \
		 --export-height=1200 \
		 --export-png="$(THEME)/$@.png" \
			$@.svg

logo: dir
	inkscape --without-gui \
		 --export-width=440 \
		 --export-height=240 \
		 --export-png="$(THEME)/logo.png" \
			logo.svg

font: dir
	grub-mkfont -s 16 -o $(THEME)/u_vga16_16.pf2 u_vga16.bdf

slider_n: dir
	inkscape --without-gui \
		--export-area=0:16:32:32 \
		--export-png="$(THEME)/slider_n.png" \
			dot_white.svg

slider_c: dir
	inkscape --without-gui \
		--export-area=0:16:32:17 \
		--export-png="$(THEME)/slider_c.png" \
			dot_white.svg

slider_s: dir
	inkscape --without-gui \
		--export-area=0:0:32:16 \
		--export-png="$(THEME)/slider_s.png" \
			dot_white.svg

slider: slider_n slider_c slider_s

menu_e: dir
	inkscape --without-gui \
		--export-area=16:16:32:17 \
		--export-png="$(THEME)/menu_e.png" \
			dot_black.svg

menu_c: dir
	inkscape --without-gui \
		--export-area=16:16:17:17 \
		--export-png="$(THEME)/menu_c.png" \
			dot_black.svg

menu: menu_c menu_e

highlight_w: dir
	inkscape --without-gui \
		--export-area=0:0:16:32 \
		--export-png="$(THEME)/highlight_w.png" \
			dot_black.svg

highlight_c: dir
	inkscape --without-gui \
		--export-area=16:0:17:32 \
		--export-png="$(THEME)/highlight_c.png" \
			dot_black.svg

highlight_e: dir
	inkscape --without-gui \
		--export-area=16:0:32:32 \
		--export-png="$(THEME)/highlight_e.png" \
			dot_black.svg

highlight: highlight_w highlight_c highlight_e

icons/*.svg: iconsdir
	inkscape --without-gui \
		--export-width=28 --export-height=28 \
		--export-png="$(patsubst icons/%.svg,$(THEME)/icons/%.png,$@)" \
			$@

theme:
	cp theme.txt $(THEME)

clean:
	$(RM) -r $(THEME)/
