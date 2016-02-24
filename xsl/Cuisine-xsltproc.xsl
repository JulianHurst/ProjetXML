<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:exsl="http://exslt.org/common"
                extension-element-prefixes="exsl">
 <xsl:key name="ing" match="Ingredient" use="@IDIngredient"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:template match="/">
<exsl:document href="index.html" method="html">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="style.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
	<h1>Bienvenue au site de recettes xhtml</h1>
	<div id="links">
		<a href="recettes.html">Recettes</a><br/>
		<a href="ingredients.html">Ingredients</a><br/>
		<a href="auteurs.html">Auteurs</a><br/>
	</div>
	</body>
</html>

</exsl:document>
<exsl:document href="recettes.html" method="html">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="style.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
	<div id="links">
		<a href="ingredients.html">Ingredients</a><br/>
		<a href="auteurs.html">Auteurs</a><br/>
	</div>
	<xsl:call-template name="indexR"/>
	<h1 style="text-decoration: underline;">Recettes:</h1>
	<xsl:call-template name="liste-des-recettes"/>
	</body>
</html>

</exsl:document>

<exsl:document href="ingredients.html" method="html">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="style.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
	<div id="links">
	<a href="recettes.html">Recettes</a><br/>
	<a href="auteurs.html">Auteurs</a><br/>
	</div>
	<xsl:call-template name="indexI"/>
	<h1 style="text-decoration: underline;">Ingredients:</h1>
	<xsl:call-template name="ing"/>
	</body>
</html>

</exsl:document>
<exsl:document href="auteurs.html" method="html">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="style.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
	<div id="links">
		<a href="recettes.html">Recettes</a><br/>
		<a href="ingredients.html">Ingredients</a><br/>
	</div>
	<xsl:call-template name="indexA"/>
	<h1 style="text-decoration: underline;">Auteurs:</h1>
	<xsl:call-template name="auteurs"/>
	</body>
</html>

</exsl:document>
<xsl:for-each select="//Recette">
	<exsl:document href="Recettes/recette-{generate-id(@ID)}.html" method="html">
		<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="../style.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
	<div id="links">
        <a href="../recettes.html">Recettes</a><br/>
        <a href="../ingredients.html">Ingredients</a><br/>
        <a href="../auteurs.html">Auteurs</a><br/>
	</div>
	<div>
		<h2 id="{generate-id(@ID)}"><xsl:value-of select="Titre"/></h2>
		<img alt="{Titre}" src="../../{Photo}"/><br/>
    <br/>
    Resume : <br/>
		<p><xsl:value-of select="Resume"/></p>
    Date : <xsl:value-of select="Date"/><br/>
		Difficulté : <xsl:value-of select="Difficulte"/><br/>
    <br/>
		Ingredients :<br/>
    <xsl:for-each select="ListeIngredients/Ingredients">
      - <!-- <xsl:value-of select="id(@IDIngredientRef)/Nom"/> --><xsl:value-of select="key('ing',@IDIngredientRef)"/> : <xsl:value-of select="."/><br/>
    </xsl:for-each>
    <br/>
		Nombre de personnes : <xsl:value-of select="NbPersonnes"/><br/>
		Temps de Préparation : <xsl:value-of select="TpsPreparation"/><br/>
		Temps de Cuisson : <xsl:value-of select="TpsCuisson"/><br/>
		Temps de Repos : <xsl:value-of select="TpsRepos"/><br/>
		Description : <xsl:value-of select="Desc"/><br/>
		Note : <xsl:value-of select="Note"/>
	</div>
	</body>
</html>

	</exsl:document>
</xsl:for-each>

<xsl:for-each select="//Auteur">
	<exsl:document href="Auteurs/auteur-{generate-id(@IDAuteur)}.html" method="html">
		<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="../style.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
	<div id="links">
        <a href="../recettes.html">Recettes</a><br/>
		<a href="../ingredients.html">Ingredients</a><br/>
		<a href="../auteurs.html">Auteurs</a><br/>
	</div>
	<div>
		<h2 id="{generate-id(@IDAuteur)}"><xsl:value-of select="@IDAuteur"/></h2>
		<xsl:value-of select="*"/>
	</div>
	</body>
</html>
	</exsl:document>
</xsl:for-each>

<xsl:for-each select="//Ingredient">
	<exsl:document href="Ingredients/ing-{generate-id(@IDIngredient)}.html" method="html">
		<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="../style.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
	<div id="links">
        <a href="../recettes.html">Recettes</a><br/>
		<a href="../ingredients.html">Ingredients</a><br/>
		<a href="../auteurs.html">Auteurs</a><br/>
	</div>
	<div>
		<h2 id="{generate-id(@IDIngredient)}"><xsl:value-of select="Nom"/></h2>
			<xsl:value-of select="ApportNut"/>
			<xsl:value-of select="ApportEn"/>
			<xsl:value-of select="Saison"/>
			<p><xsl:value-of select="Descriptif"/></p>
	</div>
	</body>
</html>
	</exsl:document>
</xsl:for-each>
-->
<!--
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
</html>-->
</xsl:template>

<xsl:template name="liste-des-recettes">
	<div>
	<xsl:for-each select="//Recette">
		<h2 id="{generate-id(@ID)}"><a href="Recettes/recette-{generate-id(@ID)}.html"><xsl:value-of select="Titre"/></a></h2>
		<img alt="{Titre}" src="../{Photo}"/><br/>
    <br/>
    Resume : <br/>
		<p><xsl:value-of select="Resume"/></p>
		Date : <xsl:value-of select="Date"/><br/>
		Difficulté : <xsl:value-of select="Difficulte"/><br/>
    <br/>
		Ingredients :<br/>
    <xsl:for-each select="ListeIngredients/Ingredients">
      <!--<xsl:value-of select="id(@IDIngredientRef)/Nom"/> -->
      -<xsl:value-of select="key('ing',@IDIngredientRef)"/> : <xsl:value-of select="."/><br/>
    </xsl:for-each>
    <br/>
		Nombre de personnes : <xsl:value-of select="NbPersonnes"/><br/>
		Temps de Préparation : <xsl:value-of select="TpsPreparation"/><br/>
		Temps de Cuisson : <xsl:value-of select="TpsCuisson"/><br/>
		Temps de Repos : <xsl:value-of select="TpsRepos"/><br/>
		Description : <xsl:value-of select="Desc"/><br/>
		Note : <xsl:value-of select="Note"/>
	</xsl:for-each>
	</div>
</xsl:template>

<xsl:template name="auteurs">
	<xsl:for-each select="//Auteur">
		<h2 id="{generate-id(@IDAuteur)}"><a href="Auteurs/auteur-{generate-id(@IDAuteur)}.html"><xsl:value-of select="@IDAuteur"/></a></h2>
		<div>
		<xsl:value-of select="*"/>
		</div>
	</xsl:for-each>
</xsl:template>

<xsl:template name="indexA">
	<p style="text-decoration: underline;font-weight: bold;">Auteurs:</p>
	<ul id="indA">
	<xsl:for-each select="//Auteur">
		<li><a href="#{generate-id(@IDAuteur)}"><xsl:value-of select="@IDAuteur"/></a></li>
	</xsl:for-each>
	</ul>
</xsl:template>

<xsl:template name="indexR">
	<p style="text-decoration: underline;font-weight: bold;">Recettes:</p>
	<ul id="indR">
	<xsl:for-each select="//Recette">
		<li><a href="#{generate-id(@ID)}"><xsl:value-of select="Titre"/></a></li>
	</xsl:for-each>
	</ul>
</xsl:template>

<xsl:template name="indexI">
	<p style="text-decoration: underline;font-weight: bold;">Ingredients:</p>
	<ul id="indI">
	<xsl:for-each select="//Ingredient">
		<li><a href="#{generate-id(@IDIngredient)}"><xsl:value-of select="Nom"/></a></li>
	</xsl:for-each>
	</ul>
</xsl:template>

<xsl:template name="ing">
	<div>
		<xsl:for-each select="//Ingredient">
			<h2 id="{generate-id(@IDIngredient)}"><a href="Ingredients/ing-{generate-id(@IDIngredient)}.html"><xsl:value-of select="Nom"/></a></h2>
			<xsl:value-of select="ApportNut"/>
			<xsl:value-of select="ApportEn"/>
			<xsl:value-of select="Saison"/>
			<p><xsl:value-of select="Descriptif"/></p>
		</xsl:for-each>
	</div>
</xsl:template>
</xsl:stylesheet>
