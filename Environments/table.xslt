<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../card.xslt" />

<xsl:template name="card">
	<xsl:param name="i" />
	<xsl:param name="count" />

	<xsl:for-each select="/deck/card[$i]">
		<xsl:variable name="nextcount" select="$count + quantity" />
		<tr>
			<td>
				<xsl:value-of select="$count" />
				<xsl:if test="quantity != 1">-<xsl:value-of select="$nextcount - 1" /></xsl:if>
			</td>
			<td>
				<xsl:apply-templates select="." />
			</td>
		</tr>
		
		<xsl:call-template name="card">
			<xsl:with-param name="i" select="$i + 1" />
			<xsl:with-param name="count" select="$nextcount" />
		</xsl:call-template>
	</xsl:for-each>
</xsl:template>

<xsl:template match="/">
<html>
	<head>
		<title><xsl:value-of select="/deck/deckname" /></title>
		<link rel="stylesheet" type="text/css" href="../cards.css" />
		<style>
			.center { margin: auto; width: 100%; text-align: center; }
			table { width: 100%; }
			table, th, td {  border: 1px solid black; text-align: center; }
			tr { page-break-inside: avoid; }
		</style>
	</head>
	<body>
		<table>
			<tr>
				<th>#</th><th>Card</th>
			</tr>
			<xsl:call-template name="card">
				<xsl:with-param name="i" select="1" />
				<xsl:with-param name="count" select="1" />
			</xsl:call-template>
		</table>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>