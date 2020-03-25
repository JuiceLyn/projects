<?php


//recuperer les testes
	require ("./modele/connexionBD.php");

	try {
		$cde_ajt = $pdo->prepare('UPDATE `test` SET bActif=:actif WHERE id_test=:test');
		$actif = 1;
		$cde_ajt->bindParam(':actif',$_POST['actif']);
		$test = 2;
		$cde_ajt->bindParam(':test', $_POST['num']);
		$b_test=$cde_ajt->execute();


		}
	
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); // On arrĂªte tout.
	}
?>