package bibliotheque;

public class Livre implements Document {
	private String nom;
	private int numero;
	private Bibliotheque b;
	
	public Livre(Bibliotheque b, String nom, int numero) {
		this.nom = nom;
		this.numero = numero;
		this.b = b;
	}
	
	@Override
	public int numero() {
		return numero;
	}
	
	public Livre getLivre() {
		return this;
	}

	@Override
	public void reserver(Abonne ab) throws EmpruntException {
		b.ajouterLivresReserves(numero, ab.numero());
	}

	@Override
	public void emprunter(Abonne ab) throws EmpruntException {
		if (b.estResa(numero, ab.numero()) == true)
			try {
				throw new EmpruntException();
			} catch (EmpruntException e) {
				e.printStackTrace();
			}
		
			b.ajouterLivresEmprunter(this);
			b.plusDispo(numero);
			System.out.println("Emprunte !");
	}
		
	@Override
	public void retour() throws RetourException {
		b.rendreLivre(numero);
	}
	
	public String getNom() {
		return this.nom;
	}

}
