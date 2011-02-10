all:
	for i in  keres apate geras; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in  keres apate geras; \
		do $(MAKE) -C $$i $@; done

distclean: clean
