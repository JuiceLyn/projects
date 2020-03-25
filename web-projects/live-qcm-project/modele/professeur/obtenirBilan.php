<?php


// function ajoutQCM(){
	//
	// echo ($_POST['question']);
	// $_POST['question'] = 1;
	if (isset($_POST['test'])) {
		//
		require ("./modele/connexionBD.php"); 
		try {
			$cde_res = $pdo->prepare("SELECT * FROM `bilan` LEFT JOIN `etudiant` ON bilan.id_etu=etudiant.id_etu WHERE id_test = :test ");
			$cde_res->bindParam(':test', $_POST['test']);
			$b_res = $cde_res->execute();
			if($b_res){
				$res_res = $cde_res->fetchAll(PDO::FETCH_ASSOC);
				foreach($res_res as $res){
					echo $res['id_bilan'].'---';
					echo $res['nom'].'---';
					echo $res['prenom'].'---';
					echo $res['note_test'].'---';
					echo $res['date_bilan'].' ; ';
				}
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrète tout.
		}
	}
// }


