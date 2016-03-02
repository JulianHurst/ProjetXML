<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:exsl="http://exslt.org/common"
                extension-element-prefixes="exsl">
<xsl:key name="ing" match="Ingredient" use="@IDIngredient"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:template match="/">

<xsl:result-document href="file:///C:/Users/kelku/Documents/GitHub/ProjetXML/Test/out/index.html">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="style.css" rel="stylesheet" media="all" type="text/css"/>
		<link href="bootstrap.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">xml Cook</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		      	<li class="active"><a href="index.html">Accueil <span class="sr-only">(current)</span></a></li>
		        <li><a href="recettes.html">Recettes </a></li>
		        <li><a href="ingredients.html">Ingredients</a></li>
		        <li><a href="auteurs.html">Auteurs</a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	</body>
</html>

</xsl:result-document>
<xsl:result-document href="file:///C:/Users/kelku/Documents/GitHub/ProjetXML/Test/out/recettes.html">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="style.css" rel="stylesheet" media="all" type="text/css"/>
		<link href="bootstrap.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
		<div id="links">
			<nav class="navbar navbar-default">
			  <div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="#">xml Cook</a>
			    </div>
			
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			      	<li><a href="index.html">Accueil </a></li>
			        <li class="active"><a href="recettes.html">Recettes <span class="sr-only">(current)</span></a></li>
			        <li><a href="ingredients.html">Ingredients</a></li>
			        <li><a href="auteurs.html">Auteurs</a></li>
			      </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
		</div>
		<div class="ingTable">
			<table class="table">
				<thead>
					<tr>
						<th>Image</th>
						<th>Nom</th>
						<th>Information</th>
					</tr>
				</thead>
				<xsl:for-each select="//Recette">
				<div class="ingTable">
					<tbody>
						<tr>
							<td><img src="{Photo}" alt="#" class="img-rounded" height="100px" width="100px"/></td>
							<td><a href="./recettes/recette-{generate-id(@ID)}.html"><xsl:value-of select="Titre"/></a></td>
							<td>
								<ul>
									<li id="lir">Nombre de personne : <xsl:value-of select="NbPersonnes"/></li>
									<li id="lir">Temps de préparation : <xsl:value-of select="TpsPreparation"/></li>
									<li id="lir">Temps de cuisson : <xsl:value-of select="TpsCuisson"/></li>
									<li id="lir">Temps de repos : <xsl:value-of select="TpsRepos"/></li>
								</ul>
							</td>
						</tr>
						</tbody>
					</div>
				</xsl:for-each>
			</table>
		</div>
	</body>
</html>

</xsl:result-document>

<xsl:result-document href="file:///C:/Users/kelku/Documents/GitHub/ProjetXML/Test/out/ingredients.html">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="style.css" rel="stylesheet" media="all" type="text/css"/>
		<link href="bootstrap.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
		<!-- Début Navbarre -->
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">xml Cook</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		      	<li><a href="index.html">Accueil </a></li>
		        <li><a href="recettes.html">Recettes </a></li>
		        <li class="active"><a href="ingredients.html">Ingredients<span class="sr-only">(current)</span></a></li>
		        <li><a href="auteurs.html">Auteurs</a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		<!-- Fin Navbarre -->
		
	<h1 style="text-decoration: underline;">Liste des ingrédients :</h1>
	<xsl:call-template name="ing"/>
	</body>
</html>

</xsl:result-document>
<xsl:result-document href="file:///C:/Users/kelku/Documents/GitHub/ProjetXML/Test/out/auteurs.html">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="style.css" rel="stylesheet" media="all" type="text/css"/>
		<link href="bootstrap.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
		<!-- Début Navbarre -->
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">xml Cook</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		      	<li><a href="index.html">Accueil </a></li>
		        <li><a href="recettes.html">Recettes </a></li>
		        <li><a href="ingredients.html">Ingredients</a></li>
		        <li class="active"><a href="auteurs.html">Auteurs<span class="sr-only">(current)</span></a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		<!-- Fin Navbarre -->
		
		<h1 style="text-decoration: underline;">Liste des auteurs:</h1>
		<xsl:call-template name="auteurs"/>
	</body>
</html>

</xsl:result-document>
<xsl:for-each select="//Recette">
	<xsl:result-document href="file:///C:/Users/kelku/Documents/GitHub/ProjetXML/Test/out/Recettes/recette-{generate-id(@ID)}.html">
		<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="../style.css" rel="stylesheet" media="all" type="text/css"/>
		<link href="../bootstrap.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
		<!-- Début Navbarre -->
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="../index.html">xml Cook</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		      	<li><a href="../index.html">Accueil </a></li>
		        <li class="active"><a href="../recettes.html">Recettes </a></li>
		        <li><a href="../ingredients.html">Ingredients<span class="sr-only">(current)</span></a></li>
		        <li><a href="../auteurs.html">Auteurs</a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		<!-- Fin Navbarre -->
		
		<div>
			<h2 id="{generate-id(@ID)}"><xsl:value-of select="Titre"/> :</h2>
	    	<div class="imgRecette"><img alt="{Titre}" class="img-rounded" src="../{Photo}" width="500px" height="500px"/></div>
			<div class="resumeRecette">
				<table>
					<tbody>
						<tr>
							<td class="rct" colspan="2">Résumé :</td>
						</tr>
						<tr>
							<td class="rct" >Dificulté</td>
							<td class="rct" ><xsl:value-of select="Difficulte"/></td>
						</tr>
						<tr>
							<td class="rct" >Date</td>
							<td class="rct" ><xsl:value-of select="Date"/></td>
						</tr>
						<tr>
							<td class="rct" >Nombre de personne</td>
							<td class="rct" ><xsl:value-of select="NbPersonnes"/></td>
						</tr>
						<tr>
							<td class="rct" >Temps de préparation</td>
							<td class="rct" ><xsl:value-of select="TpsPreparation"/></td>
						</tr>
						<tr>
							<td class="rct" >Temps de cuisson</td>
							<td class="rct" ><xsl:value-of select="TpsCuisson"/></td>
						</tr>
						<tr>
							<td class="rct" >Temps de repos</td>
							<td class="rct" ><xsl:value-of select="TpsRepos"/></td>
						</tr>
						<tr>
							<td class="rct" >Résumé</td>
							<td class="rct" ><xsl:value-of select="Resume"/></td>
						</tr>
						<tr>
							<td class="rctSpacing"  colspan="2"> </td>
						</tr>
						<tr>
							<td class="rct"  colspan="2">Ingrédients : </td>
						</tr>
						<xsl:for-each select="ListeIngredients/Ingredients">
						<tr>
							<td class="rct" ><xsl:value-of select="key('ing',@IDIngredientRef)"/></td>
							<td class="rct" ><xsl:value-of select="."/></td>		
						</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</div><br/>
			<div>
				<h4>Description :</h4>
				<div> <xsl:value-of select="Desc"/></div>
				<h4>Note : </h4>
				<div><xsl:value-of select="Note"/></div>
			</div>
		</div>
	</body>
</html>

	</xsl:result-document>
</xsl:for-each>

<xsl:for-each select="//Auteur">
	<xsl:result-document href="file:///C:/Users/kelku/Documents/GitHub/ProjetXML/Test/out/Auteurs/auteur-{generate-id(@IDAuteur)}.html">
		<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="../style.css" rel="stylesheet" media="all" type="text/css"/>
		<title></title>
	</head>
	<body>
		<!-- Début Navbarre -->
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="../index.html">xml Cook</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		      	<li><a href="../index.html">Accueil </a></li>
		        <li><a href="../recettes.html">Recettes </a></li>
		        <li class="active"><a href="../ingredients.html">Ingredients<span class="sr-only">(current)</span></a></li>
		        <li><a href="../auteurs.html">Auteurs</a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		<!-- Fin Navbarre -->
		
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
	</xsl:result-document>
</xsl:for-each>

<xsl:for-each select="//Ingredient">
	<xsl:result-document href="file:///C:/Users/kelku/Documents/GitHub/ProjetXML/Test/out/Ingredients/ing-{generate-id(@IDIngredient)}.html">
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
	</xsl:result-document>
</xsl:for-each>
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
	<table class="table">
		<thead>
			<tr>
				<td>Pseudo</td>
				<td>Pay</td>
				<td>Sexe</td>
			</tr>
		</thead>
		<tbody>
			<xsl:for-each select="//Auteur">
				<tr>
					<td><h5 id="{generate-id(@IDAuteur)}"><a href="Auteurs/auteur-{generate-id(@IDAuteur)}.html"><xsl:value-of select="@IDAuteur"/></a></h5></td>
					<td><xsl:value-of select="Pays"/></td>
					<td><xsl:value-of select="Sexe"/></td>
				</tr>
			</xsl:for-each>
		</tbody>
	</table>
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
	<div class="tableIng">
		<table class="table">
				<thead>
					<tr>
						<th>Ingrédient</th>
						<th>Apport nutritionnel</th>
						<th>Apport énergétique</th>
						<th>Saison</th>
					</tr>
				</thead>
			<xsl:for-each select="//Ingredient">
				<tbody>
					<td class="tdIng"><h5 id="{generate-id(@IDIngredient)}"><a href="Ingredients/ing-{generate-id(@IDIngredient)}.html"><xsl:value-of select="Nom"/></a></h5></td>
					<td class="tdIng"><xsl:value-of select="ApportNut"/></td>
					<td class="tdIng"><xsl:value-of select="ApportEn"/></td>
					<td class="tdIng"><xsl:value-of select="Saison"/></td>
				</tbody>
			</xsl:for-each>
		</table>
	</div>
</xsl:template>
</xsl:stylesheet>
