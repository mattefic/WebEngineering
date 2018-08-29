package model;

import java.util.Date;

public class Candidatura {

	private int idCandidatura, idOfferta, idTutore, idUtente, cfu;
	private String stato;
	private Date dataCanditatura;

	private Offerta offerta;
	private Utente utente;
	// stato è {approvata,attesa,respinta}

	public Candidatura() {

	}

	public int getIdOfferta() {
		return idOfferta;
	}

	public void setIdOfferta(int idOfferta) {
		this.idOfferta = idOfferta;
	}

	public int getIdTutore() {
		return idTutore;
	}

	public void setIdTutore(int idTutore) {
		this.idTutore = idTutore;
	}

	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public String getStato() {
		return stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}

	public Date getDataCanditatura() {
		return dataCanditatura;
	}

	public void setDataCanditatura(Date dataCanditatura) {
		this.dataCanditatura = dataCanditatura;
	}

	public int getIdCandidatura() {
		return idCandidatura;
	}

	public void setIdCandidatura(int idCandidatura) {
		this.idCandidatura = idCandidatura;
	}

	public int getCfu() {
		return cfu;
	}

	public void setCfu(int cfu) {
		this.cfu = cfu;
	}

	public Offerta getOfferta() {
		return offerta;
	}

	public void setOfferta(Offerta offerta) {
		this.offerta = offerta;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

}
