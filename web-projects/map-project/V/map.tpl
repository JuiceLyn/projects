<!DOCTYPE HTML>
<html lang="fr">

	<head>

		<title>Crous'Finder</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="author" content="Julien ZHANG, Dylan RAKOTOARIVELO - Groupe 201"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<link rel="icon" type="image/png" href="./V/img/crous-finder-icon.png"/>
		<link rel="stylesheet" type="text/css" href="./V/style/map-light.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
		<link rel="stylesheet" href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css"/>
		<link rel="stylesheet" href="./V/style/leaflet-routing-machine-css/leaflet-routing-machine.css"/>

		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		<script src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://ignf.github.io/geoportal-access-lib/latest/dist/GpServices.js"></script>
		<script src="https://ignf.github.io/geoportal-access-lib/latest/dist/GpServices-src.js"></script>
		<script defer src="./V/js/overlay-menu.js"></script>
		
	</head>

	<body>

		<div id="left-side-menu" class="left-menu">
		
			<div class="pt-5 pr-3 pb-3 pl-5 align-middle">
			
				<button id="afficher" type="button" class="btn btn-danger col-10">Afficher les lieux de restauration</button>
				
			</div>
			
			<div class="pt-1 pr-3 pb-4 pl-5 align-middle">
			
				<a href="index.php?controle=ident&action=deconnecter"><button type="button" class="btn btn-secondary col-10">Se déconnecter</button></a>
				
			</div>
			
			<div class="pl-3 pr-3 text-center">
			
				<p id="desc" class="col-12">Cliquez sur une icône pour créer un itinéraire</p>
				
				<div class="pt-1 pb-4">
				
					<p>Comment vous déplacez vous ?</p>
					
					<select id="graph">
					
						<option value="voiture">voiture</option>
						<option value="pieton">à pied</option>
						
					</select>
					
				</div>
				
				<div id="info" class="pb-5">
				
					Temps estimé : 
					
					</br>
					
					Distance :
					
				</div>
				
			</div>
			
			<div class="box">
			
				<h3 class="card-header">Modes</h3>
				
				<div class="card-body">

					<a href="javascript:void(0)" id="dark" onclick="darkStyle()">
					
						<img src="./V/img/dark.png" alt="nuit">
						
						<p>Mode nuit</p>
						
					</a>

					<a href="javascript:void(0)" id="light" onclick="lightStyle()">
					
						<img src="./V/img/light.png" alt="jour">
						
						<p>Mode jour</p>
						
					</a>

				</div>

			</div>
			
		</div>

		<img src="./V/img/arrow.svg" alt="chevron" class="arrow" id="animated-arrow" onclick="menu()"/>

		<div id="main" class="main">
		
			<div class="col-12 pl-0">
			
				<div id="mapid"></div>
				
			</div>
			
		</div>
		
		<script src="./V/js/leaflet.ajax.min.js"></script>
		
		<script src="./V/js/mapJS.js"></script>

	</body>

</html>