package model;

public class Offerta {

	private String luogo, obiettivi, modalità, rimborsiFacilitazioni, aziendaPartitaIvaCodiceFiscale;
	private int idOfferta, mesi, ore, orario;
	private boolean visibile;
	private Azienda azienda;

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

	public String getModalità() {
		return modalità;
	}

	public void setModalità(String modalità) {
		this.modalità = modalità;
	}

	public String getRimborsiFacilitazioni() {
		return rimborsiFacilitazioni;
	}

	public void setRimborsiFacilitazioni(String rimborsiFacilitazioni) {
		this.rimborsiFacilitazioni = rimborsiFacilitazioni;
	}

	public String getAziendaPartitaIvaCodiceFiscale() {
		return aziendaPartitaIvaCodiceFiscale;
	}

	public void setAziendaPartitaIvaCodiceFiscale(String aziendaPartitaIvaCodiceFiscale) {
		this.aziendaPartitaIvaCodiceFiscale = aziendaPartitaIvaCodiceFiscale;
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

	public int getOrario() {
		return orario;
	}

	public void setOrario(int orario) {
		this.orario = orario;
	}

	public Azienda getAzienda() {
		return azienda;
	}

	public void setAzienda(Azienda azienda) {
		this.azienda = azienda;
	}

}