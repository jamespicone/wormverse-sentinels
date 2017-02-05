@echo off

for %%x in (*.xml) DO (
	Transform -s:"%%x" -o:"card_%%~nx.html" -xsl:cards.xslt
)