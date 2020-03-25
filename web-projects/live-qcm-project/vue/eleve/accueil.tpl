<!doctype html>
<html lang="fr">

	<head>
		<meta charset="utf-8">
		<title>Accueil</title>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>  
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
		
		<link rel="stylesheet" href="./vue/eleve/styleCSS/accueil.css" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	</head>


	<body>	

		<header class="head">
		
			<?php include('./vue/eleve/header.tpl'); ?>
			
		</header>
		
		<div class="msg">
		
			<form action='index.php?controle=eleve&action=accueil' method="post">
				
				<?php if(isset($prof)){
				
					echo '<p>Choix classe : '.$grp.'</p>';
					echo '<select name=\'classe\'>';
					
					if(isset($classes)) {
						$premier = true;
						// var_dump($classes);
						foreach($classes as $classe){
							echo'<option>'.$classe["num_grpe"].'</option>';
						}
						echo '</select>';
					}
					
					echo '<input type="submit">';
					
				} ?>
				
				<h1 class="ml9">
					<span class="texte">
						<span class="letters">Bienvenue eleve <?php echo $nom ?></span>
					</span>
				</h1>
				
			</form>
			
			<script src="./vue/eleve/js/animation.js"></script>
			
		</div>
		
	</body>
	
</html>
