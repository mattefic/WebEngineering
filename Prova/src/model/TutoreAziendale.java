package model;

public class TutoreAziendale {
	private String aziendaPartitaIvaCodiceFiscale, nome, cognome, telefono;
	private int id_tutore;

	public TutoreAziendale() {

	}

	public String getAziendaPartitaIvaCodiceFiscale() {
		return aziendaPartitaIvaCodiceFiscale;
	}

	public void setAziendaPartitaIvaCodiceFiscale(String aziendaPartitaIvaCodiceFiscale) {
		this.aziendaPartitaIvaCodiceFiscale = aziendaPartitaIvaCodiceFiscale;
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

	public int getId_tutore() {
		return id_tutore;
	}

	public void setId_tutore(int id_tutore) {
		this.id_tutore = id_tutore;
	}

}
