<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" indent="no" />
<xsl:template match="/">

<xsl:for-each select="/deck/villain|/deck/specialcard">
<xsl:for-each select="front|back">
<xsl:if test="name()='back'">BACK:
</xsl:if>
<xsl:value-of select="../name" /> (<xsl:value-of select="/deck/version" />)<xsl:for-each select="title">, <xsl:value-of select="." /></xsl:for-each>: <xsl:for-each select="hp"><xsl:value-of select="." /> HP</xsl:for-each><xsl:text>
</xsl:text>
<xsl:for-each select="nemesis">	NEMESIS: <xsl:value-of select="." /><xsl:text>
</xsl:text></xsl:for-each>
<xsl:for-each select="setup"><xsl:text>	SETUP: </xsl:text><xsl:value-of select="." /><xsl:text>
</xsl:text></xsl:for-each>
<xsl:for-each select="gameplay"><xsl:text>	GAMEPLAY: </xsl:text><xsl:value-of select="." /><xsl:text>
</xsl:text></xsl:for-each>
<xsl:for-each select="text"><xsl:text>	TEXT: </xsl:text><xsl:value-of select="." /><xsl:text>
</xsl:text></xsl:for-each>
<xsl:for-each select="advanced"><xsl:text>	ADVANCED: </xsl:text><xsl:value-of select="." /><xsl:text>
</xsl:text></xsl:for-each>
</xsl:for-each>

<xsl:text>
</xsl:text>
</xsl:for-each>

<xsl:for-each select="/deck/card"><xsl:text>
x</xsl:text><xsl:value-of select="quantity" />
<xsl:text> </xsl:text><xsl:value-of select="name" />: <xsl:for-each select="class|type"><xsl:value-of select="." /><xsl:if test="position()!=last()">,</xsl:if><xsl:text> </xsl:text></xsl:for-each> <xsl:for-each select="hp"><xsl:value-of select="." /> HP </xsl:for-each>"<xsl:for-each select="text"><xsl:value-of select="." /></xsl:for-each><xsl:for-each select="power">Power: <xsl:value-of select="." /></xsl:for-each>"</xsl:for-each>

</xsl:template>

</xsl:stylesheet>