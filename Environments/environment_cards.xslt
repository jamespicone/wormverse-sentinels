<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="card">
	<xsl:param name="i" />

	<xsl:variable name="thecard" select="/deck/card[$i]" />
	<xsl:for-each select="1 to $thecard/quantity">
		<xsl:for-each select="$thecard">
			<div>
				<span class="cardname"><xsl:value-of select="name" /></span><xsl:for-each select="hp"><span class="hp"><xsl:value-of select="." /> HP</span></xsl:for-each><br/>
				
				<p><em>
				<xsl:for-each select="class | type">
					<xsl:value-of select="." />
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
				</em></p>
				
				<p><xsl:for-each select="nemesis"><xsl:if test="position()=1"><strong>Nemesis</strong>: </xsl:if><xsl:value-of select="." /></xsl:for-each></p>
				
				<p><xsl:for-each select="text"><xsl:copy-of select="node()" /></xsl:for-each></p>
				<span class="bottext"><xsl:value-of select="/deck/name" /> (<xsl:value-of select="/deck/version" />)</span>
			</div>
		</xsl:for-each>
	</xsl:for-each>
	
	<xsl:for-each select="$thecard">
		<xsl:call-template name="card">
			<xsl:with-param name="i" select="$i + 1" />
		</xsl:call-template>
	</xsl:for-each>
</xsl:template>

<xsl:template match="/">
<html>
	<head>
		<title><xsl:value-of select="/deck/name" /></title>
		<style>
			div {
				height: 88mm;
				width: 59mm;
				padding: 2mm;
				border: 1px solid black;
				page-break-inside: avoid;
				box-sizing: border-box;
				overflow: hidden;
				text-align: left;
				position: relative;
			}
			
			.cardname {
				font-size: large;
				font-weight: bold;
				float: left;
			}
			
			.hp {
				font-size: large;
				font-weight: bold;
				float: right;
			}
			
			.bottext {
				font-size: small;
				font-weight: light;
				
				position: absolute;
				bottom: 5mm;
				right: 5mm;
			}
			
			body {
				-webkit-columns: auto 3; /* Chrome, Safari, Opera */
				-moz-columns: auto 3; /* Firefox */
				columns: auto 3;
				margin: 0mm;
				padding: 0mm;
			}
		</style>
	</head>
	<body>
			<xsl:call-template name="card">
				<xsl:with-param name="i" select="1" />
			</xsl:call-template>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>