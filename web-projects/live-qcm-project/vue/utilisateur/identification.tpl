<!DOCTYPE HTML>
<html>

	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<link rel="stylesheet" href="./vue/utilisateur/styleCSS/identi.css" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	

	</head>

	<body>
	<div class="container">
    <div class="logo"><h4>Identification</h4></div>
    <div class="login-item">
      <form method="post" action="index.php?controle=utilisateur&action=identification" class="form form-login">
			<div class="form-group">

								<p>Rôle : </p> 

								<select class="form-control" name="mode">

									<option name="mode" value="professeur" id="professeur">Professeur</option>
									<option name="mode" value="eleve" id="eleve">Etudiant</option>

								</select>

							</div>

        <div class="form-field">
          <label class="utilisateur" for="login-username"><span class="hidden">Nom d'utilisateur</span></label>
          <input id="login-username" name ="nom" type="text" class="form-input" placeholder="Nom d'utilisateur" required>
        </div>
        <div class="form-field">
          <label class="mdp" for="login-password"><span class="hidden">Mot de passe</span></label>
          <input id="login-password" name="mdp" type="password" class="form-input" placeholder="Mot de passe" required>
        </div>

        <div class="form-field">
          <input type="submit" value="Log in">
        </div>
      </form>
    </div>
</div>
	</body>

</html>
