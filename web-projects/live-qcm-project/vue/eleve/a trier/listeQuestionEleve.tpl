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
			
				<h3>Réponses possibles</h3>
				<br/>
				<br/>
				<tr>
					<th></th>
					<th>Numéro de la réponse</th>
					<th>Texte de la réponse</th>
					<th>Numéro de la question</th>
				</tr>
				
				<?php
				
					foreach ($rep as $testrep) {
						echo '<tr><th>';
						echo '<td>' . $testrep['id_rep'] . '</td>';
						echo '<td>' . $testrep['texte_rep'] . '</td>';
						echo '<td>' . $testrep['id_quest'] . '</td>';
						echo '<td><input type="checkbox"></td>';

						echo '</th></tr>';
					}

				?>

			</table>

	<form action ="index.php?controle=eleve&action=afficherRes" method="post">
		Choisir la bonne réponse: <SELECT name="id_rep" size="1">
		<?php 
		
		foreach($rep as $id){
			echo '<OPTION value	='.$id['id_rep'].'>'.$id['texte_rep']. '<br>';
			
			
		}
		?>
		
		
			
		
		

		</SELECT><br>

		Choisir question: <SELECT name="quest" size="1">
		
		<?php 
		
			foreach($rep as $q){
			echo '<OPTION>'.$q['id_quest']. '<br>';
			
			
		}
			
		?>
		</SELECT><br>
		

		Choisir test: <SELECT name="test" size="1">
		
		<?php 
		
			foreach($rep as $t){
			echo '<OPTION>'.$t['id_test']. '<br>';
			
			
		}
			
		?>
		</SELECT><br>
		<input type="submit" >

	</form>

		
		</div>
		
	</body>
	
</html>
