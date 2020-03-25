<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>accueil </title>
</head>

<body>
	<!-- <?php var_dump($classes); ?> -->
	<div id="conteneur">
		<form method="post" action="index.php?controle=professeur&action=exportExcel">
		<select name ="test" id="test">
			<option>Choissisez un test</option>
			<?php ;
			foreach($liste_tests as $test)
				echo '<OPTION value='.$test["id_test"].'>'.$test['titre_test'].'</OPTION>';
				
			?>
		</select>
		<table id="tableauNote">
			<tr>
				<th>Nom</th>
				<th>Prénom</th>
				<th>Note</th>
				<th>Date</th>
			</tr>
		</table>

     	<input type="submit" value="Export Excel" class="valider"/>
    </form>

	</div>

	<script type="text/javascript">

		let notes= new Array();;

		document.getElementById('test').addEventListener('change', function(){
			let tableau = document.getElementById('tableauNote');
			while(tableau.childElementCount > 1)
				tableau.removeChild(tableau.lastChild);
			notes = new Array();
			recupereResultat(this);
		});

		function recupereResultat(element){
				
	        	//création requête XMLHttpRequest
        	let xhr = new XMLHttpRequest();
			//qui récupèrera les réponses à ./modele/professeur/obtenirReponse.php
			xhr.open('POST', 'index.php?controle=professeur&action=obtenirBilanAJAX', true);
			
			//quand l'état de la requête change
			xhr.onreadystatechange = function() { // On gère ici une requête asynchrone
					//si la requête est fini et que ça c'est bien déroulé
				if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200 ){
					//récupération et traitement des réponses
					let reponses = xhr.responseText.substr(0,xhr.responseText.length-2).split(" ; ");
					console.log (reponses);
					
					if(reponses[0]!==""){
		    			for (reponse of reponses){	
		    				let personne = reponse.split("---");
		    				if(notes.includes(personne[0])){
		    					break;
		    				}
		        			let ligne = document.createElement('tr');
		    				ligne.setAttribute('id', personne[0]);

		    				let nom = document.createElement('td');
		    				let lien = document.createElement('a');
		    				// lien.setAttribute('href','index.php?controle=professeur&action=voirResultat&id_etu='+personne[0]+'&id_test='+element.value);
		    				lien.textContent = personne[1];
		    				//nom.textContent = personne[1];
		    				nom.appendChild(lien);

		    				let prenom = document.createElement('td');
		    				prenom.textContent = personne[2];

		    				let note = document.createElement('td');
		    				note.textContent = personne[3];

		    				let date = document.createElement('td');
		    				date.textContent = personne[4];

		    				ligne.appendChild(nom);
		    				ligne.appendChild(prenom);
		    				ligne.appendChild(note);
		    				ligne.appendChild(date);

		    				document.getElementById('tableauNote').appendChild(ligne);
		    				notes.push(reponse[0]);
		    				//element.setAttribute('disabled','disabled');
		    			}
		    		}
	    		}

			};
    	//spécification de comment son passé les paramètres
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
		//puis la requête reçoit les paramètres puis est envoyée
		xhr.send("test=" + element.value );
	}
	setInterval("recupereResultat(document.getElementById('test'))", 10000);
		
	</script>
</body>
</html>
