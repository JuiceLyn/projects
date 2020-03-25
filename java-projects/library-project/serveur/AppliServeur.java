package serveur;

import java.io.IOException;
import java.net.ServerSocket;

import bibliotheque.Abonne;
import bibliotheque.Bibliotheque;
import bibliotheque.Livre;

public class AppliServeur {
	private final static int PORT_RESERVATION = 2500, PORT_EMPRUNT = 2600, PORT_RETOUR = 2700;
	
	public static void main(String[] args) {
		Bibliotheque b = new Bibliotheque();
		Livre livre1 = new Livre(b, "Les miserables", 1);
		Livre livre2 = new Livre(b, "Le petit prince", 2);
		Livre livre3 = new Livre(b, "Tintin", 3);
		
		b.ajouterLivresDisponibles(livre1);
		b.ajouterLivresDisponibles(livre2);
		b.ajouterLivresDisponibles(livre3);
		
		Abonne a = new Abonne(1, "Jean");
		b.ajouterAbo(a);
		
		try {
			ServerSocket socket_res = new ServerSocket(PORT_RESERVATION);
			ServerSocket socket_emp = new ServerSocket(PORT_EMPRUNT);
			ServerSocket socket_ret = new ServerSocket(PORT_RETOUR);
			new Thread(new ServiceLauncher(socket_emp, new ServiceEmprunt(b))).start();
			new Thread(new ServiceLauncher(socket_res, new ServiceReservation(b))).start();
			new Thread(new ServiceLauncher(socket_ret, new ServiceRetour(b))).start();
			
			System.out.println("ok");
			
		} catch (IOException e) {
			System.err.println("Pb lors de la creation du service : " +  e);			
		}
	}
}
