import java.util.Collections;
import java.util.Comparator;

public class Glouton {
	public static Comparator<Objet> ComparatorRapport = new Comparator<Objet>() {
        public int compare(Objet obj1, Objet obj2) {
            return (int) (obj2.getRapport() - obj1.getRapport());
        }
	};
	
	public void trieGlouton(SacAdos a) {
		Collections.sort(a.getOBJETS(), Glouton.ComparatorRapport);
	}
	
	public static void trierSac(SacAdos a,SacAdos b) {
		double p = 0;
			for (Objet o : a.getOBJETS()) {
				if (o.getPoids()+p <= b.getPoids_Max()) {
					
					b.getSAC().add(o);
					p=p+o.getPoids();
				
				}
				else
					System.out.println(o.getNom() + " est trop lourd");
				
				if (p == b.getPoids_Max())
					return;
			}
			
		}
		
	}
	



