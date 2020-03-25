<?php
	session_start();

	if (isset($_GET['controle']) & isset($_GET['action'])) {
		$controle = $_GET['controle'];
		$action= $_GET['action'];
	}
	else { //absence de paramètres : prévoir des valeurs par défaut
		$controle = "utilisateur";
		$action= "identification";
	}

	require ('./controle/' . $controle . '.php');   
	$action ();
	
?>