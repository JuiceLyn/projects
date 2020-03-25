<?php


function accueil() {
	//fonciton qui vérifié que l'utilisateur est connecté comme professeur
	estConnecté();
	
	$nom = $_SESSION['profil']['nom'];

	
	require("./modele/professeur/recupererListeClasses.php");
	$classes = recupererClasses();

	require ("./modele/professeur/recupererTest.php");
	$liste_tests = recupererTest();

	require ("./modele/professeur/recupererTheme.php");
	$liste_themes = recupererTheme();

	require ("./modele/professeur/QuestionRep.php");
	$liste_r = QuestionsReponses();

	require ("./modele/professeur/recupererQuestions.php");
	$liste_q = recupererQuestions();

	//affichage de la page
	require ("./vue/professeur/accueil.tpl");

}


function deconnexion(){
	estConnecté();
	require("./modele/utilisateurBD.php");
	changerEtatConnexion();
	session_destroy();
	$_SESSION['profil'] = array();
	header ("Location:" .'index.php') ;
}


function changerEtatTest(){
	estConnecté();
	require ("./modele/professeur/recupererTest.php");
	$liste_tests = recupererTest();
	require ("./vue/professeur/changerEtatTest.tpl");
}

function addTest(){
	estConnecté();
	require	("./modele/professeur/ajoutTest.php");
	//require ("./vue/professeur/addTest.tpl");
	ajoutTest();
	header ("Location:" .'index.php?controle=professeur&action=accueil') ;
}

function rmTest(){
	estConnecté();
	//require ("./modele/professeur/recupererTest.php");
	require ("./modele/professeur/removeTest.php");
	//$liste_tests = recupererTest();
	require	("./vue/professeur/rmTest.tpl");
	removeTest();
	header ("Location:" .'index.php?controle=professeur&action=accueil') ;
}

function modifyTest(){
	estConnecté();
	require	("./vue/professeur/modifyTest.tpl");
}


function creerQuestion(){
	estConnecté();
	require ("./modele/professeur/recupererTheme.php");
	$liste_themes = recupererTheme();
	//var_dump($liste);
	require("./vue/professeur/ajoutQuestion.tpl");
	require("./modele/professeur/ajoutQuestion.php");
	//var_dump($_POST);
	ajoutQuestion();
}

function ajouterRéponses(){
	estConnecté();
	require ("./modele/professeur/recupererQuestions.php");
	$liste_qr = recupererQuestions();
	//var_dump($liste);
	require("./vue/professeur/ajoutReponse.tpl");
	require ("./modele/professeur/ajoutReponse.php");
	ajoutTest();

}
function Qcm(){
	estConnecté();
	require ("./modele/professeur/recupererTest.php");
	$liste_tests = recupererTest();
	require ("./modele/professeur/recupererQuestions.php");
	$liste_q = recupererQuestions();
	require ("./modele/professeur/PasserQcm.php");
	require("./vue/professeur/FaireQcm.tpl");
}

function QuestionRep(){
	estConnecté();
	require ("./modele/professeur/QuestionRep.php");
	$liste_r = QuestionsReponses();
	require("./vue/professeur/QuestionRep.tpl");

}
function voirEleve(){
	require("./modele/professeur/recupererListeClasses.php");
	$classes = recupererClasses();
	require("./vue/professeur/voirEleveConnecte.tpl");
}

function voirBilan(){
	require ("./modele/professeur/recupererTest.php");
	$liste_tests = recupererTest();
	require("./vue/professeur/voirBilan.tpl");
}


function estConnecté(){
	if(strcmp ($_SESSION['profil']['mode'],"professeur")!=0)
		header ("Location:" .'index.php');
}

function exportExcel(){
	$res = require('./modele/professeur/obtenirBilanTab.php');
	//header ("Location:" .'index.php?controle=professeur&action=accueil') ;
}

function obtenirReponseAJAX(){
	require('./modele/professeur/obtenirReponse.php');
}

function obtenirEleveConnecteAJAX(){
	require('./modele/professeur/obtenirConnecte.php');
}

function obtenirBilanAJAX(){
	require('./modele/professeur/obtenirBilan.php');


}
function modifierTestActifAJAX(){
	require('./modele/professeur/ModifierActif.php');
}
function ajoutQuestionAJAX(){
	require('./modele/professeur/ajoutQuestion.php');
}
function ajoutReponseAJAX(){
	require('./modele/professeur/ajoutReponse.php');
}
function ajoutQCM(){
	require ("./modele/professeur/PasserQcm.php");
	FaireQcm();
	header ("Location:" .'index.php?controle=professeur&action=accueil') ;
}


