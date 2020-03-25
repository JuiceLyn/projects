<?php


//recuperer les testes
function recupererTest(){
	require ("./modele/connexionBD.php") ; 
	try {
		$cde_test = $pdo->prepare("SELECT * FROM `test`	where  id_prof=:professeur");
		$cde_test->bindParam(':professeur', $_SESSION['profil']['id_prof']);
		$b_test = $cde_test->execute();
		if($b_test){
			$res_test = $cde_test->fetchAll(PDO::FETCH_ASSOC);
			return $res_test;
		}
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); // On arrète tout.
	}
}
?>
	