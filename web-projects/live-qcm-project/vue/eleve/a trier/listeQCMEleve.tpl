<!DOCTYPE HTML>
<html lang="fr">

	<head>
	
		<meta charset="utf-8">
		
		<title>Accueil QCM Live</title>
		
		<link rel="stylesheet" href="./vue/eleve/styleCSS/ListeTests.css" />
		
		
	</head>

	<body>
	
		<div class="tableau">
						
			<table>
			
				<h3>Liste des QCM</h3>
				<br/>
				<br/>
				<tr>
					<th></th>
					<th>Numéro du qcm</th>
					<th>Numéro du test</th>
					<th>Numéro de la question</th>
					<th>texte</th>
				</tr>
				
				<?php
				
					foreach ($qcm as $testqcm) {
						echo '<tr><th>';
						echo '<td>' . $testqcm['id_qcm'] . '</td>';
						echo '<td>' . $testqcm['id_test'] . '</td>';
						echo '<td>' . $testqcm['id_quest'] . '</td>';
						echo '<td>' . $testqcm['texte'] . '</td>';

						echo '</th></tr>';
					}


				?>

			</table>
		
		</div>
		
	</body>
	
</html>
