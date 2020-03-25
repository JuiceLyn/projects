<!doctype html>
<html lang="fr">

<head>
  <meta charset="utf-8">
  <title>accueil </title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
	<form action ="index.php?controle=professeur&action=rmTest" method="post" id="retiretTest">
		Test à supprimer : <SELECT name="idtest" size="1">
		<?php 
		
		foreach($liste_tests as $id){
			echo '<OPTION>'.$id['id_test'].'<br>';
		}
		?>
		</SELECT><br>
		<input id="valid" type="submit" class="valider" value="Supprimer">
	</form>
</body></html>
