<?php


	if (isset($_POST['question'])) {
		//
		require ("./modele/connexionBD.php"); 
		try {
			$cde_res = $pdo->prepare("SELECT * FROM `reponse` WHERE id_quest = :idq ");
			$cde_res->bindParam(':idq', $_POST['question']);
			$b_res = $cde_res->execute();
			if($b_res){
				$res_res = $cde_res->fetchAll(PDO::FETCH_ASSOC);
				foreach($res_res as $res){
					echo $res['texte_rep'].' ! ';
					echo $res['bvalide'].' ; ';
				}
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrète tout.
		}
	}
// }


