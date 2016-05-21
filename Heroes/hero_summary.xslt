<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" indent="no" />
<xsl:template match="/">

<xsl:for-each select="/deck/charactercard">
<xsl:for-each select="front">
<xsl:value-of select="../name" /> (<xsl:value-of select="/deck/version" />): <xsl:value-of select="hp" /> HP
<xsl:text>	</xsl:text><xsl:value-of select="power/name" />: <xsl:value-of select="power/text" /><xsl:text>
</xsl:text>
</xsl:for-each>

<xsl:text>	</xsl:text>

<xsl:for-each select="back/text/ul/li">
<xsl:value-of select="." /><xsl:if test="position()!=last()"> / </xsl:if>
</xsl:for-each>
</xsl:for-each>

<xsl:text>
</xsl:text>

<xsl:for-each select="/deck/card"><xsl:text>
x</xsl:text><xsl:value-of select="quantity" />
<xsl:text> </xsl:text><xsl:value-of select="name" />: <xsl:for-each select="class|type"><xsl:value-of select="." /><xsl:if test="position()!=last()">,</xsl:if><xsl:text> </xsl:text></xsl:for-each> <xsl:for-each select="hp"><xsl:value-of select="." /> HP </xsl:for-each>"<xsl:for-each select="text"><xsl:value-of select="." /></xsl:for-each><xsl:for-each select="power">Power: <xsl:value-of select="." /></xsl:for-each>"</xsl:for-each>

</xsl:template>

</xsl:stylesheet>