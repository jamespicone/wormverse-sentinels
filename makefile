.PHONY: all
.PHONY: clean
.PHONY: package
.PHONY: tts
.PHONY: cards
.PHONY: environments
.PHONY: heroes
.PHONY: villains
.PHONY: distclean

include osdep.mk

cards : environments_cards heroes_cards villains_cards
tts : environments_tts heroes_tts villains_tts
tts_singleton : environments_tts_singleton heroes_tts_singleton villains_tts_singleton

all : cards tts tts_singleton

environments_cards :
	$(MAKE) cards -C Environments -I ..
	
heroes_cards :
	$(MAKE) cards -C Heroes -I ..
	
villains_cards :
	$(MAKE) cards -C Villains -I ..
	
environments_tts :
	$(MAKE) tts -C Environments -I ..
	
heroes_tts :
	$(MAKE) tts -C Heroes -I ..
	
villains_tts:
	$(MAKE) tts -C Villains -I ..

environments_tts_singleton :
	$(MAKE) tts_singleton -C Environments -I ..
	
heroes_tts_singleton :
	$(MAKE) tts_singleton -C Heroes -I ..
	
villains_tts_singleton:
	$(MAKE) tts_singleton -C Villains -I ..
	
environments:
	$(MAKE) -C Environments -I ..
	
heroes:
	$(MAKE) -C Heroes -I ..
	
villains:
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