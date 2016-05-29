<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
			
			.powertitle {
				font-weight: bold;				
			}
			
			.powertext {
			}
		
			.power {
				padding-left: 10mm;
				text-indent: -10mm;
			}
			
			body {
				-webkit-columns: auto 3; /* Chrome, Safari, Opera */
				-moz-columns: auto 3; /* Firefox */
				columns: auto 3;
				
				-webkit-column-gap: 0px; /* Chrome, Safari, Opera */
				-moz-column-gap: 0px; /* Firefox */
				column-gap: 0px;
	
				margin: 0mm;
				padding: 0mm;
			}
		</style>
	</head>
	<body>
		<xsl:for-each select="/deck/card | /deck/charactercard/front | /deck/charactercard/back">
		<xsl:variable name="thecard" select="." />
		<xsl:variable name="number"><xsl:if test="name()='card'"><xsl:value-of select="$thecard/quantity" /></xsl:if><xsl:if test="name()!='card'">1</xsl:if></xsl:variable>
		<xsl:for-each select="1 to $number">
			<xsl:for-each select="$thecard">
				<div>
					<span class="cardname"><xsl:value-of select="name" /><xsl:if test="name()!='card'"><xsl:value-of select="../name" /></xsl:if></span><xsl:for-each select="hp"><span class="hp"><xsl:value-of select="." /> HP</span></xsl:for-each><br/>
					
					<p><em>
					<xsl:for-each select="class | type">
						<xsl:value-of select="." />
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
					</em></p>
					
					<p><xsl:for-each select="text"><xsl:copy-of select="node()" /></xsl:for-each></p>
					<xsl:for-each select="power">
						<p class="power">
							<xsl:if test="name(..)='card'"><span class="powertitle">Power: </span><span class="powertext"><xsl:copy-of select="node()" /></span></xsl:if>
							<xsl:if test="name(..)!='card'"><span class="powertitle"><xsl:copy-of select="name/node()" />: </span><span class="powertext"><xsl:copy-of select="text/node()" /></span></xsl:if>
						</p>
					</xsl:for-each>
					<span class="bottext"><xsl:value-of select="/deck/name" /> (<xsl:value-of select="/deck/version" />)</span>
				</div>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:for-each>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>