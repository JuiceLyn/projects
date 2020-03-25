<!doctype html>
<html lang="fr">

<head>
  <meta charset="utf-8">
  <title>accueil </title>
</head>

<body>
	<form action ="" method="post">
		Nom du test : <input type="texte" name="test"><br>
		Groupe : <SELECT name="grp" size="1">
		<?php 
		for($var= 200; $var<209; $var++){
			echo '<OPTION>'.$var.'<br>';
		}
		?>
		</SELECT><br>
		Date du test : <input type="date" name="date"><br>
		Actif : <input type="checkbox" name="actif"><br>
		<div id="questions"></div>
		<p id="ajout">Ajout Question</p>
		<p id="modif">Modifie Question</p>
		<p id="suppression">Supprimer Question</p>
		<?php  echo $m; ?>
		<input type="submit">
	</form>

	


</body></html>
