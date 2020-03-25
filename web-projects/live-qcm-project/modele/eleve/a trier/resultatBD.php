<?php

	function liste_res() {
		
		require ("./modele/connexionBD.php");
		
		try {
			
			//var_dump($_SESSION);
			
			$cde_test = $pdo->prepare("SELECT * FROM `resultat` INNER JOIN reponse ON resultat.id_rep=reponse.id_rep WHERE id_etu=:etudiant");
			$cde_test->bindParam(':etudiant', $_SESSION['profil']['id_etu']);
			$b_test = $cde_test->execute();
			
			if ($b_test) {
				$res_tests = $cde_test->fetchAll(PDO::FETCH_ASSOC);
				//var_dump($req_tests);
				// die();
				return $res_tests;
			}
			
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // on arrête tout
		}

	}
?>