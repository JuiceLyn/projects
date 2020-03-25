import java.util.ArrayList;

public class PSE {
	public static void tri_PSE(SacAdos a) {
		Arbre racine = new Arbre();
		PSE.ajouterBranche(a, racine, 0);
		ArrayList<Arbre> valeur = new ArrayList<Arbre>();
		PSE.getArbre(valeur, racine, 0, a.getOBJETS().size());
		
		Double tmp = (double) 0;
		int indice = 0;
		
		for (int i = 0; i < valeur.size(); i++) { // Recherche du meilleur arbre dans valeur et on prend l'indice
			if (tmp.compareTo(valeur.get(i).getValeur()) < 0) {
				indice = i;
				tmp = (double) valeur.get(i).getValeur();
			}
		}
		
		for (int i = 0; i < valeur.get(indice).getObjet().size(); i++) {  
			a.ajouter(valeur.get(indice).getObjet().get(i));
		}
	}
	
	// On ajoute des branches à l'arbre (récursif)
	public static void ajouterBranche(SacAdos a, Arbre arbre, int tailleABR) {
		if (a.getOBJETS().size() > tailleABR) {
			Arbre gauche = new Arbre(arbre.getObjet());
			Double tmp;
			tmp = (Double) (gauche.getPoids() + a.getOBJETS().get(tailleABR).getPoids());
			
			if (tmp.compareTo(a.getPoids_Max()) <= 0) {
				gauche.getObjet().add(a.getOBJETS().get(tailleABR));
				arbre.ajouterG(gauche);
				PSE.ajouterBranche(a, arbre.getGauche(), tailleABR + 1);
			}
			
			Arbre droite = new Arbre(arbre.getObjet());
			arbre.ajouterD(droite);
			PSE.ajouterBranche(a, arbre.getDroite(), tailleABR + 1);
				
		}
		
	}
	
	// On met dans tab toutes les branches d'indice maximal
	public static void getArbre(ArrayList<Arbre> tab, Arbre a, int tailleABR, int max) {
		if (tailleABR == max) {
			tab.add(a);
		}
		else {
			if (a.getDroite() != null)
				PSE.getArbre(tab, a.getDroite(), tailleABR + 1, max);
			if (a.getGauche() != null)
				PSE.getArbre(tab, a.getGauche(), tailleABR + 1, max);
		}
		
	}
	
}
