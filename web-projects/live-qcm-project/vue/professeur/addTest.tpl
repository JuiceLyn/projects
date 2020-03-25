<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>accueil </title>
</head>

<body>
	<div class="ajout">

		<form action ="index.php?controle=professeur&action=addTest" method="post">
			Nom du test : <input type="texte" placeholder="" required name="test"><br>
			Groupe : <SELECT name="grp" size="1">
				<?php 
				foreach($classes as $classe)
				echo '<OPTION>'.$classe['num_grpe'].'</OPTION>';
				?>
			</SELECT><br>
			Date du test : <input type="date" required name="date"><br>
			Actif : <input type="checkbox" name="actif"><br>
			<input type="submit" value='Valider' class="valider">
		</form>

	</div>
</body>
</html>
