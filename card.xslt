<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="class | type">
	<xsl:value-of select="." />
	<xsl:if test="position()!=last()">, </xsl:if>
</xsl:template>

<xsl:template match="hp">
	<span class="hp"><xsl:value-of select="." /> HP</span>
</xsl:template>

<xsl:template match="title">
	<span class="title"><xsl:value-of select="." /></span>
</xsl:template>

<xsl:template match="nemesis">
	<xsl:if test="position()=1">N: </xsl:if>
	<xsl:value-of select="." />
	<xsl:if test="position()!=last()">, </xsl:if>
</xsl:template>

<xsl:template match="name">
	<span class="cardname"><xsl:value-of select="." /></span>
</xsl:template>

<xsl:template match="text">
	<div class="textdiv"><xsl:copy-of select="node()" /></div>
</xsl:template>

<xsl:template match="setup">
	<div class="setupdiv">
		<strong>SETUP:</strong><br/>
		<xsl:copy-of select="node()" />
	</div>
</xsl:template>

<xsl:template match="gameplay">
	<div class="gameplaydiv">
		<strong>GAMEPLAY:</strong><br/>
		<xsl:copy-of select="node()" />
	</div>
</xsl:template>

<xsl:template match="advanced">
	<div class="advanceddiv">
		<strong>ADVANCED:</strong><br/>
		<xsl:copy-of select="node()" />
	</div>
</xsl:template>

<xsl:template match="power">
	<div class="power">
		<xsl:if test="name(..)='card'"><div class="abilitytitle">Power:</div><div class="abilitytext"><xsl:copy-of select="node()" /></div></xsl:if>
		<xsl:if test="name(..)!='card'"><div class="abilitybox">
			<div class="abilityname"><xsl:copy-of select="name/node()" /></div>
			<div class="abilitytitle">Power: </div><div class="abilitytext"><xsl:copy-of select="text/node()" /></div>
		</div></xsl:if>
	</div>
</xsl:template>

<xsl:template match="ability">
	<div class="ability">
		<xsl:if test="name(..)='card'"><div class="abilitytitle"><xsl:copy-of select="title/node()" />:</div><div class="abilitytext"><xsl:copy-of select="text/node()" /></div></xsl:if>
		<xsl:if test="name(..)!='card'"><div class="abilitybox">
			<div class="abilityname"><xsl:copy-of select="name/node()" /></div>
			<div class="abilitytitle"><xsl:copy-of select="title/node()" />:</div><div class="abilitytext"><xsl:copy-of select="text/node()" /></div>
		</div></xsl:if>
	</div>
</xsl:template>

<xsl:template match="quote">
	<div class="quotediv">
		<p><xsl:value-of select="text/node()" /></p>
		<strong>--<xsl:value-of select="source/node()" /></strong>
	</div>
</xsl:template>

<xsl:template match="card | charactercard/front | charactercard/back | villain/front | villain/back | specialcard/front | specialcard/back">
	<div class="carddiv">
		<div class="titlediv">
			<xsl:apply-templates select="name | ../name" />
			<xsl:apply-templates select="hp" />
		</div>
		
		<xsl:if test="title | nemesis | class | type">
			<div class="nemesisdiv"><em>
				<xsl:apply-templates select="title" />
				<xsl:if test="not(../title)">
					<em><xsl:apply-templates select="class | type"/></em>
				</xsl:if>
				<span class="nemesis"><xsl:apply-templates select="nemesis" /></span>
			</em></div>
		</xsl:if>
		
		<xsl:if test="title">
			<xsl:if test="class | type">
				<div class="classdiv"><em>
				<xsl:apply-templates select="class | type"/>
				</em></div>
			</xsl:if>
		</xsl:if>
		
		<xsl:apply-templates select="setup" />
		<xsl:apply-templates select="text" />
		<xsl:apply-templates select="gameplay" />
		<xsl:apply-templates select="advanced" />
		
		<xsl:apply-templates select="power" />
		<xsl:apply-templates select="ability" />
		<xsl:apply-templates select="quote" />
		
		<div class="versiondiv"><xsl:value-of select="/deck/version" /></div>
	</div>
</xsl:template>
</xsl:stylesheet>