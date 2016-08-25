<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
	<head>
		<title><xsl:value-of select="/deck/name" /></title>
		<link rel="stylesheet" type="text/css" href="../cards.css" />
	</head>
	<body>
		<xsl:for-each select="/deck/card | /deck/charactercard/front | /deck/charactercard/back">
		<xsl:variable name="thecard" select="." />
		<xsl:variable name="number"><xsl:if test="name()='card'"><xsl:value-of select="$thecard/quantity" /></xsl:if><xsl:if test="name()!='card'">1</xsl:if></xsl:variable>
		<xsl:for-each select="1 to $number">
			<xsl:for-each select="$thecard">
				<div class="carddiv">
					<div class="titlediv"><span class="cardname"><xsl:value-of select="name" /><xsl:if test="name()!='card'"><xsl:value-of select="../name" /></xsl:if></span><xsl:for-each select="hp"><span class="hp"><xsl:value-of select="." /> HP</span></xsl:for-each></div>
					
					<xsl:for-each select="class | type">
						<xsl:if test="position()=last()">
							<div class="classdiv"><em>
							<xsl:for-each select="$thecard">
								<xsl:for-each select="class | type">
									<xsl:value-of select="." />
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</xsl:for-each>
							</em></div>
						</xsl:if>
					</xsl:for-each>
								
					<div class="textdiv"><xsl:for-each select="text"><xsl:copy-of select="node()" /></xsl:for-each></div>
					<xsl:for-each select="power">
						<div class="power">
							<xsl:if test="name(..)='card'"><div class="powertitle">Power:</div><div class="powertext"><xsl:copy-of select="node()" /></div></xsl:if>
							<xsl:if test="name(..)!='card'"><div class="powertitle"><xsl:copy-of select="name/node()" />: </div><div class="powertext"><xsl:copy-of select="text/node()" /></div></xsl:if>
						</div>
					</xsl:for-each>
							
					<xsl:for-each select="quote">
						<div class="quotediv">
							<p><xsl:for-each select="text">
								<xsl:value-of select="node()" />
							</xsl:for-each></p>
							<strong>--<xsl:for-each select="source"><xsl:value-of select="node()" /></xsl:for-each></strong>
						</div>
					</xsl:for-each>
					<!--<span class="bottext"><xsl:value-of select="/deck/name" /> (<xsl:value-of select="/deck/version" />)</span>-->
				</div>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:for-each>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>