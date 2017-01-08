.PHONY: all
.PHONY: clean
.PHONY: package
.PHONY: environments
.PHONY: heroes
.PHONY: villains
.PHONY: distclean

include osdep.mk

all : environments heroes villains
environments :
	$(MAKE) -C Environments -I ..
	
heroes :
	$(MAKE) -C Heroes -I ..
	
villains :
	$(MAKE) -C Villains -I ..

clean :
	$(MAKE) clean -C Environments -I ..
	$(MAKE) clean -C Heroes -I ..
	$(MAKE) clean -C Villains -I ..
	
distclean : clean
	$(rmdir, Cards)
	$(rm, Cards.zip)
	
package : all
	$(MAKE) package -C Environments -I ..
	$(MAKE) package -C Heroes -I ..
	$(MAKE) package -C Villains -I ..
	$(call copy,cards.css,Cards)
	zip Cards.zip Cards/ -r9