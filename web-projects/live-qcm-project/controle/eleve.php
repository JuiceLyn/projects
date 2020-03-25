<?php

	function accueil() {
		$nom = $_SESSION['profil']['nom'];
		if(isset($_SESSION['profil']['id_prof'])){
			$prof = true;
			if(!isset($_POST['classe'])){
				$grp = 201;
			} else{
				$_SESSION['profil']['num_grpe'] = $_POST['classe'];
				$grp = $_SESSION['profil']['num_grpe'];
			}
		} else {
			$grp = $_SESSION['profil']['num_grpe'];
		}
		require ("./modele/professeur/recupererListeClasses.php");
		$classes = recupererClasses();
		require ("./vue/eleve/accueil.tpl");
	}

	function deconnexion() {
		require("./modele/utilisateurBD.php");
		changerEtatConnexion();
		SESSION_DESTROY();
		$url = ".";
		header ("Location:" . $url) ;
	}
	
	function listes() {
		require ("./modele/eleve/testBD.php");
		$liste = liste_tests();
		//var_dump($liste);
		require("./vue/eleve/listeTestEleve.tpl");
	}
	
	function repondreTest(){
		if(isset($_GET['test'])){
			$id= -1;
			if(isset($_SESSION['profil']['id_etu']))
				$id = $_SESSION['profil']['id_etu'];
			$liste_qcm = require("./modele/eleve/recupererQCM.php");
			//var_dump($liste_qcm);
			require('./vue/eleve/QuestionRep.tpl');
		}
	}

	function vérifierRéponses(){
		//var_dump($_POST);
		require("./modele/eleve/QuestionRep.php");
		require("./modele/eleve/ajouterRes.php");
		//liste des questions dans le test
		$liste_qcm = require("./modele/eleve/recupererQCM.php");
		//liste des réponses données par l'élève
		$listeRdonnées = array();
		//note de l'élève
		$note = 0;
		require('./modele/eleve/obtenirNombreQuestionTest.php');
		//nombre de question dans le test
		$nombreQuestion = getNombreQuestion($_GET['test']);
		//var_dump($nombreQuestion);
		if($nombreQuestion==0)
			$note = 20;
		
		foreach ($_POST as $rep) {
			foreach ($rep as $id_rep) {
				$listeR = getReponse($id_rep);
				
				if($listeR[0]['bvalide']==0){
					$note = $note-0.5; 
				} else {
					$note +=(20/$nombreQuestion);
				}
				//ajout du résultat de la question dans la base
				ajoutRes($listeR[0]['id_quest'], $listeR[0]['id_rep'], $_GET['test']);
				//ajout de la réponse dans la liste des réponses données
				array_push($listeRdonnées, $listeR);				
			}
			//ajout de la question dans la liste des questions
				
		}
		//var_dump($listeRdonnées);
		//var_dump($note);
		require('./modele/eleve/ajouterBilan.php');
		//vérification que l'élève n'a pas déjà un résultat sur le QCM
		if(déjàRésultat($_GET['test'],$_SESSION['profil']['id_etu'])==0)
			ajoutBilan($_GET['test'],$_SESSION['profil']['id_etu'],$note);
		require('./vue/eleve/Resultat.tpl');
	}