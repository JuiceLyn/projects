<?php

function verif_ident_BD($nom,$mdp,$mode,&$profil){
	require ("./modele/connexionBD.php") ; 
	$sql_etu="SELECT * FROM `etudiant`      where  login_etu=:nom and pass_etu=:mdp";
	$sql_prof="SELECT * FROM `professeur` 	where login_prof=:nom and pass_prof=:mdp";
	$res_etu= array();
	$res_prof= array();
	
	try {
		$cde_etu = $pdo->prepare($sql_etu);
		$cde_etu->bindParam(':nom', $nom);
		$cde_etu->bindParam(':mdp', $mdp);
		$b_etu = $cde_etu->execute();
		
		$cde_prof = $pdo->prepare($sql_prof);
		$cde_prof->bindParam(':nom', $nom);
		$cde_prof->bindParam(':mdp', $mdp);
		$b_prof = $cde_prof->execute();
		
		if (($b_etu)&&($b_prof)) {
			$res_etu = $cde_etu->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
			$res_prof= $cde_prof->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
		}
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); // On arrête tout.
	}
	
	if ((count($res_etu)> 0) && (count($res_prof)== 0)) {
		$profil = $res_etu[0];
		$profil['mode']="eleve";
		return true;
	}
	if ((count($res_prof)> 0) && (count($res_etu)== 0)){
		$profil = $res_prof[0];
		$profil['mode']=$mode;
		return true;
	}
	
	$profil = array();
	return false;
}


function changerEtatConnexion(){
	require ("./modele/connexionBD.php");
	if(isset($_SESSION['profil']['id_prof'])) 
		$sql_co="UPDATE `professeur` SET bConnect = :etat Where id_prof = :id";
	else
		$sql_co="UPDATE `etudiant` SET bConnect = :etat Where id_etu = :id";

	$cde_co = $pdo->prepare($sql_co);
	
	if(isset($_SESSION['profil']['id_prof']))
		$int = (int)($_SESSION['profil']['id_prof']);
	else 
		$int = (int)($_SESSION['profil']['id_etu']);
	$cde_co->bindParam(':id',$int);
	
	if(strcmp($_SESSION['profil']['bConnect'],'0')==0){
		$etat = 1;
		$_SESSION['profil']['bConnect'] = 1;
	}
	else{
		$etat = 0;
		$_SESSION['profil']['bConnect'] = 0;
	}
	$cde_co->bindParam(':etat',$etat);
	$b_co = $cde_co->execute();

}




function liste_u_BD() {
	require ("modele/connect.php"); 
}

?>