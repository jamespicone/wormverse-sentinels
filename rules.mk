.PHONY: all
.PHONY: clean
.PHONY: package

include osdep.mk

table_%.html card_%.html : %.xml table.xslt cards.xslt ../card.xslt
	$(transform) -s:"$<" -o:"card_$(<:.xml=.html)" -xsl:cards.xslt
	$(transform) -s:"$<" -o:"table_$(<:.xml=.html)" -xsl:table.xslt
	
image_%.png : card_%.html ../cards.css
	cutycapt --url="$<" --out=$@ --min-width=1439
	
html = $(patsubst %.xml,table_%.html,$(wildcard *.xml)) $(patsubst %.xml,card_%.html,$(wildcard *.xml))
image = $(patsubst %.xml,image_%.png,$(wildcard *.xml))

all : $(html) $(image)
clean :
	$(call rm, $(html))
	$(call rm, $(image))
	
package :
	$(call mkdir,$(package_folder))
	$(call copy,$(html),$(package_folder))