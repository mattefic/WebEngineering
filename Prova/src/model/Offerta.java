package model;

public class Offerta {

	private String luogo, obiettivi, modalità, rimborsiFacilitazioni, orario;
	private int idAzienda, idOfferta, mesi, ore;
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
		this.modalità= modalità;
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

}