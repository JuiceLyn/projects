<?php
function getNombreQuestion($test){
	require ("./modele/connexionBD.php") ; 
	try {
		$cde_ajt = $pdo->prepare('SELECT COUNT(*) as nb FROM `qcm` WHERE qcm.id_test = :test AND qcm.bAutorise = 1 AND qcm.bBloque = 0 ');

		if(isset($test)){
			$cde_ajt->bindParam(':test', $test);
			$b_test=$cde_ajt->execute();
		if($b_test){
				$res_ques = $cde_ajt->fetchAll(PDO::FETCH_ASSOC);
				return $res_ques[0]['nb'];
				
			}
		}
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}
