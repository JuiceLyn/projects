<!DOCTYPE HTML>
<html lang="fr">

	<head>
	
		<meta charset="utf-8">
		
		<title>Resultat</title>
		
		<link rel="stylesheet" href="./vue/eleve/styleCSS/ListeTests.css" />
		
		
	</head>

	<body>
	
		<div class="tableau">
						
			<table>
			
				<h3>Vos résultats</h3>
				<br/>
				<br/>
				<tr>
					<th></th>
					<th>Test</th>
					<th>Question</th>
					<th>Date du Resultat</th>
                    <th>Votre réponse</th>
                    <th>Bonne réponse</th>



				</tr>
				
				<?php
				
					foreach ($res as $test) {
						echo '<tr><th>';
						echo '<td>' . $test['id_test'] . '</td>';
						echo '<td>' . $test['id_quest'] . '</td>';
						echo '<td>' . $test['date_res'] . '</td>';
						echo '<td>' . $test['id_rep'] . '</td>';
                        if($test['bvalide']==1) {
                            echo '<td>' . "OUI". '</td>';
                        }
                        else {
                            echo '<td>' . "NON". '</td>';
                        }

						echo '</th></tr>';
					}
                    

				?>

			</table>
		
		</div>
		
		<form method="post" action="index.php?controle=eleve&action=accueil">
		
			<br/>
			<br/>

		</form>
		
	</body>
	
</html>
