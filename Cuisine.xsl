<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions">
<xsl:output method="xhtml" indent="yes" encoding="iso-8859-1"/>

<xsl:template match="/">
<html>
	<head>
		<title></title>
	</head>
	<body>
		<xsl:call-template name="indexR"/>
		<xsl:call-template name="indexI"/>
		<xsl:call-template name="indexA"/>		
		<h1 style="text-decoration: underline;">Recettes:</h1>
		<xsl:call-template name="liste-des-recettes"/>
		<h1 style="text-decoration: underline;">Ingredients:</h1>
		<xsl:call-template name="ing"/>	
		<h1 style="text-decoration: underline;">Auteurs:</h1>
		<xsl:call-template name="auteurs"/>
	</body>
</html>
</xsl:template>

<xsl:template name="liste-des-recettes">
	<div>
	<xsl:for-each select="//Recette">
		<h2 id="{generate-id(@ID)}"><xsl:value-of select="Titre"/></h2>
		<p><xsl:value-of select="Resume"/></p>
		<xsl:value-of select="Photo"/><br/>
		<xsl:value-of select="Date"/><br/>
		<xsl:value-of select="Difficulte"/><br/>
		<xsl:value-of select="ListeIngredients"/><br/>
		<xsl:value-of select="NbPersonnes"/><br/>
		<xsl:value-of select="TpsPreparation"/><br/>
		<xsl:value-of select="TpsCuisson"/><br/>
		<xsl:value-of select="TpsRepos"/><br/>
		<xsl:value-of select="Desc"/><br/>
		<xsl:value-of select="Note"/>		
	</xsl:for-each>
	</div>
</xsl:template>

<xsl:template name="auteurs">	
	<xsl:for-each select="//Auteur">
		<h2 id="{generate-id(@IDAuteur)}"><xsl:value-of select="@IDAuteur"/></h2>
		<div>
		<xsl:value-of select="."/>					
		</div>		
	</xsl:for-each>	
</xsl:template>

<xsl:template name="indexA">
	<p style="text-decoration: underline;font-weight: bold;">Auteurs:</p>
	<ul>	
	<xsl:for-each select="//Auteur">
		<li><a href="#{generate-id(@IDAuteur)}"><xsl:value-of select="@IDAuteur"/></a></li>		
	</xsl:for-each>
	</ul>
</xsl:template>

<xsl:template name="indexR">
	<p style="text-decoration: underline;font-weight: bold;">Recettes:</p>
	<ul>
	<xsl:for-each select="//Recette">
		<li><a href="#{generate-id(@ID)}"><xsl:value-of select="Titre"/></a></li>
	</xsl:for-each>		
	</ul>
</xsl:template>

<xsl:template name="indexI">
	<p style="text-decoration: underline;font-weight: bold;">Ingredients:</p>
	<ul>
	<xsl:for-each select="//Ingredient">
		<li><a href="#{generate-id(@IDIngredient)}"><xsl:value-of select="Nom"/></a></li>
	</xsl:for-each>		
	</ul>
</xsl:template>

<xsl:template name="ing">
	<div>
		<xsl:for-each select="//Ingredient">
			<h2 id="{generate-id(@IDIngredient)}"><xsl:value-of select="Nom"/></h2>
			<xsl:value-of select="ApportNut"/>
			<xsl:value-of select="ApportEn"/>
			<xsl:value-of select="Saison"/>
			<p><xsl:value-of select="Descriptif"/></p>
		</xsl:for-each>
	</div>
</xsl:template>
</xsl:stylesheet>
