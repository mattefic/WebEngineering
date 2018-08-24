package model;

import java.util.Date;

public class Contratto {

	private int idContratto, idTutoreUniversitario, idTutoreAziendale, idUtente;
	private Date dataAccettazione;

	public Contratto() {

	}

	public int getIdTutoreUniversitario() {
		return idTutoreUniversitario;
	}

	public void setIdTutoreUniversitario(int idTutoreUniversitario) {
		this.idTutoreUniversitario = idTutoreUniversitario;
	}

	public int getIdTutoreAziendale() {
		return idTutoreAziendale;
	}

	public void setIdTutoreAziendale(int idTutoreAziendale) {
		this.idTutoreAziendale = idTutoreAziendale;
	}

	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public Date getDataAccettazione() {
		return dataAccettazione;
	}

	public void setDataAccettazione(Date dataAccettazione) {
		this.dataAccettazione = dataAccettazione;
	}

	public int getIdContratto() {
		return idContratto;
	}

	public void setIdContratto(int idContratto) {
		this.idContratto = idContratto;
	}

}