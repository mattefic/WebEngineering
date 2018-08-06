package model;

import java.util.Date;

public class Contratto {

	private int candidaturaOffertaIdOfferta, candidaturaTutoreUniversitarioIdTutore;
	private Date dataAccettazione;
	private String tutoreAziendaleAziendaPartitaIvaCodiceFiscale, candidaturaOffertaAziendaPartitaIvaCodiceFiscale,
			candidaturaUtenteCodiceFiscale;

	public Contratto() {

	}

	public int getCandidaturaOffertaIdOfferta() {
		return candidaturaOffertaIdOfferta;
	}

	public void setCandidaturaOffertaIdOfferta(int candidaturaOffertaIdOfferta) {
		this.candidaturaOffertaIdOfferta = candidaturaOffertaIdOfferta;
	}

	public int getCandidaturaTutoreUniversitarioIdTutore() {
		return candidaturaTutoreUniversitarioIdTutore;
	}

	public void setCandidaturaTutoreUniversitarioIdTutore(int candidaturaTutoreUniversitarioIdTutore) {
		this.candidaturaTutoreUniversitarioIdTutore = candidaturaTutoreUniversitarioIdTutore;
	}

	public String getTutoreAziendaleAziendaPartitaIvaCodiceFiscale() {
		return tutoreAziendaleAziendaPartitaIvaCodiceFiscale;
	}

	public void setTutoreAziendaleAziendaPartitaIvaCodiceFiscale(String tutoreAziendaleAziendaPartitaIvaCodiceFiscale) {
		this.tutoreAziendaleAziendaPartitaIvaCodiceFiscale = tutoreAziendaleAziendaPartitaIvaCodiceFiscale;
	}

	public String getCandidaturaOffertaAziendaPartitaIvaCodiceFiscale() {
		return candidaturaOffertaAziendaPartitaIvaCodiceFiscale;
	}

	public void setCandidaturaOffertaAziendaPartitaIvaCodiceFiscale(
			String candidaturaOffertaAziendaPartitaIvaCodiceFiscale) {
		this.candidaturaOffertaAziendaPartitaIvaCodiceFiscale = candidaturaOffertaAziendaPartitaIvaCodiceFiscale;
	}

	public String getCandidaturaUtenteCodiceFiscale() {
		return candidaturaUtenteCodiceFiscale;
	}

	public void setCandidaturaUtenteCodiceFiscale(String candidaturaUtenteCodiceFiscale) {
		this.candidaturaUtenteCodiceFiscale = candidaturaUtenteCodiceFiscale;
	}

	public Date getDataAccettazione() {
		return dataAccettazione;
	}

	public void setDataAccettazione(Date dataAccettazione) {
		this.dataAccettazione = dataAccettazione;
	}

}