.PHONY: all
.PHONY: clean
.PHONY: package
.PHONY: environments
.PHONY: heroes
.PHONY: villains
.PHONY: distclean

all : environments heroes villains
environments :
	$(MAKE) -C Environments
	
heroes :
	$(MAKE) -C Heroes
	
villains :
	$(MAKE) -C Villains

clean :
	$(MAKE) clean -C Environments
	$(MAKE) clean -C Heroes
	$(MAKE) clean -C Villains
	
distclean : clean
	rm -rf Cards/*
	
package : all
	$(MAKE) package -C Environments
	$(MAKE) package -C Heroes
	$(MAKE) package -C Villains