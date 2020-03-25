package serveur;

import java.net.ServerSocket;
import java.util.Scanner;
import java.util.Timer;

import bibliotheque.Bibliotheque;
import bibliotheque.EmpruntException;

public class ServiceReservation extends Service {
	private Bibliotheque b;
	private int num;
	private int numAbonne;
	private int PORT_RESERVATION;
	private ServerSocket socket_res;
	private String host = "localhost";
	
	public ServiceReservation(Bibliotheque b) {
		this.b = b;
		this.PORT_RESERVATION = 2600;
	}

	public void run() {
		synchronized (this) {
			System.out.println("Voici la liste des livres disponibles : ");
			b.getLivresDisponibles();
			System.out.println("Veillez saisir le numero du livres pour le reserver :");
			
			Scanner sc = new Scanner(System.in);
			num = sc.nextInt();
	
			System.out.println("Veillez saisir votre numero d'abonne :");
			
			Scanner scAbonne = new Scanner(System.in);
			numAbonne = scAbonne.nextInt();
			
			try {
				b.getLivreDispo(num).reserver(b.getAbo(numAbonne));
			} catch (EmpruntException e) {
				e.printStackTrace();
			}
			
			Timer t = new Timer();
			t.schedule(new TaskReservation(b, this), 20000);
			
			System.out.println("Vous avez jusqu'a 30 secondes pour venir chercher votre livre !");
		}
	}
	
	public int numLivre() {
		return num;
	}
	
	public int numAbo() {
		return numAbonne;
	}
	
	public int getNumPort() {
		return PORT_RESERVATION;
	}

	public void finalize() throws Throwable {
		 
	}

	@Override
	public String serviceName() {
		return host;
	}

	@Override
	public int servicePort() {
		return this.PORT_RESERVATION;
	}

	@Override
	public ServerSocket getServ() {
		return socket_res;
	}
	
}
