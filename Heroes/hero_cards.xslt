<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../card.xslt" />

<xsl:template match="/">
	<html>
		<head>
			<title><xsl:value-of select="/deck/name" /></title>
			<link rel="stylesheet" type="text/css" href="../cards.css" />
			<style>
				body {
					-webkit-columns: auto 3; /* Chrome, Safari, Opera */
					-moz-columns: auto 3; /* Firefox */
					columns: auto 3;
					
					-webkit-column-gap: 0px; /* Chrome, Safari, Opera */
					-moz-column-gap: 0px; /* Firefox */
					column-gap: 0px;
				}
			</style>
		</head>
		<body>
			<xsl:for-each select="/deck/card | /deck/charactercard/front | /deck/charactercard/back">
				<xsl:variable name="thecard" select="." />
				<xsl:variable name="number">
					<xsl:if test="name()='card'"><xsl:value-of select="$thecard/quantity" /></xsl:if>
					<xsl:if test="name()!='card'">1</xsl:if>
				</xsl:variable>
				<xsl:for-each select="1 to $number">
					<xsl:for-each select="$thecard">
						<xsl:apply-templates select="." />
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>