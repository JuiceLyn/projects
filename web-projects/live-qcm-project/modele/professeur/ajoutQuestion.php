<?php


//recuperer les testes
require ("./modele/connexionBD.php");  
try {
	$cde_qtn = $pdo->prepare('INSERT INTO `question` VALUES(NULL,:idthe,:titreQ,:texteQ,:bMultiple)');
	//$cde_rps = $pdo->prepare('INSERT INTO `reponse` VALUES(NULL,:idQ,:texteR,:bValide)');
	
	if($_POST!= null){
		$idtheme = $_POST['theme'];
		$titreQ = htmlspecialchars($_POST['titreQ']);
		$texteQ = htmlspecialchars($_POST['texteQ']);
		$cde_qtn->bindParam(':idthe', $idtheme);
		$cde_qtn->bindParam(':titreQ', $titreQ);
		$cde_qtn->bindParam(':texteQ', $texteQ );
		$i=$_POST['bMultiple'];
		$cde_qtn->bindParam(':bMultiple', $i);
		$b_qtn=$cde_qtn->execute();

		if($b_qtn){
			echo $pdo->lastInsertId();
		}
	}
}
catch (PDOException $e) {
	echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
	die(); // On arrĂªte tout.
}
?>