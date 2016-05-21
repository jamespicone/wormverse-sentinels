@echo off

for %%x in (*.xml) DO (
	Transform -s:"%%x" -o:"summary_%%~nx.txt" -xsl:villain_summary.xslt
)