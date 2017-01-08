.PHONY: all
.PHONY: clean
.PHONY: package

include osdep.mk

table_%.html card_%.html : %.xml table.xslt cards.xslt
	$(transform) -s:"$<" -o:"card_$(<:.xml=.html)" -xsl:cards.xslt
	$(transform) -s:"$<" -o:"table_$(<:.xml=.html)" -xsl:table.xslt
	
html = $(patsubst %.xml,table_%.html,$(wildcard *.xml)) $(patsubst %.xml,card_%.html,$(wildcard *.xml))

all : $(html)
clean :
	$(delete) $(html)
	
package :
	$(mkdir) ../Cards/$(folder)
	$(copy) $(html) ../Cards/$(folder)