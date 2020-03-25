<?php


//recuperer les testes
function ajoutRes(){
	require ("./modele/connexionBD.php") ; 
	try {
		//INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES('2','205','iuu','2010-10-10','0')
		//	$cde_ajt = $pdo->prepare('INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES(:idprof,:grp,:titreTest,:date,:val)');
		$cde_ajt = $pdo->prepare('INSERT INTO resultat VALUES(NULL,:test,:etu,:quest,:date,:rep)');
		//$i=0;
		//var_dump($_SESSION);
		if($_POST != null){
			$rep= htmlspecialchars($_POST['id_rep']);
			$quest = htmlspecialchars($_POST['quest']);   //c'est pas optimal certes mais pour l'instant c'est pour tester
			$test = htmlspecialchars($_POST['test']);
			//$actif = htmlspecialchars($_POST['actif']);
			//var_dump($actif);
			
			VAR_DUMP($rep);
			VAR_DUMP($quest);
			VAR_DUMP($test);
			VAR_DUMP($_SESSION['profil']['id_etu']);
			$date="2019-10-10";
			var_dump($date);
			$cde_ajt->bindParam(':date',$date);
			$cde_ajt->bindParam(':test',$test);
			//var_dump($grp);
			$cde_ajt->bindParam(':etu', $_SESSION['profil']['id_etu']);
            //var_dump($test);
            $cde_ajt->bindParam(':quest', $quest);

			$cde_ajt->bindParam(':rep',$rep);
			//var_dump($i);
			$b_test=$cde_ajt->execute();
			//var_dump($b_test);
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