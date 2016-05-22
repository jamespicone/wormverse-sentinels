@echo off

for %%x in (*.xml) DO (
	Transform -s:"%%x" -o:"cards_%%~nx.html" -xsl:environment_cards.xslt
)