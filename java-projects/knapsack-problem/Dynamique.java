import java.util.List;

public class Dynamique {
	private double[][] table;
	private double max_weight;
	private List<Objet> objects;
	
	public Dynamique(SacAdos a, SacAdos b) {
		this.max_weight = a.getPoids_Max() * 100;
		this.table = new double[b.getOBJETS().size()][(int) max_weight + 1];
		objects = b.getOBJETS();
	}

	public void AlgoDynamique(SacAdos backpack) {
		int m = 0;
		int z = 0;
		double p = 0;
			
		double v = 0;
		for (m = 0; m < objects.size(); m++) {
			for (z = 0; z <= max_weight; z++) { // The backpack leaves 1 kg if lower
				if (m == 0) {
					if (objects.get(0).getPoids() * 100 > z)
						table[0][z] = 0;
					else
						table[0][z] = objects.get(0).getValeur();
				}
				
				else if (m != 0) {
					if (objects.get(m).getPoids() * 100 > z)
						table[m][z] = table[m - 1][z];
					else
						table[m][z] = Math.max(table[m - 1][z], table[m - 1][(z - (int) (objects.get(m).getPoids() * 100))] + (int) objects.get(m).getValeur());
				}
			}
		}
		
		m--;
		z--;

		while (table[m][z] == table[m][z - 1]) {
			z--;
		}

		while (z > 0) {
			while ((m > 0) && (table[m][z] == table[m - 1][z])) {
				--m;
			}
			
			z = (int) (z - (objects.get(m).getPoids() * 100));
			
			if (z >= 0) {
				backpack.ajouter(objects.get(m));
				--m;
			}
		}			
	}
}


