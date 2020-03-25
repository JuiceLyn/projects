<?php 

	function verif_ident($login,$pass,&$profil) {
		require('./M/connectBD.php'); 
		$sql = "SELECT * FROM utilisateur WHERE login = :login and password = :pass";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login', $login);
			$commande->bindParam(':pass', $pass);
			$bool = $commande->execute();
			if ($bool) {
				$res = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); 
		}
		if (count($res)== 0) return false; 
		else{ 
			$profil= $res[0];
			return true;
		}
	}

	function create_ident($nom,$prenom,$login,$pass,&$profil) {
		require('./M/connectBD.php'); 
		$sql = "SELECT * FROM utilisateur WHERE login = :login";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login', $login);
			$bool = $commande->execute();
			if ($bool) {
				$res = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); 
		}
		if (count($res)!= 0) return false; 
		else{ 
			$sql = "INSERT INTO utilisateur(nom,prenom,login,password) VALUES(:nom,:prenom,:login,:pass) ";
			try {
				$commande = $pdo->prepare($sql);
				$commande->bindParam(':nom', $nom);
				$commande->bindParam(':prenom', $prenom);
				$commande->bindParam(':login', $login);
				$commande->bindParam(':pass', $pass);
				$bool = $commande->execute();
			}
			catch (PDOException $e) {
				echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
				die(); 
			}
			return $bool;
		}
	}
	
?>