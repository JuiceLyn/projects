<?php

require ("./modele/connexionBD.php") ; 
try {
	$cde_ques = $pdo->prepare("SELECT * FROM question, reponse, qcm , theme WHERE reponse.id_quest=question.id_quest AND question.id_quest = qcm.id_quest AND qcm.id_test = :test AND question.id_theme=theme.id_theme ");
	$cde_ques->bindParam(':test', $_GET['test']);
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
	?>