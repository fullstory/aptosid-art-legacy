all:
	for i in  keres; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in  keres; \
		do $(MAKE) -C $$i $@; done

distclean: clean
