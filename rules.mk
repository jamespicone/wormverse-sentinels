.PHONY: all
.PHONY: clean
.PHONY: package
.PHONY: cards
.PHONY: tts

include osdep.mk

card_%.html : %.xml cards.xslt ../card.xslt
	$(transform) -s:"$<" -o:"$@" -xsl:cards.xslt

front_%.html : %.xml front.xslt ../card.xslt
	$(transform) -s:"$<" -o:"$@" -xsl:front.xslt
	
back_%.html : %.xml back.xslt ../card.xslt
	$(transform) -s:"$<" -o:"$@" -xsl:back.xslt
	
front_%.png : front_%.html ../cards.css ../images.css
	cutycapt --url="$<" --out=$@ --min-width=3135
	
back_%.png : back_%.html ../cards.css ../images.css
	cutycapt --url="$<" --out=$@ --min-width=3135
	
cards = $(patsubst %.xml,card_%.html,$(wildcard *.xml))
image_prereqs = $(patsubst %.xml,front_%.html,$(wildcard *.xml)) $(patsubst %.xml,back_%.html,$(wildcard *.xml))
image = $(patsubst %.xml,front_%.png,$(wildcard *.xml)) $(patsubst %.xml,back_%.png,$(wildcard *.xml))

all : $(cards) $(image)
	
cards : $(cards)
	
tts : $(image_prereqs) $(image)
	
clean :
	$(call rm, $(cards))
	$(call rm, $(image))
	$(call rm, $(image_prereqs))
	
package :
	$(call mkdir,$(package_folder))
	$(call copy,$(cards),$(package_folder))