<?php

	function liste_qcm() {
		
		require ("./modele/connexionBD.php");
		
		try {
				
			//var_dump($_SESSION);
			
			$cde_test = $pdo->prepare("SELECT test.num_grpe, test.id_test, qcm.id_quest, qcm.id_qcm, question.texte FROM `qcm` INNER JOIN test ON qcm.id_test = test.id_test INNER JOIN question ON qcm.id_quest = question.id_quest WHERE test.num_grpe = :groupe");
			$cde_test->bindParam(':groupe', $_SESSION['profil']['num_grpe']);
			$b_test = $cde_test->execute();

			//var_dump($_SESSION['profil']['num_grpe']);
			
			if ($b_test) {
				$req_qcm = $cde_test->fetchAll(PDO::FETCH_ASSOC);
				//var_dump($req_qcm);
				// die();
				return $req_qcm;
			}
			
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // on arrête tout
		}

}
?>