<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>accueil</title>
</head>

<body>		
<?php

	$id = 0;
	foreach($liste_r as $l){

		if($l['id_quest']!=$id) {
			echo'<br />';
			$id = $l['id_quest'];
			echo '<h6>'.$l['texte'].'</h6>';
		}

		echo $l['texte_rep'].' ';

		if ($l['bvalide']){
				echo '<td><input type="checkbox" checked disabled value = '.$l["id_quest"].'></td>';
			} else {
			echo '<td><input type="checkbox" disabled value = '.$l["id_quest"].' ></td>';
		}
		echo'<br />';
	}
?>
</table>
</body>
</html>