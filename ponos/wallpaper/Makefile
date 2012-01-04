#!/usr/bin/make -f

NAME= aptosid-ponos
NAMEWIDE= $(NAME)-wide
NAMEREALLYWIDE= $(NAME)-really-wide
SIZES= 400x250 1024x768 1366x768 1280x800 1280x1024 1440x900 1600x1200 1920x1080 1920x1200 

all: $(SIZES)
	mkdir -p $(NAME)
	cp metadata.desktop $(NAME)/

400x250:
	mkdir -p $(NAME)/contents/
	$(RM) $(NAME)/contents/screenshot.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAME)/contents/screenshot.png" $(NAMEWIDE).svg

1280x1024:
	mkdir -p $(NAME)/contents/images/
	$(RM) $(NAME)/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAME)/contents/images/$@.png" $(NAME).svg

1024x768 1600x1200:
	mkdir -p $(NAME)/contents/images/
	$(RM) $(NAME)/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAME)/contents/images/$@.png" $(NAME).svg

1280x800 1440x900 1920x1200:
	mkdir -p $(NAME)/contents/images/
	$(RM) $(NAME)/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAME)/contents/images/$@.png" $(NAMEWIDE).svg

1366x768 1920x1080:
	mkdir -p $(NAME)/contents/images/
	$(RM) $(NAME)/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAME)/contents/images/$@.png" $(NAMEREALLYWIDE).svg

clean:
	$(RM) -r $(NAME)/