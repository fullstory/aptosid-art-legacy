all:
	for i in  momos moros hypnos; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in  momos moros hypnos; \
		do $(MAKE) -C $$i $@; done

distclean: clean
