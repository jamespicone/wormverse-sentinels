.PHONY: all
.PHONY: environments
.PHONY: heroes
.PHONY: villains

all : environments heroes villains
environments :
	$(MAKE) -C Environments
	
heroes :
	$(MAKE) -C Heroes
	
villains :
	$(MAKE) -C Villains
