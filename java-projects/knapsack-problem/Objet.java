public class Objet {
	private double poids;
	private double valeur;
	private double rapport;
	private String nom;
	
	/**
	 * Constructeur d'un objet prenant en param¨¨tre son nom, son poids et sa valeur
	 */
	public Objet(String name, double weight, double value) {
		this.nom = name;
		this.poids = weight;
		this.valeur = value;
		this.rapport = value / weight; // rapport
	}
	
	/**
	 * Fonction retournant l'objet courant
	 */
	public Objet getObj() {
		return this;
	}
	
	/**
	 * Fonction retournant le nom d'un objet
	 */
	public String getNom() {
		return nom;
	}
	
	/**
	 * Fonction retournant le poids d'un objet
	 */
	public double getPoids() {
		return poids;
	}

	/**
	 * Fonction retournant la valeur d'un objet
	 */
	public double getValeur() {
		return valeur;
	}
	
	/**
	 * Fonction retournant le rapport entre la valeur et le poids d'un objet
	 */
	public double getRapport() {
		return rapport;
	}
	
	/**
	 * Fonction retournant une chaine de caract¨¨res contenant le nom, le poids et la valeur d'un objet
	 */
	public String Str() {
		return nom + " [value = " + valeur + ", weight = " + poids + "]";
	}
	
}
