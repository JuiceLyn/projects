<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>accueil </title>
</head>

<body>
	<div id="conteneur">
		<!-- contient toutes les questions -->
	</div>
	<p id="ajout" onclick="ajoutQuestion()">Ajout Question</p>

	<script type="text/javascript">

		function init(element)	{
				// action a chaque fois que la liste déroulante change de texte	
				element.addEventListener('change', function(){
					let parent = element.nextSibling;
					//le nombre de fils de l'élément suivant la liste déroulante (contenant les réponses)
					while(parent.childElementCount > 0)
						//tant qu'il y a des réponses d'une question précédentes, on les supprime
					parent.removeChild(parent.firstElementChild);

		        	//création requête XMLHttpRequest
		        	let xhr = new XMLHttpRequest();
					//qui récupèrera les réponses à ./modele/professeur/obtenirReponse.php
					xhr.open('POST', 'index.php?controle=professeur&action=obtenirReponseAJAX', true);
					
					//quand l'état de la requête change
					xhr.onreadystatechange = function() { // On gère ici une requête asynchrone

						//si la requête est fini et que ça c'est bien déroulé
						if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200 ){
							//récupération et traitement des réponses
							let reponses = xhr.responseText.substr(0,xhr.responseText.length-2).split(" ; ");
		        			//console.log (reponses);

		        			//nombre de réponses afin de les numéroter
		        			let nombre = 1;
		        			for (reponse of reponses){
		        				if(reponse === "")
		        					break;
		        				let resultat = reponse.split(" ! ");
		        				
		        				
		        				//console.log(parent);
		        				//création des éléments contenant le texte des réponses
		        				let p = document.createElement('p');
		        				let checkbox = document.createElement('input');
		        				checkbox.setAttribute('type','checkbox');
		        				//alert(resultat[1]);
		        				//si la réponse est bonne
		        				if(resultat[1]==1){
		        					checkbox.setAttribute('checked','true');
		        				}

		        				checkbox.setAttribute('disabled','disabled');
		        				p.textContent = " "+nombre+ "-"+resultat[0];
		        				p.appendChild(checkbox);
		        				parent.appendChild(p);
		        				//element.setAttribute('disabled','disabled');
		        				nombre++;	
		        			}
		        		}	
		        	};

	        		//spécification de comment son passé les paramètres
	        		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
	        		//puis la requête reçoit les paramètres puis est envoyée
	        		xhr.send("question=" + this.value );
	        	});			
			}

			function ajoutQuestion(){
			//création des conteneurs ainsi que des listes déroulantes affichant les questions
			let contenant = document.createElement('div');
			contenant.appendChild(document.createElement('br'));

			let question = document.createElement('SELECT');
			question.setAttribute('name','theme');
			question.setAttribute('size',1);
			contenant.appendChild(question);
			
			let base = document.createElement('OPTION');
			base.setAttribute('value',0);
			base.textContent = "Choisir une question";
			question.appendChild(base);

			//boucle donnant toutes les questions
			<?php			
			foreach($liste_q as $id) {
				echo "titre= document.createElement('OPTION');";
				echo "question.appendChild(titre);";
				echo "titre.setAttribute('value',".$id["id_quest"].");";
				echo "titre.textContent = \"".$id["texte"]."\";";
			}
		?>
			//chaque liste est initialisé pour pouvoir utiliser AJAX
			init(question);
			//création div contenant les réponses
			contenant.appendChild(document.createElement('div'));
			document.getElementById('conteneur').appendChild(contenant);
		}		
	</script>
</body>
</html>
