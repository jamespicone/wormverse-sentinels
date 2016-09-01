.PHONY: all
.PHONY: clean

%.html cards_%.html : %.xml table.xslt cards.xslt
	saxonb-xslt -s:"$<" -o:"cards_$(<:.xml=.html)" -xsl:cards.xslt
	saxonb-xslt -s:"$<" -o:"$(<:.xml=.html)" -xsl:table.xslt
	
html = $(patsubst %.xml,%.html,$(wildcard *.xml)) $(patsubst %.xml,card_%.html,$(wildcard *.xml))

all : $(html)
clean :
	rm $(html)