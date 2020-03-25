<?php

require ("./modele/connexionBD.php") ; 
try {
	$cde_ajt = $pdo->prepare('INSERT INTO `reponse` VALUES(NULL,:idquest,:rep,:bonneRep)');

	if($_POST != null){
		$idq= htmlspecialchars($_POST['idq']);
		$rep= htmlspecialchars($_POST['reponse']);
		$i = $_POST['valide'];
		$cde_ajt->bindParam(':idquest', $idq);
		$cde_ajt->bindParam(':rep', $rep);
		$cde_ajt->bindParam(':bonneRep', $i);
		$b_test=$cde_ajt->execute();
	}
}
catch (PDOException $e) {
	echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
	die();
}
