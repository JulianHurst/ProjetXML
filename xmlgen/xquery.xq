xquery version "1.0" encoding "utf-8";

<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    </head>
<body>{
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
