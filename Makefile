all:
	for i in  void keres apate geras imera ponos; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in  void keres apate geras imera ponos; \
		do $(MAKE) -C $$i $@; done

distclean: clean
