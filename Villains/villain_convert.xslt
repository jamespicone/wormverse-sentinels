<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="card">
	<xsl:param name="i" />
	<xsl:param name="count" />

	<xsl:for-each select="/deck/card[$i]">
		<xsl:variable name="nextcount" select="$count + quantity" />
		<tr>
			<td>
				<xsl:value-of select="$count" />
				<xsl:if test="quantity != 1">-<xsl:value-of select="$nextcount" /></xsl:if>
			</td>
			<td>
				<strong><xsl:value-of select="name" />: <xsl:for-each select="hp"><xsl:value-of select="." /> HP</xsl:for-each><br/></strong>
				
				<xsl:for-each select="class | type">
					<xsl:value-of select="." />
					<xsl:if test="position()!=last()">, </xsl:if>
					<xsl:if test="position()=last()"><br/></xsl:if>
				</xsl:for-each>
				
				<xsl:for-each select="nemesis"><strong>Nemesis</strong>: <xsl:value-of select="." /><br/><br/></xsl:for-each>
				
				<xsl:for-each select="text"><xsl:value-of select="." /></xsl:for-each>
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
		<style>
			.center {
				margin: auto;
				width: 100%;
				text-align: center;
			}
			
			table {
				width: 100%;
			}
			
			table, th, td {
				border: 1px solid black;
				text-align: center;
			}
			
			td, th {
				padding: 5px;
			}
		</style>
	</head>
	<body>
		<h1 class="center"><xsl:value-of select="/deck/name" /></h1>
		<table>
			<tr>
				<th>#</th><th>Card</th>
			</tr>
			<xsl:for-each select="/deck/villain/front | /deck/villain/back">
				<tr>
					<td>
						V <xsl:if test="name()='front'">(front)</xsl:if><xsl:if test="name()='back'">(back)</xsl:if>
					</td>
					<td>
						<strong><xsl:value-of select="../name" /></strong><br /><br/>
						<xsl:for-each select="hp"><strong><xsl:value-of select="." /> HP</strong><br/><br /></xsl:for-each>
						<xsl:for-each select="title">"<xsl:value-of select="." />"<br/><br/></xsl:for-each>
						<xsl:for-each select="nemesis"><strong>Nemesis</strong>: <xsl:value-of select="." /><br/><br/></xsl:for-each>
						<xsl:for-each select="setup"><strong>SETUP</strong>:<br/><xsl:value-of select="." /><br/><br/></xsl:for-each>
						<xsl:for-each select="gameplay"><strong>GAMEPLAY</strong>:<br/><xsl:value-of select="." /><br/><br/></xsl:for-each>
						<xsl:for-each select="advanced"><strong>ADVANCED</strong>:<br/><xsl:value-of select="." /><br/><br/></xsl:for-each>
					</td>
				</tr>				
			</xsl:for-each>
			<xsl:for-each select="/deck/specialcard/front | /deck/specialcard/back">
				<tr>
					<td>
						S<xsl:number count="/deck/specialcard/front" level="any"/><xsl:if test="name()='front'"> (front)</xsl:if><xsl:if test="name()='back'"> (back)</xsl:if>
					</td>
					<td>
						<strong><xsl:value-of select="../name" /></strong><br /><br/>
						<xsl:for-each select="hp"><strong><xsl:value-of select="." /> HP</strong><br/><br /></xsl:for-each>
						<xsl:for-each select="title">"<xsl:value-of select="." />"<br/><br/></xsl:for-each>
						<xsl:for-each select="nemesis"><strong>Nemesis</strong>: <xsl:value-of select="." /><br/><br/></xsl:for-each>
						<xsl:for-each select="text"><strong>TEXT</strong>:<br/><xsl:value-of select="." /><br/><br/></xsl:for-each>
						<xsl:for-each select="advanced"><strong>ADVANCED</strong>:<br/><xsl:value-of select="." /><br/><br/></xsl:for-each>
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