<?php

function FaireQcm(){
	require ("./modele/connexionBD.php") ; 
	if(isset($_POST['idtest'])){
		// var_dump($_POST['idtest']);
		$idtest = $_POST['idtest'];

		foreach ($_POST as $key => $value) {
			$autorise=0;
			$bloque=0;

			if(strcmp(substr($key,0,7),'idquest') == 0){

				$idquest = $value;
				if(isset($_POST['autorise'.$idquest]))
					$autorise = 1;
				if(isset($_POST['bloque'.$idquest]))
					$bloque = 1;
				try {

					$cde_ajt = $pdo->prepare('INSERT INTO qcm VALUES(NULL,:idtest,:idquest,:autorise,:bloque,0)');			
						$cde_ajt->bindParam(':idtest', $idtest);
						//var_dump($test);
						$cde_ajt->bindParam(':idquest', $idquest);
						//var_dump($quest);
						$cde_ajt->bindParam(':autorise', $autorise);
						//var_dump($i);
						$cde_ajt->bindParam(':bloque', $bloque);
						//var_dump($j);
						$b_test=$cde_ajt->execute();
				}
				catch (PDOException $e) {
					echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
				die(); // On arrète tout.
				}
			}
		}
	}
}