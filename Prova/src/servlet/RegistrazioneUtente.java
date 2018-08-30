package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.query.Query;
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
import security.SecurityLayer;

/**
 * Servlet implementation class RegistrazioneUtente
 */
@WebServlet("/RegistrazioneUtente")
public class RegistrazioneUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrazioneUtente() {
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
		Template template = cfg.getTemplate("template/registrazioneUtente.ftl");
		Map<String, Object> input = new HashMap<String, Object>();
		ServerStart serverData = new ServerStart();
		String tipo = "visitatore";
		if (SecurityLayer.checkSession(request) != null) {
			if (SecurityLayer.checkSession(request).getAttribute("tipo") != null) {
				tipo = (String) SecurityLayer.checkSession(request).getAttribute("tipo");
			}
		}
		input.put("menu", serverData.menu.get(tipo));
		try {
			template.process(input , response.getWriter());
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if(sessionFactory != null) {
	
		} else {
			HibernateSettings settings = new HibernateSettings();
			 sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		Criteria criteriaUtente= session.createCriteria(Utente.class);
		criteriaUtente.add(Restrictions.eq("codiceFiscale", request.getParameter("CF")));
		Utente U = (Utente) criteriaUtente.uniqueResult();
		
		if(U!=null) {
			//Ritornare errore utente già esistente
		}
		else if(!request.getParameter("password").equals(request.getParameter("check"))) {
			//Ritornare errore password non confermata
		}
		else if(request.getParameter("CF").length()!=16) {
			//Ritornare errore codice fiscale inesistente
		}
		else {
			MessageDigest digest;
			Utente e1 = new Utente();
			e1.setCodiceFiscale(request.getParameter("CF"));
			e1.setNome(request.getParameter("Nome"));
			e1.setCognome(request.getParameter("Cognome"));
			e1.setCorsoLaurea(request.getParameter("Corso"));
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        	String date = request.getParameter("Data");
        	LocalDate localDate = LocalDate.parse(date, formatter);
			e1.setDataNascita(Date.valueOf(localDate));
			e1.setHandicap(false);
			if (request.getParameter("Handicap") != null) {
				e1.setHandicap(true);
			}
			e1.setResidenza(request.getParameter("Residenza"));
			e1.setTelefono(request.getParameter("Numero"));
			e1.setLuogoNascita(request.getParameter("LuogoNascita"));
			e1.setEmail(request.getParameter("email"));
			try {
				//TODO Fixare Charsets
				digest = MessageDigest.getInstance("SHA-256");
				byte[] encodedhash = digest.digest(request.getParameter("password").getBytes(StandardCharsets.UTF_8));
				String password = new String(encodedhash, StandardCharsets.UTF_8);
				System.out.println(password);
				e1.setPassword(password);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			e1.setTipo("utente");
			session.persist(e1);
			Query query = session.createQuery("FROM Utente WHERE codiceFiscale = :CF");
			query.setParameter("CF", request.getParameter("CF"));
			Utente utente = (Utente) query.uniqueResult();
			SecurityLayer.createSession(request, request.getParameter("email"), String.valueOf(utente.getIdUtente()), "utente");
			response.sendRedirect("Home");
		}
		tx.commit();
		// doGet(request, response);
	}

}
