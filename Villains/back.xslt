<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../card.xslt" />

<xsl:template match="/">
<html>
	<head>
		<title><xsl:value-of select="/deck/deckname" /></title>
		<link rel="stylesheet" type="text/css" href="../cards.css" />
		<link rel="stylesheet" type="text/css" href="../images.css" />
	</head>
	<body>
		<xsl:for-each select="/deck/card | /deck/villain/front | /deck/villain/back | /deck/specialcard/front | /deck/specialcard/back">
		<xsl:variable name="thecard" select="." />
		<xsl:variable name="number"><xsl:if test="name()='card'"><xsl:value-of select="$thecard/quantity" /></xsl:if><xsl:if test="name()!='card'">1</xsl:if></xsl:variable>
		<xsl:for-each select="1 to $number">
			<xsl:apply-templates select="$thecard" mode="back"/>
		</xsl:for-each>
	</xsl:for-each>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>