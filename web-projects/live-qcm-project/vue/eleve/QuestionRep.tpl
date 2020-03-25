<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>accueil</title>
	<link rel="stylesheet" href="./vue/eleve/styleCSS/Qreponse.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<header class="head">
	<?php include('./vue/eleve/header.tpl'); ?>
	</header>
<body>
		<div class = "ContenuePage">
		<?php

			if (isset($_POST))
				echo '<form action="index.php?controle=eleve&action=vérifierRéponses&test='. $_GET['test'].'" method="post">';		
			
			$nombre = 0;
			$id = 0;
			$nbrep = 0;
			foreach($liste_qcm as $l){
			
				if ($l['bAutorise'] == 1 & $l['bBloque'] == 0) {
					if($l['id_quest']!=$id) {
						echo'<br />';
						$nombre++;
						$nbrep = 0;
						echo '<h5>Question numéro : '.$nombre . '</h5>';
						$id = $l['id_quest'];
						echo '<p>'.$l['titre_theme'].' : '.$l['desc_theme'].'</p>';
						echo '<h6>'.$l['texte'].'</h6>';
					
					}
					$nbrep++;

					echo $l['texte_rep'].' ';

					if($l['bmultiple']==0)
					echo '<td><input type="radio" name = '.$l["id_quest"].'[] value = '.$l["id_rep"].'></td>';
						else
					echo '<td><input type="checkbox" name = '.$l["id_quest"].'[] value = '.$l["id_rep"].'></td>';

					echo'<br />';
				}
			
				if ($l['bAutorise'] == 0 & $l['bBloque'] == 1) {
					if($l['id_quest']!=$id) {
						echo'<br />';
						$nombre++;
						$nbrep = 0;
						echo '<h5>Question numéro : '.$nombre . '</h5>';
						$id = $l['id_quest'];
						echo '<p>'.$l['titre_theme'].' : '.$l['desc_theme'].'</p>';
						echo '<h6>'.$l['texte'].'</h6>';
					
					}
					$nbrep++;

					echo $l['texte_rep'].' ';
					
					if($l['bmultiple']==0)
					echo '<td><input type="radio" disabled name = '.$l["id_quest"].'[] value = '.$l["id_rep"].'></td>';
						else
					echo '<td><input type="checkbox" disabled name = '.$l["id_quest"].'[] value = '.$l["id_rep"].'></td>';

					echo'<br />';
				}
				
			}
		?>

		<?php
			if(isset($_SESSION['profil']['id_etu']))
				echo '<input type="submit" value="Envoyer les réponses">';
			
		?>
		</div>
</form>
</table>
</body>
</html>