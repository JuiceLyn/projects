import java.io.IOException;
import java.util.Scanner;

public class Appli {
	
	public static void main(String[] args) throws IOException {
		double poidsMax;
		String methode;
		SacAdos a = new SacAdos(); 
		String chemin;
		
		Scanner sc1 = new Scanner(System.in);
		Scanner sc2 = new Scanner(System.in);
		
		System.out.println("Entrez le nom du fichier à ouvrir\n");
		chemin = sc1.nextLine();
		SacAdos.ReadFile(chemin);
		a.getList();
		
		System.out.println("Entrez le poids maximum du sac\n");
		poidsMax = sc1.nextDouble();
		
		SacAdos b = new SacAdos(chemin, poidsMax);
		System.out.println("Entrez la méthode de tri (glouton, dynamique ou pse)\n");
		methode = sc2.nextLine();
		
		System.out.println(chemin + " " + poidsMax + " " + methode);
		
		switch (methode) {
			case "pse":
				double p1 = 0;
				double v1 = 0;
				
				PSE p = new PSE();
				p.tri_PSE(a);
				a.getBag();
				
				for (Objet o : a.getSAC()) {
					p1 = p1 + o.getPoids();
					v1 = v1 + o.getValeur();
				}
				
				System.out.println(p1);
				System.out.println(v1);
				
				break;
				
			case "dynamique":
				double p2 = 0;
				double v2 = 0;
				
				Dynamique d = new Dynamique(b, a);
				d.AlgoDynamique(a);
				a.getBag();
				for (Objet o : a.getSAC()) {
					p2 = p2 + o.getPoids();
					v2 = v2 + o.getValeur();
				}
				System.out.println(p2);
				System.out.println(v2);
					
				break;
				
			case "glouton":
				double p3 = 0;
				double v3 = 0;
				
				Glouton g = new Glouton();
				g.trieGlouton(a);
				Glouton.trierSac(a, b);
				a.getBag();
				
				for (Objet o : a.getSAC()) {
					p3 = p3 + o.getPoids();
					v3 = v3 + o.getValeur();
				}
				
				System.out.println(p3);
				System.out.println(v3);
				
				break;
		}

	}
}
