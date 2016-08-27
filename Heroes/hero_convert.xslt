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
			
				<!--
				<strong><xsl:value-of select="name" />: <xsl:for-each select="hp"><xsl:value-of select="." /> HP</xsl:for-each><br/></strong>
				
				<xsl:for-each select="class | type">
					<em>
					<xsl:value-of select="." />
					<xsl:if test="position()!=last()">, </xsl:if>
					<xsl:if test="position()=last()"><br/></xsl:if>
					</em>
				</xsl:for-each>
				
				<xsl:for-each select="text"><xsl:copy-of select="node()" /></xsl:for-each>
				<xsl:for-each select="power"><br/><strong>Power: </strong><xsl:copy-of select="node()" /></xsl:for-each>-->
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
		<title><xsl:value-of select="/deck/name" /></title>
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
			<xsl:for-each select="/deck/charactercard/front | /deck/charactercard/back | /deck/specialcard/front | /deck/specialcard/back">
				<tr>
					<td>
						<xsl:if test="name(..) = 'charactercard'">C</xsl:if><xsl:if test="name(..) != 'charactercard'">S<xsl:number count="/deck/specialcard/front" level="any"/></xsl:if>
						<xsl:if test="name()='front'"> (front)</xsl:if><xsl:if test="name()='back'"> (back)</xsl:if>
					</td>
					<td>
						<xsl:apply-templates select="." />
					</td>
				</tr>				
			</xsl:for-each>
			<xsl:call-template name="card">
				<xsl:with-param name="i" select="1" />
				<xsl:with-param name="count" select="1" />
			</xsl:call-template>
		</table>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>