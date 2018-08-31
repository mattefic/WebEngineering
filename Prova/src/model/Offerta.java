package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Offerta {

	private String luogo, obiettivi, modalita, rimborsiFacilitazioni, orario, titolo, settore, descrizione;
	private int idAzienda, idOfferta, mesi, ore;
	private boolean visibile;
	private Date dataPub;
	private Azienda azienda;
	private List<Candidatura> candidature = new ArrayList<Candidatura>();

	public Offerta() {

	}

	public String getLuogo() {
		return luogo;
	}

	public void setLuogo(String luogo) {
		this.luogo = luogo;
	}

	public String getObiettivi() {
		return obiettivi;
	}

	public void setObiettivi(String obiettivi) {
		this.obiettivi = obiettivi;
	}

	public String getModalita() {
		return modalita;
	}

	public void setModalita(String modalita) {
		this.modalita = modalita;
	}

	public String getRimborsiFacilitazioni() {
		return rimborsiFacilitazioni;
	}

	public void setRimborsiFacilitazioni(String rimborsiFacilitazioni) {
		this.rimborsiFacilitazioni = rimborsiFacilitazioni;
	}

	public int getIdOfferta() {
		return idOfferta;
	}

	public void setIdOfferta(int idOfferta) {
		this.idOfferta = idOfferta;
	}

	public int getMesi() {
		return mesi;
	}

	public void setMesi(int mesi) {
		this.mesi = mesi;
	}

	public int getOre() {
		return ore;
	}

	public void setOre(int ore) {
		this.ore = ore;
	}

	public boolean isVisibile() {
		return visibile;
	}

	public void setVisibile(boolean visibile) {
		this.visibile = visibile;
	}

	public String getOrario() {
		return orario;
	}

	public void setOrario(String string) {
		this.orario = string;
	}

	public Azienda getAzienda() {
		return azienda;
	}

	public void setAzienda(Azienda azienda) {
		this.azienda = azienda;
	}

	public int getIdAzienda() {
		return idAzienda;
	}

	public void setIdAzienda(int idAzienda) {
		this.idAzienda = idAzienda;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getSettore() {
		return settore;
	}

	public void setSettore(String settore) {
		this.settore = settore;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public Date getDataPub() {
		return dataPub;
	}

	public void setDataPub(Date dataPub) {
		this.dataPub = dataPub;
	}

	public List<Candidatura> getCandidature() {
		return candidature;
	}

	public void setCandidature(List<Candidatura> candidature) {
		this.candidature = candidature;
	}
}