<!DOCTYPE HTML>
<html lang="fr">

	<head>
	
		<meta charset="utf-8">
		
		<title>Accueil QCM Live</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">		
		<link rel="stylesheet" href="./vue/eleve/styleCSS/ListeTest.css" />
		
		
	</head>

	<header class="head">
	<?php include('./vue/eleve/header.tpl'); ?>
	</header>
	<body>
	
		<div class ="ContenuePage">	
			<div class="tableau">
						<h3>Liste des tests pour l'étudiant</h3>
			<table>
				<br/>
				<br/>
				<tr>
					<th>Numéro du test</th>
					<th>Titre du test</th>
					<th>Numéro du groupe</th>
					<th>Date du test</th>
				</tr>
				
				<?php
				
					foreach ($liste as $test) {
						echo '<td>' . $test['id_test'] . '</td>';;
						echo '<td><a href="index.php?controle=eleve&action=repondreTest&test='.$test["id_test"].'">' . $test['titre_test'] . '</a></td>';
						echo '<td>' . $test['num_grpe'] . '</td>';
						echo '<td>' . $test['date_test'] . '</td>';
						echo '</th></tr>';
					}

				?>

			</table>
		
			</div>
		</div>
		
		<!--<form method="post" action="index.php?controle=eleve&action=accueil" class="ret">
		
			<br/>
			<br/>
			<input type="submit" value="Retour" />

		</form>-->
		
	</body>
	
</html>
