<?php


//recuperer les testes
function recupererClasses(){
	require ("./modele/connexionBD.php") ; 
	try {
		$cde_test = $pdo->prepare("SELECT num_grpe FROM `groupe`");
		$b_test = $cde_test->execute();
		
		if($b_test){
			return $cde_test->fetchAll(PDO::FETCH_ASSOC);
		}
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); // On arrète tout.
	}
}
?>
	