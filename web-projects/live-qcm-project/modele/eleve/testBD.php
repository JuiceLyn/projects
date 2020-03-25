<?php

	function liste_tests() {
		
		require ("./modele/connexionBD.php");
		
		try {
			
			//var_dump($_GET);
			
			$cde_test = $pdo->prepare("SELECT * FROM `test` WHERE num_grpe=:etudiant AND bActif = 1");
			$cde_test->bindParam(':etudiant', $_SESSION['profil']['num_grpe']);
			$b_test = $cde_test->execute();

			
			if ($b_test) {
				$req_tests = $cde_test->fetchAll(PDO::FETCH_ASSOC);
				//var_dump($req_tests);
				// die();
				return $req_tests;
			}
			
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // on arrête tout
		}

	}
?>