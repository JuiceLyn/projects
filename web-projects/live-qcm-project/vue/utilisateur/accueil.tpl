<!DOCTYPE html>
<html lang="fr">

<head>

	<title>Bienvenue !</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, height=device-height, user-scalable=yes" />
	
	<link rel="stylesheet" type="text/css" href="./styleCSS/Accueil.css" />
	
</head>

<body>

	<h3> 	Bienvenue
				<?php 
					printf ('M. %s', $nom);
					
					
					//debogage
					echo ("</br></br> Profil de $nom : ");
					echo("<pre>");
					print_r ($_SESSION['profil']);
					echo("</pre>");
					
					
				?>
		</h3>


</body>
</html>
