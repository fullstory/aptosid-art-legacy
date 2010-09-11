all:
	for i in aether momos moros hypnos; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in aether momos moros hypnos; \
		do $(MAKE) -C $$i $@; done

distclean: clean
