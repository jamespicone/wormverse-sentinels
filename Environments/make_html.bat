@echo off

for %%x in (*.xml) DO (
	Transform -s:"%%x" -o:"%%~nx.html" -xsl:table.xslt
)