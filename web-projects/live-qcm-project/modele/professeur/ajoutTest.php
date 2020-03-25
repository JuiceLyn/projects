<?php


//recuperer les testes
function ajoutTest(){
	require ("./modele/connexionBD.php") ;
	if(isset($_POST['grp']) && isset($_POST['test']) && isset($_POST['date'])){ 
		try {
			//INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES('2','205','iuu','2010-10-10','0')
			//	$cde_ajt = $pdo->prepare('INSERT INTO test(id_prof,num_grpe,titre_test,date_test,bActif) VALUES(:idprof,:grp,:titreTest,:date,:val)');
			$cde_ajt = $pdo->prepare('INSERT INTO test VALUES(NULL,:idprof,:grp,:titreTest,:date,:val)');
			//$i=0;
			//var_dump($_SESSION);
			if($_POST != null){
				$grp= htmlspecialchars($_POST['grp']);
				$test = htmlspecialchars($_POST['test']);
				$date = htmlspecialchars($_POST['date']);
				//$actif = htmlspecialchars($_POST['actif']);
				//var_dump($actif);
				if(isset($_POST['actif'])){
					$i=1;
				}
				else{
					$i=0;
				}
				$cde_ajt->bindParam(':idprof', $_SESSION['profil']['id_prof']);
				///var_dump($_SESSION['profil']['id_prof']);
				$cde_ajt->bindParam(':grp', $grp);
				//var_dump($grp);
				$cde_ajt->bindParam(':titreTest', $test);
				//var_dump($test);
				$cde_ajt->bindParam(':date', $date);
				//var_dump($date);
				$cde_ajt->bindParam(':val',$i);
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
}
?>