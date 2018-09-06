package model;

public class TutoreUniversitario {

	private int idTutore, numRichieste;
	private String nome, cognome, email;

	public TutoreUniversitario() {

	}

	public int getIdTutore() {
		return idTutore;
	}

	public void setIdTutore(int idTutore) {
		this.idTutore = idTutore;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public int getNumRichieste() {
		return numRichieste;
	}

	public void setNumRichieste(int numRichieste) {
		this.numRichieste = numRichieste;
	}
}