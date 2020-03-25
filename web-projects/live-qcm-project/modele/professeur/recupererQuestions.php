<?php


//recuperer les testes
function recupererQuestions(){
	require ("./modele/connexionBD.php") ; 
	try {
		$cde_ques = $pdo->prepare("SELECT * FROM question INNER JOIN theme WHERE theme.id_theme = question.id_theme");
		$b_ques = $cde_ques->execute();
		if($b_ques){
			$res_ques = $cde_ques->fetchAll(PDO::FETCH_ASSOC);
			return $res_ques;
		}
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); // On arrète tout.
	}
}
?>
	