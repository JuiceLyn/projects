<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>accueil </title>
</head>

<body><table>
			<tr>
				<th></th>
				<th>Id question</th>
				<th>Id thème</th>
				<th>titre</th>
				<th>texte</th>
			</tr>

			<?php
				foreach($liste_qr as $test){
					echo '<tr><th>';
						echo '<td >'.$test['id_quest'].'</td>';
						echo '<td >'.$test['titre_theme'].'</td>';
						echo '<td>'.$test['titre'].'</td>';
						echo '<td>'.$test['texte'].'</td>';
					echo '</th></tr>';
				}
			?>
		</table>
	<form action ="" method="post">
		La question : <SELECT name="idq" size="1">
		<?php 
		
		foreach($liste_qr as $id){
			echo '<OPTION>'.$id['id_quest'].'<br>';
		}
		?>
		</SELECT><br>
		Est-ce la réponse juste ?
		 <input type="checkbox" name="Valid">
		<br>
		réponse : <input type="text" required name="reponse"><br>
		<input type="submit">
	</form>
</body>
</html>
