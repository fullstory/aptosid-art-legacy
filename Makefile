DIRS =  void keres apate geras imera ponos thanatos hesperides nemesis
BUILDDIRS = $(DIRS:%=build-%)
#INSTALLDIRS = $(DIRS:%=install-%)
CLEANDIRS = $(DIRS:%=clean-%)


all: $(BUILDDIRS)
$(DIRS): $(BUILDDIRS)
$(BUILDDIRS):
	$(MAKE) -C $(@:build-%=%)

#install: $(INSTALLDIRS) all
#$(INSTALLDIRS):
#	$(MAKE) -C $(@:install-%=%) install

clean: $(CLEANDIRS)
$(CLEANDIRS): 
	$(MAKE) -C $(@:clean-%=%) clean

distclean: clean

.PHONY: subdirs $(DIRS)
.PHONY: subdirs $(BUILDDIRS)
.PHONY: subdirs $(INSTALLDIRS)
.PHONY: subdirs $(CLEANDIRS)
#.PHONY: all install clean dist-clean
.PHONY: all clean dist-clean
