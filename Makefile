all:
	for i in  keres apate; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in  keres apate; \
		do $(MAKE) -C $$i $@; done

distclean: clean
