var texte = document.querySelector('.ml9 .letters');
texte.innerHTML = texte.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

// Ajoute une animation sur le contenu de la classe .ml9
// L'animation augmente et rétrécit la taille de chaque lettre au fil du temps
anime.timeline().add({
    targets: '.ml9 .letter',
    scale: [0, 1],
    duration: 1500,
    elasticity: 600,
    delay: (el, i) => 45 * (i+1),
});