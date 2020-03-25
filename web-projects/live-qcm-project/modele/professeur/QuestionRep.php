<?php


//recuperer les testes
function QuestionsReponses(){
	require ("./modele/connexionBD.php") ; 
	try {
		$cde_ques = $pdo->prepare("SELECT * FROM question, reponse WHERE reponse.id_quest=question.id_quest");
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
?>