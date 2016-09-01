.PHONY: all
.PHONY: clean

table_%.html card_%.html : %.xml table.xslt cards.xslt
	saxonb-xslt -s:"$<" -o:"card_$(<:.xml=.html)" -xsl:cards.xslt
	saxonb-xslt -s:"$<" -o:"table_$(<:.xml=.html)" -xsl:table.xslt
	
html = $(patsubst %.xml,table_%.html,$(wildcard *.xml)) $(patsubst %.xml,card_%.html,$(wildcard *.xml))

all : $(html)
clean :
	rm $(html)