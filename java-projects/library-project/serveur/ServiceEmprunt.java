package serveur;

import java.net.ServerSocket;
import java.util.Scanner;

import bibliotheque.Bibliotheque;
import bibliotheque.EmpruntException;

public class ServiceEmprunt extends Service {
	private Bibliotheque b;
	private int numLivre;
	private int PORT_EMPRUNT;
	private String nom;
	private ServerSocket socket_emp;
	private int numAbonne;
	
	public ServiceEmprunt(Bibliotheque b) {
		this.PORT_EMPRUNT = 2500;
		this.b = b;
		this.nom = "localhost";
	}
	
	public void run() {
		synchronized (this) {
			System.out.println("Voici la liste des livres disponibles : ");
			b.getLivresDisponibles();
			System.out.println("Veillez saisir votre numero d'abonne :");
			
			Scanner sc = new Scanner(System.in);
			numAbonne = sc.nextInt();
			
			System.out.println("Veillez saisir le livre que vous voulez emprunter");
			
			Scanner scLivre = new Scanner(System.in);
			numLivre = scLivre.nextInt();
			try {
				b.getLivreDispo(numLivre).emprunter(b.getAbo(numAbonne));
			} catch (EmpruntException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public String serviceName() {
		return nom;
	}

	@Override
	public int servicePort() {
		return PORT_EMPRUNT ;
	}
	
	public ServerSocket getServ() {
		return socket_emp;
	}

}
