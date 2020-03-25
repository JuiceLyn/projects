package bibliotheque;

import java.io.IOException;
import java.net.Socket;

import serveur.Service;

public class Abonne {
	private String nomAbonne;
	private int numero;
	private Socket socket;
	
	public Abonne(int numero, String nomAbonne) {
		this.numero = numero;
		this.nomAbonne = nomAbonne;
	}
	
	public String getNom() {
		return nomAbonne;
	}
	
	public void connexionService(Service s) {
		try {
			this.socket = new Socket(s.serviceName(), s.servicePort());
			System.out.println("On est bien connecte !");
		} catch (IOException e) {
			System.out.println("Impossible de se connecter au serveur");
			e.printStackTrace();
		}
	}
	
	@Override
	protected void finalize() throws Throwable {
		super.finalize();
		this.socket.close();
	}
	
	
	public Socket socket() {
		return socket;
	}
	
	public int numero() {
		return numero;
	}

	public Abonne getAbonne() {
		return this;
	}
	
}
