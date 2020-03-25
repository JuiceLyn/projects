<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>Accueil </title>
</head>
<body>

	<form action ="index.php?controle=professeur&action=ajoutQCM" method="post" id="ajoutQcm">
		NUMERO du Test : <SELECT name="idtest" size="1">
			<?php 
			foreach($liste_tests as $id){
			echo '<OPTION>'.$id['id_test'].'<br></OPTION>';
		}
		?>
	</SELECT><br>
	<table>
		<tr>
			<th>titre Question</th>
			<th>Question</th>
			<th>Ajouter</th>
			<th>Autoriser</th>
			<th>Bloquer</th>
		</tr>

		<?php
		foreach($liste_q as $id => $q){
		echo '<tr>';
			echo '<td >'.$q['titre'].'</td>';
			echo '<td >'.$q['texte'].'</td>';
			echo '<td><input type="checkbox" name="idquest'.$q['id_quest'].'" value = '.$q["id_quest"].' onchange="myFunction(this)" ></td>';
			echo '<td><input type="checkbox" name="autorise'.$q['id_quest'].'" disabled class='.$q["id_quest"].'></td>';
			echo '<td><input type="checkbox" name="bloque'.$q['id_quest'].'" disabled class='.$q["id_quest"].'></td>';
			echo '</tr>';
	}
	?>
</table>
<input type="submit" value="Envoyer">
<br/>
</form>
<script type="text/javascript">
	function myFunction(element) {
		let form = document.getElementById('ajoutQcm');
		let checkboxs = form.getElementsByClassName(element.value);
		for(checkbox of checkboxs) 
			checkbox.disabled ^= true;
	}
</script>

<br/>
</body>
</html>