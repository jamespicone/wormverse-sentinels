@echo off

for %%x in (*.xml) DO (
	Transform -s:"%%x" -o:"%%~nx_summary.txt" -xsl:hero_summary.xslt
)