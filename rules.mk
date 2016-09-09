.PHONY: all
.PHONY: clean
.PHONY: package

table_%.html card_%.html : %.xml table.xslt cards.xslt
	saxonb-xslt -s:"$<" -o:"card_$(<:.xml=.html)" -xsl:cards.xslt
	saxonb-xslt -s:"$<" -o:"table_$(<:.xml=.html)" -xsl:table.xslt
	
html = $(patsubst %.xml,table_%.html,$(wildcard *.xml)) $(patsubst %.xml,cards_%.html,$(wildcard *.xml))

all : $(html)
clean :
	rm -f $(html)
	
package :
	mkdir -p ../Cards/$(folder)
	cp $(html) ../Cards/$(folder)