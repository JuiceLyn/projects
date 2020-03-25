<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>accueil</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./vue/eleve/styleCSS/Qreponse.css" />
</head>
<header class="head">
			<?php include('./vue/eleve/header.tpl'); ?>
		</header>
<body>
	<div class="ContenuePage">
	<div class ="res">
	<?php
	//var_dump($nombreQuestion);
	//var_dump($note);
	$nombre = 0;
	$id = 0;
	$nbreponse = 0;

	echo'<h5>Votre Note : '.$note.'/20</h5>';

	foreach($liste_qcm as $l){
	$nbreponse = 0;

		if($l['id_quest']!=$id) {
			echo'<br/>';
			while($nbreponse < sizeof($listeRdonnées) && $id==$listeRdonnées[$nbreponse][0]['id_quest']){
				echo'<br/>';
				echo 'Vous avez répondu "'.$listeRdonnées[$nbreponse][0]['texte_rep'].'"';
				if($listeRdonnées[$nbreponse][0]['bvalide']==1)
					echo ' et c\'est une bonne réponse';
				else
					echo ' et c\'est une mauvaise réponse';
				$nbreponse++;
			}
			echo'<br />';
			$nombre++;
			echo '<h5>Question numéro : '.$nombre . '</h5>';
			$id = $l['id_quest'];
			echo '<p>'.$l['titre_theme'].' : '.$l['desc_theme'].'</p>';
			echo '<h6>'.$l['texte'].'</h6>';
		}

		echo $l['texte_rep'].' ';

		$valide = '';
		if($l['bvalide']==1)
			$valide ='checked';

		if($l['bmultiple']==0)
			echo '<td><input type="radio" disabled name = '.$l["id_quest"].'[] '.$valide.' value = '.$l["id_rep"].'></td>';
		else
			echo '<td><input type="checkbox" disabled name = '.$l["id_quest"].'[] '.$valide.' value = '.$l["id_rep"].'></td>';

		echo'<br />';
	}
	echo'<br/>';
			
			$nbreponse++;
			while($nbreponse < sizeof($listeRdonnées)  && $id==$listeRdonnées[$nbreponse][0]['id_quest']){
				echo'<br/>';
				echo 'Vous avez répondu "'.$listeRdonnées[$nbreponse][0]['texte_rep'].'"';
				if($listeRdonnées[$nbreponse][0]['bvalide']==1)
					echo ' et c\'est une bonne réponse';
				else
					echo ' et c\'est une mauvaise réponse';
				$nbreponse++;
			}
?>
</div>
</div>
</body>
</html>