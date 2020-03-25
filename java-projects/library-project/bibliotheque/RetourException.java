package bibliotheque;

public class RetourException extends Exception {
	
	private Livre livre;
	
	public RetourException(Livre livre) {
		this.livre = livre;
	}
	
	@Override
	public String toString() {
		return "Le livre " + livre.getNom() + "n'a soit pas ete reserve, soit pas emprunte.";
	}
}
