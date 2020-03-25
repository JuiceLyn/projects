var open = false;

// Fonction permettant d'appliquer les propriétés CSS sur les id renseignés selon l'état de open
function menu() {
	if (open) {
		document.getElementById('left-side-menu').style.marginLeft = '-17rem';
		document.getElementById('main').style.marginLeft = '0';
		document.getElementById('animated-arrow').style.cssText = "margin-left: 0; transform: rotate(0)";
		open = false;
	}
	else {
		document.getElementById('left-side-menu').style.marginLeft = '0';
		document.getElementById('main').style.marginLeft = '17rem';
		document.getElementById('animated-arrow').style.cssText = "margin-left: 17rem; transform: rotate(-180deg); animation: loading2 2.25s ease-in-out infinite";
		open = true;
	}
}

// Mode jour faisant appel à un autre fichier CSS
function lightStyle() {
	let dark = document.getElementById('darkClass');
	
	if (document.getElementById('darkClass')){
		dark.remove();
	}
	
	if (!document.getElementById('undefined')) {
		var properties = document.createElement('link');
		properties.href = "./V/style/map-light.css";
		properties.rel = "stylesheet";
		properties.type = "text/css";
		properties.id = "undefined"
		document.getElementsByTagName("head")[0].appendChild(properties);
	}
}

// Mode nuit faisant appel à un autre fichier CSS
function darkStyle() {
	let light = document.getElementById('undefined');
	
	if (document.getElementById('undefined')) {
		light.remove();
	}
	
	if (!document.getElementById('darkClass')) {
		var properties = document.createElement('link');
		properties.href = "./V/style/map-dark.css";
		properties.rel = "stylesheet";
		properties.type = "text/css";
		properties.id = "darkClass"
		document.getElementsByTagName("head")[0].appendChild(properties);
	}
}