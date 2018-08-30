package model;

public class Azienda {

	private String codiceFiscaleIva, ragioneSocialeNome, indirizzo, nomeLegale, cognomeLegale, foro, nomeRespTirocinio,
			cognomeRespTirocinio, emailRespTirocinio, telefonoRespTirocinio, orario, email, password, fileConvenzione;
	private boolean convenzionata;
	private int idAzienda, numTirocinanti, numVoti;
	private float valutazione; //da 1 a 5
	public Azienda() {

	}

	public String getCodiceFiscaleIva() {
		return codiceFiscaleIva;
	}

	public void setCodiceFiscaleIva(String codiceFiscaleIva) {
		this.codiceFiscaleIva = codiceFiscaleIva;
	}

	public String getRagioneSocialeNome() {
		return ragioneSocialeNome;
	}

	public void setRagioneSocialeNome(String ragioneSocialeNome) {
		this.ragioneSocialeNome = ragioneSocialeNome;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getNomeLegale() {
		return nomeLegale;
	}

	public void setNomeLegale(String nomeLegale) {
		this.nomeLegale = nomeLegale;
	}

	public String getCognomeLegale() {
		return cognomeLegale;
	}

	public void setCognomeLegale(String cognomeLegale) {
		this.cognomeLegale = cognomeLegale;
	}

	public String getForo() {
		return foro;
	}

	public void setForo(String foro) {
		this.foro = foro;
	}

	public String getNomeRespTirocinio() {
		return nomeRespTirocinio;
	}

	public void setNomeRespTirocinio(String nomeRespTirocinio) {
		this.nomeRespTirocinio = nomeRespTirocinio;
	}

	public String getCognomeRespTirocinio() {
		return cognomeRespTirocinio;
	}

	public void setCognomeRespTirocinio(String cognomeRespTirocinio) {
		this.cognomeRespTirocinio = cognomeRespTirocinio;
	}

	public String getTelefonoRespTirocinio() {
		return telefonoRespTirocinio;
	}

	public void setTelefonoRespTirocinio(String telefonoRespTirocinio) {
		this.telefonoRespTirocinio = telefonoRespTirocinio;
	}

	public String getEmailRespTirocinio() {
		return emailRespTirocinio;
	}

	public void setEmailRespTirocinio(String emailRespTirocinio) {
		this.emailRespTirocinio = emailRespTirocinio;
	}

	public boolean isConvenzionata() {
		return convenzionata;
	}

	public void setConvenzionata(boolean convenzionata) {
		this.convenzionata = convenzionata;
	}

	public String getOrario() {
		return orario;
	}

	public void setOrario(String orario) {
		this.orario = orario;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getIdAzienda() {
		return idAzienda;
	}

	public void setIdAzienda(int idAzienda) {
		this.idAzienda = idAzienda;
	}

	public float getValutazione() {
		return valutazione;
	}

	public void setValutazione(float valutazione) {
		this.valutazione = valutazione;
	}

	public int getNumTirocinanti() {
		return numTirocinanti;
	}

	public void setNumTirocinanti(int numTirocinanti) {
		this.numTirocinanti = numTirocinanti;
	}

	public String getFileConvenzione() {
		return fileConvenzione;
	}

	public void setFileConvenzione(String fileConvenzione) {
		this.fileConvenzione = fileConvenzione;
	}

	public int getNumVoti() {
		return numVoti;
	}

	public void setNumVoti(int numVoti) {
		this.numVoti = numVoti;
	}

}