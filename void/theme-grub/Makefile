#!/usr/bin/make -f

include ../theme-control.make

W = 800
H = 600
X1 = 76
Y1 = 106
X2 = 724
Y2 = 494

all: font frame icons theme slider
icons: icons/*.svg

dir:
	mkdir -p $(THEME)

iconsdir:
	mkdir -p $(THEME)/icons

font: dir
	grub-mkfont -s 16 -o $(THEME)/u_vga16_16.pf2 u_vga16.bdf

frame_sw: dir
	inkscape --without-gui \
		 --export-area=0:0:$(X1):$(Y1) \
		 --export-png="$(THEME)/frame_sw.png" \
			frame.svg

frame_s: dir
	inkscape --without-gui \
		 --export-area=$(X1):0:$(X2):$(Y1) \
		 --export-png="$(THEME)/frame_s.png" \
			frame.svg

frame_se: dir
	inkscape --without-gui \
		 --export-area=$(X2):0:$(W):$(Y1) \
		 --export-png="$(THEME)/frame_se.png" \
			frame.svg

frame_w: dir
	inkscape --without-gui \
		 --export-area=0:$(Y1):$(X1):$(Y2) \
		 --export-png="$(THEME)/frame_w.png" \
			frame.svg

frame_c: dir
	inkscape --without-gui \
		 --export-area=$(X1):$(Y1):$(X2):$(Y2) \
		 --export-png="$(THEME)/frame_c.png" \
			frame.svg

frame_e: dir
	inkscape --without-gui \
		 --export-area=$(X2):$(Y1):$(W):$(Y2) \
		 --export-png="$(THEME)/frame_e.png" \
			frame.svg

frame_nw: dir
	inkscape --without-gui \
		 --export-area=0:$(Y2):$(X1):$(H) \
		 --export-png="$(THEME)/frame_nw.png" \
			frame.svg

frame_n: dir
	inkscape --without-gui \
		 --export-area=$(X1):$(Y2):$(X2):$(H) \
		 --export-png="$(THEME)/frame_n.png" \
			frame.svg

frame_ne: dir
	inkscape --without-gui \
		 --export-area=$(X2):$(Y2):$(W):$(H) \
		 --export-png="$(THEME)/frame_ne.png" \
			frame.svg

frame: frame_sw frame_s frame_se frame_w frame_c frame_e frame_nw frame_n frame_ne

menu_e: dir
	inkscape --without-gui \
		--export-area=0:23:20:24 \
		--export-png="$(THEME)/menu_e.png" \
			slider.svg

slider_n: dir
	inkscape --without-gui \
		--export-area=0:11:20:19 \
		--export-png="$(THEME)/slider_n.png" \
			slider.svg

slider_c: dir
	inkscape --without-gui \
		--export-area=0:10:20:11 \
		--export-png="$(THEME)/slider_c.png" \
			slider.svg

slider_s: dir
	inkscape --without-gui \
		--export-area=0:1:20:9 \
		--export-png="$(THEME)/slider_s.png" \
			slider.svg

slider: menu_e slider_n slider_c slider_s

icons/*.svg: iconsdir
	inkscape --without-gui \
		--export-width=28 --export-height=28 \
		--export-png="$(patsubst icons/%.svg,$(THEME)/icons/%.png,$@)" \
			$@

theme:
	cp theme.txt $(THEME)

clean:
	$(RM) -r $(THEME)/
