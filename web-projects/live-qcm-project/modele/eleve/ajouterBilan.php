<?php

function ajoutBilan($test,$etu, $note){
	require ("./modele/connexionBD.php"); 
	try {
		//INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES('2','205','iuu','2010-10-10','0')
		//	$cde_ajt = $pdo->prepare('INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES(:idprof,:grp,:titreTest,:date,:val)');
		$cde_ajt = $pdo->prepare('INSERT INTO bilan VALUES(NULL,:test,:etu,:note,:date)');
			
			$date="2019-10-10";
			$cde_ajt->bindParam(':test',$test);
			$cde_ajt->bindParam(':etu',$etu);
            $cde_ajt->bindParam(':note', $note);
			$cde_ajt->bindParam(':date',$date);

			$b_test=$cde_ajt->execute();

	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}

function déjàRésultat($test,$etu){
	require ("./modele/connexionBD.php") ; 
	try {
		$cde_ajt = $pdo->prepare('SELECT COUNT(*) as nb FROM `bilan` WHERE bilan.id_test = :test AND bilan.id_etu = :etu');

		if(isset($test) && isset($etu)){
			$cde_ajt->bindParam(':test', $test);
			$cde_ajt->bindParam(':etu', $etu);
			$b_test=$cde_ajt->execute();
		if($b_test){
				$res_ques = $cde_ajt->fetchAll(PDO::FETCH_ASSOC);
				return $res_ques[0]['nb'];	
			}
		}
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}