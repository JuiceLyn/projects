<?php

	function liste_rep() {
		
		require ("./modele/connexionBD.php");
		
		try {
				
			//var_dump($_SESSION);
			
			$cde_test = $pdo->prepare("SELECT * from reponse INNER JOIN qcm ON qcm.id_quest=reponse.id_quest");
			$b_test = $cde_test->execute();

			//var_dump($_SESSION['profil']['num_grpe']);
			
			if ($b_test) {
				$req_rep = $cde_test->fetchAll(PDO::FETCH_ASSOC);
				var_dump($req_rep);
				// die();
				return $req_rep;
			}
			
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // on arrête tout
		}

}
?>