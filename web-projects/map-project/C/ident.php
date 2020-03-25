<?php

	function identification() {
		$msg_ident = '';
		$msg_create = '';
		$profil = array();
		$_SESSION['profil_utilisateur'] = '';
		$login = isset($_POST['login']) ? ($_POST['login']) : '';
		$pass = isset($_POST['password']) ? ($_POST['password']) : '';
		
		if (count($_POST) == 0) {
			require("./V/ident.tpl");
		}
		else {
			require("./M/identBD.php");
			if (!verif_ident($login, $pass, $profil)) {
				$msg_ident = "Nom de login et/ou mot de passe incorrect";
				require("./V/ident.tpl");
			} 
			else {
				$_SESSION['profil_utilisateur'] = $profil;
				header("Location: index.php?controle=map&action=afficher");
			}
		}
	}

	function creation(){
		$msg_ident = '';
		$msg_create = '';
		$profil = array();
		$_SESSION['profil_utilisateur'] = '';
		$nom = isset($_POST['nom']) ? ($_POST['nom']) : '';
		$prenom = isset($_POST['prenom']) ? ($_POST['prenom']) : '';
		$login = isset($_POST['login']) ? ($_POST['login']) : '';
		$pass = isset($_POST['password']) ? ($_POST['password']) : '';
		
		if (count($_POST) == 0) {
			require("./V/ident.tpl");
		}
		else {
			require("./M/identBD.php");
			if (!create_ident($nom, $prenom, $login, $pass, $profil)) {
				$msg_create = "Ce nom de login est déjà existant";
				require("./V/ident.tpl");
			} else {
				$_SESSION['profil_utilisateur'] = $profil;
				header("Location: index.php?controle=map&action=afficher");
			}
		}
	}

	function deconnecter() {
		SESSION_DESTROY();
		echo '<center style="font-family: Calibri, sans-serif; margin-top: 25px">
				<h2>Vous allez être redirigé vers la page de connexion.</h2>
				<h3>Merci pour votre visite, à bientôt !</h3>
			  </center>';
		header("refresh: 3; url = index.php");
	}

?>
