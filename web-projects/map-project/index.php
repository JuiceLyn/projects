<?php  
    session_start();
	if (isset($_GET['controle']) && isset($_GET['action'])) {
            $controle = $_GET['controle'];
            $action = $_GET['action'];
	}
	else {
		$controle = "ident";
        $action = "identification";
	}
    require ("./C/" . $controle . ".php"); 
    $action();
?>