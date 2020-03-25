<?php


//recuperer les testes
function recupererTheme(){
	require ("./modele/connexionBD.php") ; 
	try {
		$cde_theme = $pdo->prepare("SELECT * FROM `theme`");
		$b_theme = $cde_theme->execute();
		if($b_theme){
			$res_theme = $cde_theme->fetchAll(PDO::FETCH_ASSOC);
			return $res_theme;
		}
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); // On arrète tout.
	}
}

	