<?php


//recuperer les testes
function ajoutRes($quest,$rep, $test){
	require ("./modele/connexionBD.php") ; 
	try {
		//INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES('2','205','iuu','2010-10-10','0')
		//	$cde_ajt = $pdo->prepare('INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES(:idprof,:grp,:titreTest,:date,:val)');
		$cde_ajt = $pdo->prepare('INSERT INTO resultat VALUES(NULL,:test,:etu,:quest,:date,:rep)');
			
			$date="2019-10-10";
			$cde_ajt->bindParam(':date',$date);
			$cde_ajt->bindParam(':test',$test);
			//var_dump($grp);
			$cde_ajt->bindParam(':etu', $_SESSION['profil']['id_etu']);

            $cde_ajt->bindParam(':quest', $quest);

			$cde_ajt->bindParam(':rep',$rep);

			$b_test=$cde_ajt->execute();

	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}
?>