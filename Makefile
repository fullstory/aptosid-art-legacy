all:
	for i in  aether; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in  aether; \
		do $(MAKE) -C $$i $@; done

distclean: clean
