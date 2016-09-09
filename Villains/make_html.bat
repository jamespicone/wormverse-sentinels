@echo off

for %%x in (*.xml) DO (
	Transform -s:"%%x" -o:"table_%%~nx.html" -xsl:table.xslt
)