import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class SacAdos {
	private static double poids_max;
	private static double p;
	private static ArrayList<Objet> objets;
	private static ArrayList<Objet> Sac;
	private String path;
	
	
	/**
	 * Constructeur d'un sac à dos
	 */
	public SacAdos() {
		objets = new ArrayList<Objet>();
		Sac = new ArrayList<Objet>();
		
	}
	
	/**
	 * Constructeur d'un sac à dos prenant en paramètre le chemin du fichier 
	 * ayant la liste des objets du sac à dos et son poids maximal
	 */
	public SacAdos(String path, double poids_max) {
		this.path = path;
		this.poids_max = poids_max;
		Sac = new ArrayList<Objet>();
	}
	
	/**
	 * Fonction permettant d'ajouter un objet dans le sac
	 */
	public void ajouter(Objet obj) {
		Sac.add(obj);
	}
	
	/**
	 * Fonction permettant d'obtenir la liste des objets disponibles
	 */
	public void getList() {
		int compteur = 1;
		
		for (Objet o : objets) {
			System.out.println(compteur + " - " +  o.getNom());
			++compteur;
		}
	}
	
	/**
	 * Ajoute un objet dans la liste des objets disponibles
	 * Prend en paramètre le nom, le poids et la valeur de l'objet
	 */
	public static void addObject(String name, double weight, double value) {
		Objet obj = new Objet(name, weight, value);
		objets.add(obj);
	}
	
	/**
	 * Fonction permettant de lire tout le contenu d'un fichier
	 * Prend en paramètre le nom du fichier (incluant son chemin)
	 */
	public static void ReadFile(String path) throws FileNotFoundException {
		try {
			File f = new File (path + ".txt");
			@SuppressWarnings("resource")
			Scanner scanner = new Scanner(f).useDelimiter(" ; |\n");
			
			while (scanner.hasNext()) {
				addObject(scanner.next(), Double.parseDouble(scanner.next()), Double.parseDouble(scanner.next()));
			}
			
			scanner.close();
		}
		catch (FileNotFoundException NotFounded) {
			System.out.println("Fichier non trouvé");
		}
	}
	
	/**
	 * Fonction permettant d'obtenir le poids maximal du sac
	 */
	public double getPoids_Max() {
		return poids_max;
	}

	/**
	 * Retourne la liste des objets dans le sac
	 */
	public ArrayList<Objet> getOBJETS() {
		return objets;
	}
	
	/**
	 * Permet d'obtenir le nom des objets contenus dans le sac
	 */
	public void getBag() {
		int compteur = 1;
		
		for (Objet o : Sac) {
			System.out.println(compteur + " - " +  o.getNom());
			++compteur;
		}
	}
	
	public ArrayList<Objet> getSAC() {
		return Sac;
	}

}
