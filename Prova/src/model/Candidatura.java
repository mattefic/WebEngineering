package model;

import java.util.Date;

public class Candidatura {

	private int offertaIdOfferta, tutoreUniversitarioIdTutore;
	private String offertaAziendaPartitaIvaCodiceFiscale, utenteCodiceFiscale, stato;
	private Date dataCanditatura;
	//stato è {approvata,attesa,respinta}

	public Candidatura() {

	}

	public int getOffertaIdOfferta() {
		return offertaIdOfferta;
	}

	public void setOffertaIdOfferta(int offertaIdOfferta) {
		this.offertaIdOfferta = offertaIdOfferta;
	}

	public int getTutoreUniversitarioIdTutore() {
		return tutoreUniversitarioIdTutore;
	}

	public void setTutoreUniversitarioIdTutore(int tutoreUniversitarioIdTutore) {
		this.tutoreUniversitarioIdTutore = tutoreUniversitarioIdTutore;
	}

	public String getOffertaAziendaPartitaIvaCodiceFiscale() {
		return offertaAziendaPartitaIvaCodiceFiscale;
	}

	public void setOffertaAziendaPartitaIvaCodiceFiscale(String offertaAziendaPartitaIvaCodiceFiscale) {
		this.offertaAziendaPartitaIvaCodiceFiscale = offertaAziendaPartitaIvaCodiceFiscale;
	}

	public String getUtenteCodiceFiscale() {
		return utenteCodiceFiscale;
	}

	public void setUtenteCodiceFiscale(String utenteCodiceFiscale) {
		this.utenteCodiceFiscale = utenteCodiceFiscale;
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

}
