<?php


//recuperer les testes
function removeTest(){
	require ("./modele/connexionBD.php");
	if(isset($_POST['idtest'])){ 
		try {
			//INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES('2','205','iuu','2010-10-10','0')
			//	$cde_ajt = $pdo->prepare('INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES(:idprof,:grp,:titreTest,:date,:val)');
			$cde_ajt = $pdo->prepare('Delete From test Where(id_test = :idtest)');
			// var_dump($_POST);
			// var_dump($_SESSION);
			if($_POST != null){
				$idtest= htmlspecialchars($_POST['idtest']);
				$cde_ajt->bindParam(':idtest', $idtest);
				$b_test=$cde_ajt->execute();
				/*if($b_test){
					$ajt_test = $cde_ajt->fetchAll(PDO::FETCH_ASSOC);
					return $ajt_test;
				}*/
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrĂªte tout.
		}
	}
}
?>