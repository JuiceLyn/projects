<?php


//recuperer les testes
function ajoutTest(){
	require ("./modele/connexionBD.php") ; 
	try {
		//INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES('2','205','iuu','2010-10-10','0')
		//	$cde_ajt = $pdo->prepare('INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES(:idprof,:grp,:titreTest,:date,:val)');
		$cde_ajt = $pdo->prepare('UPDATE test SET bActif=:actif  where  id_test=:idtest');
		//var_dump($_POST);
		
		//var_dump($_SESSION);
		if($_POST != null){
			$test = htmlspecialchars($_POST['test']);
			if(isset($_POST['actif'])){
				$i=1;
			}
			else{
				$i=0;
			}
			$cde_ajt->bindParam(':actif',$i);
			$cde_ajt->bindParam(':idtest', $test);
			
			$b_test=$cde_ajt->execute();
			var_dump($b_test);
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
?>