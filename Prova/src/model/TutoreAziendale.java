package model;

public class TutoreAziendale {
	private String idAzienda, nome, cognome, telefono;
	private int idTutore;

	public TutoreAziendale() {

	}

	public String getIdAzienda() {
		return idAzienda;
	}

	public void setIdAzienda(String idAzienda) {
		this.idAzienda = idAzienda;
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

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public int getIdTutore() {
		return idTutore;
	}

	public void setIdTutore(int idTutore) {
		this.idTutore = idTutore;
	}

}
