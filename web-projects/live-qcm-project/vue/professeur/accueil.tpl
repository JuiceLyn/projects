<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>accueil </title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="vue/professeur/styleCSS/Question.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<header class="head">
	<?php include('./vue/professeur/header.tpl'); ?>
</header>

<body>
	
	<div class="msg">
		<h3>Bienvenue professeur <?php echo $nom ?> </h3>
	</div>
			<div id="contient">
			
					<div id="tableau">
						<div class="inclus">
							<button type="button" class="btn btn-primary boutonAjout" data-toggle="modal" data-target=".bd-example-modal-lg">Ajouter Test</button>

							<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">

										<h3>Ajout Test</h3>
										<?php require ("./vue/professeur/addTest.tpl"); ?>
									</div>
								</div>
							</div>
						</div>
						
						<div class="inclus">
							<button type="button" class="btn btn-primary boutonSuppr" data-toggle="modal" data-target=".bd-example-modal-sm">Retirer Test</button>

							<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<h3>Retirer Test</h3>
										<?php require ("./vue/professeur/rmTest.tpl"); ?>
									</div>
								</div>
							</div>
						</div>

						<div class="inclus">
							<h3>Voir tests</h3>
							<?php require ("./vue/professeur/changerEtatTest.tpl"); ?>
						</div>

						<div class="inclus">
							<h3>Voir Bilan</h3>
							<?php require("./vue/professeur/voirBilan.tpl"); ?>
						</div>
						
						<div class="inclus"> 
							<h3>Créer question</h3>
							<?php require("./vue/professeur/ajoutQuestion.tpl"); ?>
						</div>
						<div class="inclus">
							<h3>Questions/Réponses</h3>
							<?php require("./vue/professeur/QuestionRep.tpl"); ?>
						</div>
						<div class="inclus">
							<h3>Ajout Questions QCM</h3>
							<?php require("./vue/professeur/FaireQCM.tpl"); ?>
						</div>
					</div>
					<div id="Connexions" class="inclus">
						<h3>Elèves connectés</h3>
						<?php require("./vue/professeur/voirEleveConnecte.tpl"); ?>
					</div>
				
			</div>
		<script>
			$('#myModal').on('shown.bs.modal', function () {
				$('#myInput').trigger('focus')
			})
		</script>

		<footer class="pied"></footer>
	</body>

	</html>
