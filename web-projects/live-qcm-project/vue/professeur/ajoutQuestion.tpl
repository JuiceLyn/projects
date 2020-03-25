<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" href="vue/professeur/styleCSS/accueil.css">
</head>
<body>
	<form class="container" action ="" method="post">
		<div id="questions"></div>
		<p id="ajout" onclick="ajoutQuestion()">Ajout Question</p>
		<p id="suppression" onclick="supprimerQuestion()">Supprimer Question</p>
		<input type="submit" value="Valider" class="valider" id="validerAjoutQ/R">
	</form>
	
	<script type="text/javascript">

		let validerbtn = document.getElementById('validerAjoutQ/R');
		validerbtn.addEventListener('click',function(e){
			e.preventDefault();
			if(confirm("Enregistrer les questions et réponses ?")){
				
				let contenant = document.getElementById('questions');
				let nombre = 0;
				for(question of contenant.children){
					nombre++;
					let titre = question.children[1].value;
					let texte = question.children[2].value;
					let multi = 0;
					if(question.children[4].checked)
						multi = 1;
					let theme = question.children[7].value;


					let xhr = new XMLHttpRequest();
					xhr.open('POST', 'index.php?controle=professeur&action=ajoutQuestionAJAX', false);
					xhr.onreadystatechange = function() {
						if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200 ){
							let idq = xhr.responseText;
							for(reponse of question.children[8].children){
								let xhrrep = new XMLHttpRequest();
								xhrrep.open('POST', 'index.php?controle=professeur&action=ajoutReponseAJAX', false);
								let valide = 0;
								if(reponse.children[1].checked){
									valide = 1;
								}
								console.log(valide);
								xhrrep.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
								xhrrep.send("idq=" + idq  +"&reponse=" + reponse.children[0].value +"&valide=" + valide);
							}
						}
					}
					xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
					xhr.send("theme=" + theme  +"&titreQ=" + titre +"&texteQ=" + texte + "&bMultiple=" + multi);					
				}

			}
		});

		let nb = 1;

		function ajoutQuestion() {
			let contenant = document.getElementById('questions');
			let contenantbis = document.createElement('div');


			let numQ = document.createElement('p');
			numQ.textContent = 'Question : '+nb;
			contenantbis.appendChild(numQ);

			let titreQ = document.createElement('input');
			titreQ.setAttribute('type','texte');
			titreQ.setAttribute('placeholder','Titre de la question');
			titreQ.setAttribute('name','titreQ'+nb);
			titreQ.setAttribute('required','true');
			contenantbis.appendChild(titreQ);

			let texteQ = document.createElement('input');
			texteQ.setAttribute('type','texte');
			texteQ.setAttribute('placeholder','Texte de la question');
			texteQ.setAttribute('name','texteQ' + nb);
			texteQ.setAttribute('required','true');
			contenantbis.appendChild(texteQ);

			let choix = document.createElement('p');
			choix.textContent = 'Question  à choix multiple :';
			contenantbis.appendChild(choix);


			let multiple = document.createElement('input');
			multiple.setAttribute('type','checkbox');
			multiple.setAttribute('id','multi'+nb);
			multiple.setAttribute('name','multiple' + nb);
			multiple.addEventListener('change', function(){
				checkboxChange(this);
			})
			multiple.setAttribute('value','true');
			contenantbis.appendChild(multiple);
			contenantbis.appendChild(document.createElement('br'));

			choix = document.createElement('p');
			choix.textContent = 'Theme : ';
			contenantbis.appendChild(choix);

			let theme = document.createElement('SELECT');
			theme.setAttribute('name','theme' + nb);
			theme.setAttribute('size',1);
			contenantbis.appendChild(theme);
			
			<?php			
			foreach($liste_themes as $id){
				echo "resultat= document.createElement('OPTION');";
				echo " theme.appendChild(resultat);";
				echo " resultat.setAttribute('value',".$id["id_theme"].");";
				echo "resultat.textContent = \"".$id["titre_theme"]."\";";
			}
			?>


			let reponses = document.createElement('div');
			reponses.setAttribute('id',nb);
			contenantbis.appendChild(reponses);
			
			
			ajoutReponse = document.createElement('p');
			ajoutReponse.textContent="Ajouter une réponse";
			ajoutReponse.setAttribute('onclick','ajouterReponse(previousSibling)');
			contenantbis.appendChild(ajoutReponse);

			suppressionReponse = document.createElement('p');
			suppressionReponse.textContent="Supprimer une réponse";
			contenantbis.appendChild(suppressionReponse);
			suppressionReponse.addEventListener('click', function(){
				let parent = this.previousSibling.previousSibling;
				if(parent.children.length > 0)
					parent.removeChild(parent.lastChild);
			});


			
			contenantbis.appendChild(document.createElement('br'));
			contenantbis.appendChild(document.createElement('br'));
			contenant.appendChild(contenantbis);

			nb++;
		}

		function supprimerQuestion(){
			let contenant = document.getElementById('questions');
			if(contenant.childElementCount<= 0){
				alert("il n'y a pas de question");
				return;
			}
			nb--;
			contenant.removeChild(contenant.lastChild);
		}

		function ajouterReponse(element){
			let reponse =  document.createElement('div');
			let texte = document.createElement('input');
			texte.setAttribute('type','text');
			texte.setAttribute('placeholder','Texte de la réponse');
			texte.setAttribute('required','true');
			let valide = document.createElement('input');
			let nombre = element.id;
			if(document.getElementById('multi'+nombre).checked){
				valide.setAttribute('type','checkbox');
				valide.setAttribute('name','checkbox'+nombre);
			}
			else{
				valide.setAttribute('type','radio');
				valide.setAttribute('name','radio'+nombre);
			}

			valide.setAttribute('class','radio'+nombre);			
			
			reponse.appendChild(texte);
			reponse.appendChild(valide);
			element.appendChild(reponse);
		}

		function checkboxChange(element){
			let nombre = element.name.substring(8, element.name.length);
			let radios = document.getElementsByClassName('radio' + nombre);
			if(element.checked){
				for(radio of radios){
					radio.setAttribute('type','checkbox');		
				}
			} else {
				for(radio of radios){
					radio.setAttribute('type','radio');		
				}
			}
		}
	</script>

</body>
</html>
