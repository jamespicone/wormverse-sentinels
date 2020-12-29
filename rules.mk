.PHONY: all
.PHONY: clean
.PHONY: package
.PHONY: cards
.PHONY: tts

include osdep.mk

card_%.html : %.xml cards.xslt ../card.xslt
	$(transform) -s:"$<" -o:"$@" -xsl:cards.xslt


front_single_unique_%.html : %.xml front-singleton-unique.xslt ../card.xslt
	$(transform) -s:"$<" -o:"$@" -xsl:front-singleton-unique.xslt
	
back_single_unique_%.html : %.xml back-singleton-unique.xslt ../card.xslt
	$(transform) -s:"$<" -o:"$@" -xsl:back-singleton-unique.xslt
	
front_single_unique_%.png : front_single_unique_%.html ../cards.css ../images.css
	cutycapt --url="$<" --out=$@ --min-width=3135
	
back_single_unique_%.png : back_single_unique_%.html ../cards.css ../images.css
	cutycapt --url="$<" --out=$@ --min-width=3135


front_single_%.html : %.xml front-singleton.xslt ../card.xslt
	$(transform) -s:"$<" -o:"$@" -xsl:front-singleton.xslt
	
back_single_%.html : %.xml back-singleton.xslt ../card.xslt
	$(transform) -s:"$<" -o:"$@" -xsl:back-singleton.xslt
	
front_single_%.png : front_single_%.html ../cards.css ../images.css
	cutycapt --url="$<" --out=$@ --min-width=3135
	
back_single_%.png : back_single_%.html ../cards.css ../images.css
	cutycapt --url="$<" --out=$@ --min-width=448


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
image_single_prereqs = $(patsubst %.xml,front_single_%.html,$(wildcard *.xml)) $(patsubst %.xml,back_single_%.html,$(wildcard *.xml)) $(patsubst %.xml,front_single_unique_%.html,$(wildcard *.xml)) $(patsubst %.xml,back_single_unique_%.html,$(wildcard *.xml)) 
image_single = $(patsubst %.xml,front_single_%.png,$(wildcard *.xml)) $(patsubst %.xml,back_single_%.png,$(wildcard *.xml)) $(patsubst %.xml,front_single_unique_%.png,$(wildcard *.xml)) $(patsubst %.xml,back_single_unique_%.png,$(wildcard *.xml))

all : $(cards) $(image) $(image_single)
	
cards : $(cards)
	
tts : $(image_prereqs) $(image)

tts_singleton : $(image_single_prereqs) $(image_single)
	
clean :
	$(call rm, $(cards))
	$(call rm, $(image))
	$(call rm, $(image_prereqs))
	$(call rm, $(image_single))
	$(call rm, $(image_single_prereqs))
	
package :
	$(call mkdir,$(package_folder))
	$(call copy,$(cards),$(package_folder))
	$(call copy,$(image),$(package_folder))
	$(call copy,$(image_single),$(package_folder))