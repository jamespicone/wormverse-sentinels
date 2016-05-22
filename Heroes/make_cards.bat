@echo off

for %%x in (*.xml) DO (
	Transform -s:"%%x" -o:"cards_%%~nx.html" -xsl:hero_cards.xslt
)