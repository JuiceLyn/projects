import java.util.ArrayList;

public class Arbre {
	private ArrayList<Objet> objets;
	private Arbre g;
	private Arbre d;

	public Arbre() {
		this.objets = new ArrayList<Objet>();
	}
	
	public Arbre(Arbre gauche, Arbre droite) {
		this.objets = new ArrayList<Objet>();
		this.g = gauche;
		this.d = droite;
	}
	
	public Arbre(ArrayList<Objet> obj) {
		this.objets = new ArrayList<Objet>();
		for (int i = 0; i < obj.size(); i++) {
			this.getObjet().add(obj.get(i));
		}
	}
	
	public Arbre(ArrayList<Objet> objets, Arbre g, Arbre d) {
		this(g, d);
		for (int i = 0; i < objets.size(); i++) {
			this.getObjet().add(objets.get(i));
		}
	}
	
	public void ajouterG(Arbre gauche) {
		this.g = gauche;	
	}
	
	public void ajouterD(Arbre droite) {
		this.d = droite;
	}
	
	public void ajouterObjet(ArrayList<Objet> objets) {
		for (int i = 0; i < objets.size(); i++) {
			 this.getObjet().set(i, objets.get(i));
		}
	}
	
	public Arbre getDroite() {
		return this.d;
	}
	
	public Arbre getGauche() {
		return this.g;
	}
	
	public ArrayList<Objet> getObjet() {
		return this.objets;
	}

	public Double getValeur() {
		double valeur = 0;
		for (int i = 0; i < this.getObjet().size(); i++) {
			valeur = valeur + this.getObjet().get(i).getValeur();
		}
		
		return valeur;
	}
	
	public double getPoids() {
		double poids = 0;
		for (int i = 0; i < this.getObjet().size(); i++) {
			poids = poids + this.getObjet().get(i).getPoids();
		}
		
		return poids;
	}
	
}



