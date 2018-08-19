package servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import hibernate.HibernateSettings;
import model.Azienda;
import model.Utente;

/**
 * Servlet implementation class RegistrazioneAzienda
 */
@WebServlet("/RegistrazioneAzienda")
public class RegistrazioneAzienda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrazioneAzienda() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Configuration cfg = new Configuration();
		Map<String, String> env = System.getenv();
		if(env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
		cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Matteo\\git\\repository/Prova/src/"));
		}
		else {
			cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Win10\\git\\WebEngineering/Prova/src/"));
		}
		cfg.setIncompatibleImprovements(new Version(2, 3, 20));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setLocale(Locale.ITALIAN);
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		Template template = cfg.getTemplate("template/registrazioneAzienda.ftl");
		try {
			template.process(null, response.getWriter());
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO Francesco Programmare Registrazione Azienda
		//Consiglio: per storare i dati prendi esempio da Registrazione
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if(sessionFactory != null) {
	
		} else {
			HibernateSettings settings = new HibernateSettings();
			 sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Criteria criteriaAzienda= session.createCriteria(Azienda.class);
		String PartitaIVA = request.getParameter("CF");
		String Password = request.getParameter("password");
		String Check =request.getParameter("check");
		criteriaAzienda.add(Restrictions.eq("codiceFiscaleIva", PartitaIVA ));
		Azienda A = (Azienda) criteriaAzienda.uniqueResult();
		
		if(PartitaIVA.length()!=11) {
			//Ritornare errore partitaIVA inesistente
		}
		else if(Password.equals(Check)) {
			//Ritornare errore password non confermata
		}	
		else if(A!=null) {
			//Ritornare errore Azienda già registrata
		}
		else {
			Azienda e1 = new Azienda();
			e1.setCodiceFiscaleIva(request.getParameter("CF"));
			e1.setRagioneSocialeNome(request.getParameter("Nome"));
			e1.setIndirizzo(request.getParameter("Indirizzo"));
			e1.setForo(request.getParameter("Foro"));
			e1.setNomeLegale(request.getParameter("NomeLeg"));
			e1.setCognomeLegale(request.getParameter("CognomeLeg"));
			e1.setNomeRespTirocinio(request.getParameter("NomeResp"));
			e1.setCognomeRespTirocinio(request.getParameter("CognomeResp"));
			e1.setEmailRespTirocinio(request.getParameter("EmailResp"));
			e1.setTelefonoRespTirocinio(request.getParameter("TelResp"));
			
			Utente e2= new Utente();
			e2.setCodiceFiscale(request.getParameter("CF"));
			e2.setResidenza(request.getParameter("Indirizzo"));
			e2.setEmail(request.getParameter("EmailResp"));
			e2.setNome(request.getParameter("Nome"));
			e2.setTelefono(request.getParameter("TelResp"));
			e2.setCognome("-");
			e2.setLuogoNascita("-");
			Date data = new Date(0000,00,00);
			e2.setDataNascita(data);
			e2.setCorsoLaurea("-");
			e2.setHandicap(false);
			e2.setPassword(request.getParameter("password"));
			e2.setTipo("azienda");
			session.persist(e1);
			session.persist(e2);
		}
		
		t.commit();// transaction is committed
		Configuration cfg = new Configuration();
		Map<String, String> env = System.getenv();
		if(env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
		cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Matteo\\git\\repository/Prova/src/"));
		}
		else {
			cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Win10\\git\\WebEngineering/Prova/src/"));
		}
		cfg.setIncompatibleImprovements(new Version(2, 3, 20));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setLocale(Locale.ITALIAN);
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		Template template = cfg.getTemplate("template/home.ftl");
		try {
			template.process(null, response.getWriter());
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		// doGet(request, response);
	}
	
	//TODO aggiungere campo email per accesso; controllare che non ci sia una mail già creata da un utente
}
