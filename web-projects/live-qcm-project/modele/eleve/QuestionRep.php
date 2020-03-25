<?php

function getQuestion($id_rep){
	require ("./modele/connexionBD.php") ; 
	try {
		$cde_ques = $pdo->prepare("SELECT r.id_rep , r.id_quest , r.texte_rep , r.bValide , question.texte , question.bmultiple FROM question, reponse r, reponse r2 WHERE r.id_quest=question.id_quest AND r2.id_rep = :reponse AND r.id_quest = r2.id_quest ");
		$cde_ques->bindParam(':reponse', $id_rep);
		$b_ques = $cde_ques->execute();
		if($b_ques){
			$res_ques = $cde_ques->fetchAll(PDO::FETCH_ASSOC);
			//var_dump($res_ques);
			return $res_ques;
		}
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); // On arrte tout.
	}
}

function getReponse($id_rep){
	require ("./modele/connexionBD.php") ; 
	try {
		$cde_ques = $pdo->prepare("SELECT * FROM reponse WHERE reponse.id_rep = :reponse");
		$cde_ques->bindParam(':reponse', $id_rep);
		$b_ques = $cde_ques->execute();
		if($b_ques){
			$res_ques = $cde_ques->fetchAll(PDO::FETCH_ASSOC);
			return $res_ques;
		}
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); // On arrte tout.
	}
}