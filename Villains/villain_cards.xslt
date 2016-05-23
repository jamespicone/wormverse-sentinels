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
			
			.nemesis {
				float: right;
			}
			
			.title {
				float: left;
			}
			
			.bottext {
				font-size: small;
				font-weight: light;
				
				position: absolute;
				bottom: 2mm;
				right: 2mm;
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
		<xsl:for-each select="/deck/card | /deck/villain/front | /deck/villain/back | /deck/specialcard/front | /deck/specialcard/back">
		<xsl:variable name="thecard" select="." />
		<xsl:variable name="number"><xsl:if test="name()='card'"><xsl:value-of select="$thecard/quantity" /></xsl:if><xsl:if test="name()!='card'">1</xsl:if></xsl:variable>
		<xsl:for-each select="1 to $number">
			<xsl:for-each select="$thecard">
				<div>
					<span class="cardname"><xsl:value-of select="name" /><xsl:if test="name()!='card'"><xsl:value-of select="../name" /></xsl:if></span>
					<xsl:for-each select="hp"><span class="hp"><xsl:value-of select="." /> HP</span></xsl:for-each>
					<br/>
					
					<xsl:if test="name()!='card'">
					<p>
					<span class="title"><small>
					<xsl:for-each select="title">
					<em>
					<xsl:value-of select="." />
					</em>
					</xsl:for-each>
					</small></span>
					
					<small><span class="nemesis">
					<xsl:for-each select="nemesis">
					<xsl:if test="position()=1"><strong>N: </strong></xsl:if>
					<xsl:value-of select="." />
					<xsl:if test="position()=last()"></xsl:if>
					</xsl:for-each>
					</span></small></p><br/></xsl:if>
					
					<p><em>
					<xsl:for-each select="class | type">
						<xsl:value-of select="." />
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
					</em></p>
					
					<p><xsl:for-each select="setup"><strong>SETUP:</strong><br/><xsl:copy-of select="node()" /></xsl:for-each></p>
					<p><xsl:for-each select="text"><xsl:copy-of select="node()" /></xsl:for-each></p>
					<p><xsl:for-each select="gameplay"><strong>GAMEPLAY:</strong><br/><xsl:copy-of select="node()" /></xsl:for-each></p>
					<p><xsl:for-each select="advanced"><strong>ADVANCED:</strong><br/><xsl:copy-of select="node()" /></xsl:for-each></p>
					
					<span class="bottext"><xsl:value-of select="/deck/name" /> (<xsl:value-of select="/deck/version" />)</span>
				</div>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:for-each>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>