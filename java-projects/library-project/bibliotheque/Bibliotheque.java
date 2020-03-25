package bibliotheque;

import java.util.ArrayList;
import java.util.HashMap;

public class Bibliotheque {
	private HashMap<Livre, Abonne> livresReserves;
	private ArrayList<Livre> livresDisponibles;
	private ArrayList<Livre> livresEmpruntes;
	private ArrayList<Abonne> listeAbonnes;
	
	public Bibliotheque() {
		this.livresDisponibles = new ArrayList<>();
		this.livresReserves = new HashMap<>();
		this.livresEmpruntes = new ArrayList<>();
		this.listeAbonnes = new ArrayList<>();
	}
	
	public void ajouterLivresDisponibles(Livre l) {
		livresDisponibles.add(l);	
	}
	
	public void rendreLivre(int numero) {
		for (int i = 0; i < livresEmpruntes.size(); ++i)
			if (numero == livresEmpruntes.get(i).numero()) {
				livresDisponibles.add(livresEmpruntes.get(i));
				livresEmpruntes.remove(i);
			}
	}
	
	public void ajouterLivresReserves(int num, int numAbonne) {
		for (Livre a : livresDisponibles)
			if (num == a.numero())
				for (Abonne abo : listeAbonnes)
					if (numAbonne == abo.numero())
						livresReserves.put(a.getLivre(), abo.getAbonne());
	}
	
	public void ajouterLivresEmprunter(Livre l) {
				livresEmpruntes.add(l);	
			
	}
	
	public void getLivresDisponibles() {
		for (Livre l : livresDisponibles)
			System.out.println(l.numero() + " " + l.getNom());
	}
	
	public HashMap getLivresReserves() {
		return livresReserves;
	}
	
	public void getLivresEmpruntes() {
		for (Livre l : livresEmpruntes)
			System.out.println(l.numero()+" "+l.getNom());
	}
	
	public String getNomLivre(String nom) {
		String s = "";
		for (Livre l : livresDisponibles) {
			if (nom == l.getNom()) {
				return nom;
			}
		}
		
		return s;
	}
	
	public boolean estDispo(int num) {
		for (Livre l : livresDisponibles)
			if (num == l.numero())
				return true;
			else
				return false;
		return false;
	}
	
	public boolean estResa(int num, int numAbonne) {
		for (Livre l : livresReserves.keySet())
			if (num == l.numero())
				for (Abonne abo : livresReserves.values())
					if (numAbonne == abo.numero())
						return true;
					else
						return false;
			else
				return false;
		return false;
	}
	
	public boolean estEmprunt(int num) {
		for (Livre l : livresEmpruntes)
			if (num == l.numero())
				return true;
			else
				return false;
		return false;
	}
	
	public void annulerResa(int num, int numAbo) {
		for (Livre l : livresReserves.keySet())
			if (num == l.numero())
				for (Abonne abo : livresReserves.values())
					if (numAbo == abo.numero())
						livresReserves.remove(num, numAbo);
	}
	
	public void plusDispo(int num) {
		for (int i = 0; i < livresDisponibles.size(); ++i)
			if (num == livresDisponibles.get(i).numero())
				livresDisponibles.remove(i);
	}
	
	public void ajouterAbo(Abonne a) {
		listeAbonnes.add(a);
	}
	public String getNomAbo (int num) {
		for (Abonne a : listeAbonnes)
			if (num == a.numero())
				return a.getNom();
		return "";
	}
	public Abonne getAbo(int num) {
		for (Abonne a : listeAbonnes)
			if (num == a.numero()) {
				return a;
			}
		return null;
	}
	
	public Livre getLivreDispo(int num) {
		for (Livre a : livresDisponibles)
			if (num == a.numero())
				return a;
		return null;
	}
	
	public Livre getlivreEmprunter(int num) {
		for (Livre l : livresEmpruntes)
			if (num == l.numero())
				return l;
		return null;
	}				
}