xquery version "1.0" encoding "utf-8";

<html>
    <head>
       <meta http-equiv="content-type" content="text/html; charset=utf-8" />
       <link href="style.css" rel="stylesheet" media="all" type="text/css"></link>
       <link href="bootstrap.css" rel="stylesheet" media="all" type="text/css"></link>
    </head>
<body>
		<div class="header">
			<img src="images/logo.png" alt="#" height="150px"/>
		</div>
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
		      	<li><a href="./index.html">Accueil </a></li>
		        <li><a href="../recettes.html">Recettes </a></li>
		        <li><a href="./ingredients.html">Ingredients<span class="sr-only">(current)</span></a></li>
		        <li><a href="./auteurs.html">Auteurs</a></li>
		        <li class="active"><a href="./xqueryout.html">Auteurs-Recette (xquery out)</a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		<!-- Fin Navbarre -->{
for $a in doc("out.xml")//Auteur
return <div>{  (<h1>{ string("Auteur: "),string($a/Pseudo)}</h1>,<span>{string("Recettes :")}</span>,
<ul>{
	for $r in $a/ref-recette
	return
		for $c in doc("out.xml")//Recette[@ID=$r/@ref]
		return <li>{ (string($c/Titre) ,
            for $sc in doc("out.xml")//SousCategory[@scatid=$c/SousCategorie/@scatref]
                return (" | Sous-catégorie: ",string($sc/Nom)))
            }</li>
 }</ul>
)
}</div>
}</body>
</html>
