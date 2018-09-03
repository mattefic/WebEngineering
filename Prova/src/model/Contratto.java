package model;

import java.sql.Date;

public class Contratto {

	private int idContratto, idAzienda, idTutoreUniversitario, idTutoreAziendale, idUtente, idOfferta, cfu;
	private Date dataAccettazione, dataInizio, dataFine;
	private boolean votato;
	private Utente utente;
	private String percorso;

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

	public int getIdOfferta() {
		return idOfferta;
	}

	public void setIdOfferta(int idOfferta) {
		this.idOfferta = idOfferta;
	}

	public Date getDataFine() {
		return dataFine;
	}

	public void setDataFine(Date dataFine) {
		this.dataFine = dataFine;
	}

	public Date getDataInizio() {
		return dataInizio;
	}

	public void setDataInizio(Date dataInizio) {
		this.dataInizio = dataInizio;
	}

	public boolean isVotato() {
		return votato;
	}

	public void setVotato(boolean votato) {
		this.votato = votato;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public int getIdAzienda() {
		return idAzienda;
	}

	public void setIdAzienda(int idAzienda) {
		this.idAzienda = idAzienda;
	}

	public int getCfu() {
		return cfu;
	}

	public void setCfu(int cfu) {
		this.cfu = cfu;
	}

	public String getPercorso() {
		return percorso;
	}

	public void setPercorso(String percorso) {
		this.percorso = percorso;
	}

}