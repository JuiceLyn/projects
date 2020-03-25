function play(){
  var audio = document.getElementById("audio");
  audio.play();
  }

function onclickAbonner() {
var password = document.getElementById("password").value ;


  let audio = new Audio('NeverGonna.mp3');
  


 if ( password != null )
  {
    // on le compare à celui attendu
  if ( password == ("otlavid") || password == ("0tlavid") )
  {
    audio.play();
  
    // mot de passe valide, on ouvre la page secrète
    window.open("./popup.html");
    
  } 
  else
    {
      alert( "Mot de passe incorrect!", "Erreur" );
    }
  }
  
}

