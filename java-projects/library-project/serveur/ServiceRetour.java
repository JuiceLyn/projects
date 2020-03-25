package serveur;

import java.net.ServerSocket;
import java.util.Scanner;

import bibliotheque.Bibliotheque;
import bibliotheque.RetourException;

public class ServiceRetour extends Service {
	private Bibliotheque b;
	private int numLivre;
	private int numAbonne;
	private String nom;
	private ServerSocket socket_ret;
	private int PORT_RETOUR;
	
	public ServiceRetour(Bibliotheque b) {
		this.b = b;
		this.PORT_RETOUR = 2700;
		this.nom = "localhost";
	}

	@Override
	public void run() {
		synchronized (this) {
			System.out.println("Voici la liste des livres empruntes : ");
			b.getLivresEmpruntes();
			
			System.out.println("Veillez saisir votre numero d'abonne :");
			
			Scanner sc = new Scanner(System.in);
			numAbonne = sc.nextInt();
			
			System.out.println("Veillez saisir le numero du livre � retourner :");
			
			Scanner scLivre = new Scanner(System.in);
			numLivre = scLivre.nextInt();
			
			if (b.estResa(numLivre, numAbonne) == true)
				b.annulerResa(numLivre, numAbonne);
			else
				try {
					b.getlivreEmprunter(numLivre).retour();
				} catch (RetourException e) {
					e.printStackTrace();
				} // Sinon l'abonne a rendu le livre normalement sans reservation
		}
	}

	@Override
	public String serviceName() {
		return nom;
	}

	@Override
	public int servicePort() {
		return PORT_RETOUR;
	}

	@Override
	public ServerSocket getServ() {
		return socket_ret;
	}
	
}
