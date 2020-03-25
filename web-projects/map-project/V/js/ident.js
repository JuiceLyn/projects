$(document).ready(function() {
	// Variables constantes contenant un id ou une classe
	const blocklocker = $("#block-lock");
	const circleloader = $(".loader");
	const form = $("#form-log");
	const cursor = document.querySelector('.cursor');

	// Lors de la soumission du formulaire
	form.on('submit', function(e) {
		e.preventDefault(); // bloque tous les événements exécutés par l'utilisateur en cas de non traitement de ces événements
		var time = 1250;
		var self = this;
		
		const login = $("input[name=login]").val();
		const pwd = $("input[name=password]").val();

		blocklocker.css("display", "block"); // affichage d'un bloc
		circleloader.css("display", "inline-block"); // affichage d'une animation de type chargement

		form.children("input").each(function() {
			$(this).attr("readonly", true);
		});

		window.setTimeout(function() {
			self.submit(); // Le formulaire est soumis 1.25 secondes après
		}, time);
	});

	// Curseur personnalisé avec événement au clic
	document.addEventListener('mousemove', e => {
		// On ajuste la position du curseur créé de façon à ce qu'il soit correctement placé pour déclencher l'événement du clic
		cursor.setAttribute("style", "top: " + (e.pageY - 9.5) + "px; left: " + (e.pageX - 9.5) + "px;")
	})
	document.addEventListener('click', () => {
		var timer = 500;
		cursor.classList.add("cursor-clicked"); // Ajout d'une classe au clic
		setTimeout(() => {
			cursor.classList.remove("cursor-clicked");
		}, timer) // Suppression de la classe créée au bout de 500 millisecondes
	})
});