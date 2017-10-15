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
	<div class="textdiv inbox"><xsl:copy-of select="node()" /></div>
</xsl:template>

<xsl:template match="setup">
	<div class="setupdiv inbox">
		<strong>SETUP:</strong><br/>
		<xsl:copy-of select="node()" />
	</div>
</xsl:template>

<xsl:template match="gameplay">
	<div class="gameplaydiv inbox">
		<strong>GAMEPLAY:</strong><br/>
		<xsl:copy-of select="node()" />
	</div>
</xsl:template>

<xsl:template match="advanced">
	<div class="advanceddiv inbox">
		<strong>ADVANCED:</strong><br/>
		<xsl:copy-of select="node()" />
	</div>
</xsl:template>

<xsl:template match="power">
	<div class="ability inbox">
		<xsl:if test="name(..)='card'"><div class="abilitytitle">Power:</div><div class="abilitytext"><xsl:copy-of select="node()" /></div></xsl:if>
		<xsl:if test="name(..)!='card'"><div class="abilitybox">
			<div class="abilityname"><xsl:copy-of select="name/node()" /></div>
			<div class="abilitytitle">Power: </div><div class="abilitytext"><xsl:copy-of select="text/node()" /></div>
		</div></xsl:if>
	</div>
</xsl:template>

<xsl:template match="ability">
	<div class="ability inbox">
		<xsl:if test="name(..)='card'"><div class="abilitytitle"><xsl:copy-of select="title/node()" />:</div><div class="abilitytext"><xsl:copy-of select="text/node()" /></div></xsl:if>
		<xsl:if test="name(..)!='card'"><div class="abilitybox">
			<div class="abilityname"><xsl:copy-of select="name/node()" /></div>
			<div class="abilitytitle"><xsl:copy-of select="title/node()" />:</div><div class="abilitytext"><xsl:copy-of select="text/node()" /></div>
		</div></xsl:if>
	</div>
</xsl:template>

<xsl:template match="quote">
	<div class="quotediv inbox">
		<p><xsl:copy-of select="text/node()" /></p>
		<strong>--<xsl:value-of select="source/node()" /></strong>
	</div>
</xsl:template>

<xsl:template match="card | charactercard/front | charactercard/back | villain/front | villain/back | specialcard/front | specialcard/back" mode="back">
	<xsl:choose>
		<xsl:when test="name() = 'front'">
		</xsl:when>
		<xsl:when test="name() = 'back'">
			<div class="carddiv">
				<div class="cardinner">
				<div class="titlediv inbox">
					<xsl:apply-templates select="name | ../name" />
					<xsl:apply-templates select="hp" />
				</div>
				
				<xsl:if test="title | nemesis">
					<div class="nemesisdiv inbox"><em>
						<xsl:apply-templates select="title" />
						<span class="nemesis"><xsl:apply-templates select="nemesis" /></span>
					</em></div>
				</xsl:if>
				
				<xsl:if test="class | type">
					<div class="classdiv inbox"><em>
					<xsl:apply-templates select="class | type"/>
					</em></div>
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
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div class="carddiv">
			<div class="cardinner">
				<div class="backtext">
					<xsl:value-of select="/deck/deckname" />
				</div>
			</div>
			</div>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="card | charactercard/front | charactercard/back | villain/front | villain/back | specialcard/front | specialcard/back" mode="front">
	<xsl:if test="not(name()='back')">
		<div class="carddiv">
			<div class="cardinner">
			<div class="titlediv inbox">
				<xsl:apply-templates select="name | ../name" />
				<xsl:apply-templates select="hp" />
			</div>
			
			<xsl:if test="title | nemesis">
				<div class="nemesisdiv inbox"><em>
					<xsl:apply-templates select="title" />
					<span class="nemesis"><xsl:apply-templates select="nemesis" /></span>
				</em></div>
			</xsl:if>
			
			<xsl:if test="class | type">
				<div class="classdiv inbox"><em>
				<xsl:apply-templates select="class | type"/>
				</em></div>
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
		</div>
	</xsl:if>
</xsl:template>

<xsl:template match="card | charactercard/front | charactercard/back | villain/front | villain/back | specialcard/front | specialcard/back">
	<div class="carddiv">
		<div class="titlediv inbox">
			<xsl:apply-templates select="name | ../name" />
			<xsl:apply-templates select="hp" />
		</div>
		
		<xsl:if test="title | nemesis">
			<div class="nemesisdiv inbox"><em>
				<xsl:apply-templates select="title" />
				<span class="nemesis"><xsl:apply-templates select="nemesis" /></span>
			</em></div>
		</xsl:if>
	
		<xsl:if test="class | type">
			<div class="classdiv inbox"><em>
			<xsl:apply-templates select="class | type"/>
			</em></div>
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

<xsl:template match="/deck">
	<title><xsl:value-of select="deckname" /></title>
	<link rel="stylesheet" type="text/css" href="../cards.css" />
</xsl:template>

<xsl:template match="/deck" mode="image">
	<title><xsl:value-of select="deckname" /></title>
	<link rel="stylesheet" type="text/css" href="../cards.css" />
	<link rel="stylesheet" type="text/css" href="../images.css" />
	
	<style>
		.carddiv {
			color: <xsl:value-of select="textcolour" />;
			background-color: <xsl:value-of select="cardcolour" />;
		}
		
		.inbox {
			background-color: <xsl:value-of select="boxcolour" />;
		}
	</style>
	
</xsl:template>

<xsl:template name="card">
<html>
	<head>
		<xsl:apply-templates select="deck" />
	</head>
	<body>
		<xsl:for-each select="/deck/card | /deck/villain/front | /deck/villain/back | /deck/specialcard/front | /deck/specialcard/back | /deck/charactercard/front | /deck/charactercard/back">
		<xsl:variable name="thecard" select="." />
		<xsl:variable name="number"><xsl:if test="name()='card'"><xsl:value-of select="$thecard/quantity" /></xsl:if><xsl:if test="name()!='card'">1</xsl:if></xsl:variable>
		<xsl:for-each select="1 to $number">
			<xsl:apply-templates select="$thecard" />
		</xsl:for-each>
	</xsl:for-each>
	</body>
</html>

</xsl:template>

<xsl:template name="front">
<html>
	<head>
		<xsl:apply-templates select="deck" mode="image" />
	</head>
	<body>
		<xsl:for-each select="/deck/card | /deck/specialcard/front | /deck/villain/front | /deck/charactercard/front">
			<xsl:variable name="thecard" select="." />
			<xsl:variable name="number">
				<xsl:if test="name()='card'"><xsl:value-of select="$thecard/quantity" /></xsl:if>
				<xsl:if test="name()!='card'">1</xsl:if>
			</xsl:variable>
			<xsl:for-each select="1 to $number">
				<xsl:for-each select="$thecard">
					<xsl:apply-templates select="." mode="front"/>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each>
	</body>
</html>
</xsl:template>

<xsl:template name="back">
<html>
	<head>
		<xsl:apply-templates select="deck" mode="image" />
	</head>
	<body>
		<xsl:for-each select="/deck/card | /deck/villain/back | /deck/specialcard/back | /deck/charactercard/back">
			<xsl:variable name="thecard" select="." />
			<xsl:variable name="number">
				<xsl:if test="name()='card'"><xsl:value-of select="$thecard/quantity" /></xsl:if>
				<xsl:if test="name()!='card'">1</xsl:if>
			</xsl:variable>
			<xsl:for-each select="1 to $number">
				<xsl:for-each select="$thecard">
					<xsl:apply-templates select="." mode="back" />
				</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>