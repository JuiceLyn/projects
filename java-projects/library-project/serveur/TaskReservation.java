package serveur;

import java.util.TimerTask;

import bibliotheque.Bibliotheque;

public class TaskReservation extends TimerTask {
	private Bibliotheque b;
	private ServiceReservation a;
	
	public TaskReservation(Bibliotheque b,ServiceReservation a) {
		this.b = b;
		this.a = a;
	}
	
	@Override
	public void run() {	
		if (b.estEmprunt(a.numLivre()) == false) {
			b.annulerResa(a.numLivre(), a.numAbo());
			System.out.println("reservation annulee");}
		else
			System.out.println("ok");
	}
}
