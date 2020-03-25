<?php 
function identification() {
	$nom = isset($_POST['nom'])?($_POST['nom']):'';
	$mdp = isset($_POST['mdp'])?($_POST['mdp']):'';
	$mode = isset($_POST['mode'])?($_POST['mode']):'';
	$msg = '';

	if (count($_POST)==0)
        require ("./vue/utilisateur/identification.tpl") ;
    else {
	    if (!verif_ident($nom,$mdp,$mode,$profil)) {
			$_SESSION['profil']="";
	        $msg ="erreur d'identification";
	        require ("./vue/utilisateur/identification.tpl") ;
		}
	    else { 
			$_SESSION['profil'] = $profil;
			changerEtatConnexion();
			$url = "index.php?controle=" . $_SESSION['profil']['mode'] . "&action=accueil";
			header ("Location:" .$url) ;
		}
    }	
}

function verif_ident($nom,$mdp,$mode,&$profil) {
	require("./modele/utilisateurBD.php");
	return verif_ident_BD($nom,$mdp,$mode,$profil);
}

function accueil() {
	$nom = $_SESSION['profil']['nom'];
	require ("./vue/utilisateur/accueil.tpl");
}