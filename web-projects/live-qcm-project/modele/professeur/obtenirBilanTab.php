<?php


// function ajoutQCM(){
	//
	// $_POST['question'] = 1;
if (isset($_POST['test'])) {
	require ("./modele/connexionBD.php"); 
	try {
		$cde_res = $pdo->prepare("SELECT * FROM `bilan` LEFT JOIN `etudiant` ON bilan.id_etu=etudiant.id_etu WHERE id_test = :test ");
		$cde_res->bindParam(':test', $_POST['test']);
		$b_res = $cde_res->execute();
		if($b_res){
			$res_res = $cde_res->fetchAll(PDO::FETCH_ASSOC);
			header('Content-Type: application/xls');
			header('Content-Disposition: attachment; filename=note_test_'.$_POST['test'].'.xls');
			$output= '';
			$output .= '
			<table class="table">  
			<tr>  
			<th>Nom</th>  
			<th>Prenom</th>  
			<th>Groupe</th>  
			<th>Note</th>
			<th>Date</th>
			</tr>';
			foreach($res_res as $row)
			{
				$output .= '
				<tr>  
				<td>'.$row["nom"].'</td>  
				<td>'.$row["prenom"].'</td>  
				<td>'.$row["num_grpe"].'</td>  
				<td>'.$row["note_test"].'</td>  
				<td>'.$row["date_bilan"].'</td>
				</tr>
				';
			}
			$output .= '</table>';
			//convertir le fichier en utf-8
			echo "\xEF\xBB\xBF";
			//exporter le fichier
			echo $output;
		}
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrète tout.
		}
	}
// }


