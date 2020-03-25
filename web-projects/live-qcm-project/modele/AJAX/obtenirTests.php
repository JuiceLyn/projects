<?php


// function ajoutQCM(){
	//
	// echo ($_POST['question']);
	// $_POST['question'] = 1;
	if (isset($_POST['professeur'])) {
		//
		require ("../connexionBD.php"); 
		try {
			$cde_res = $pdo->prepare("SELECT * FROM `test` WHERE id_prof = :professeur");
			$cde_res->bindParam(':professeur', $_POST['professeur']);
			$b_res = $cde_res->execute();
			if($b_res){
				$res_res = $cde_res->fetchAll(PDO::FETCH_ASSOC);
				foreach($res_res as $res){
					echo $res['id_test'].'---';
					echo $res['num_grpe'].'---';
					echo $res['titre_test'].'---';
					echo $res['date_test'].'---';
					echo $res['bActif'].' ; ';
				}
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrète tout.
		}
	}
// }


