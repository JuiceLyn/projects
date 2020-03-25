<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>accueil </title>
</head>

<body>

	<table>
		<tr>
			<th>Numéro du test</th>
			<th>Titre du test</th>
			<th>Numéro du Groupe</th>
			<th>Date du test</th>
			<th>Actif</th>
		</tr>

		<?php
		foreach($liste_tests as $test){
		echo '<tr>';
			echo '<td >'.$test['id_test'].'</td>';
			echo '<td >'.$test['titre_test'].'</td>';
			echo '<td >'.$test['num_grpe'].'</td>';
			echo '<td >'.$test['date_test'].'</td>';
			if ($test['bActif']){
			echo '<td><input type="checkbox" onchange="lancer(this)" class="modifiable" checked disabled value = '.$test["id_test"].'></td>';
		} else {
		echo '<td><input type="checkbox" onchange="lancer(this)" class="modifiable" disabled value = '.$test["id_test"].' ></td>';
	}
echo '</tr>';
}
?>
</table>
<br/>
<button class="valider" onclick="modifier()">Lancer test</button>
</body>

<script type="text/javascript">
	function modifier(){
		let checkboxs =  document.getElementsByClassName('modifiable')
		if(checkboxs[0].disabled)
			alert("Vous pouvez maintenant lancer des tests en sélectionnant les cases");
		else
			alert("Vous avez décider de bloquer l'état des tests");
		for (element of checkboxs){
			element.disabled ^= true;
		}
	}

	function lancer(element){
		
		if (confirm("Changer l'état du test "+element.value+" ?")) {
			let xhr = new XMLHttpRequest();
			//qui récupèrera les réponses à ./modele/professeur/obtenirReponse.php
			xhr.open('POST', 'index.php?controle=professeur&action=modifierTestActifAJAX', true); //
			
			//quand l'état de la requête change
			xhr.onreadystatechange = function() { // On gère ici une requête asynchrone
				if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200 ){
					let message;
					if(element.checked)
						message = " commence";
					else 
						message = " est terminé";

					alert("Le Test n°" + element.value + message);
				}

			};
	    	//spécification de comment son passé les paramètres
	    	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			//puis la requête reçoit les paramètres puis est envoyée
			let actif = 0;
			if(element.checked)
				actif = 1;
			xhr.send("num=" + element.value + "&actif=" + actif);

		} else{
			element.checked ^=true;

	}
}



</script>
</html>