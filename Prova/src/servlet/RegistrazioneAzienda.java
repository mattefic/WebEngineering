package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.Arrays;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Configuration cfg = new Configuration();
		Map<String, String> env = System.getenv();
		if (env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
			cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Matteo\\git\\repository/Prova/src/"));
		} else if (env.get("COMPUTERNAME").equals("Win10")) {
			cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Win10\\git\\WebEngineering/Prova/src/"));
		} else {
			cfg.setDirectoryForTemplateLoading(
					new File("C:\\Users\\Francesco Giostra\\git\\WebEngineering/Prova/src/"));
		}
		cfg.setIncompatibleImprovements(new Version(2, 3, 20));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setLocale(Locale.ITALIAN);
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		Template template = cfg.getTemplate("template/registrazioneAzienda.ftl");
		Map<String, Object> input = new HashMap<String, Object>();
		ServerStart serverData = new ServerStart();
		String tipo = "visitatore";
		if (SecurityLayer.checkSession(request) != null) {
			if (SecurityLayer.checkSession(request).getAttribute("tipo") != null) {
				tipo = (String) SecurityLayer.checkSession(request).getAttribute("tipo");
			}
		}
		int errore;
		if(request.getParameter("errore")!=null) {
			errore= Integer.parseInt(request.getParameter("errore"));
		}
		else {
			errore=0;
		}
		input.put("errore", errore);
		input.put("menu", serverData.menu.get(tipo));
		try {
			template.process(input, response.getWriter());
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Criteria criteriaAzienda = session.createCriteria(Azienda.class);
		Criteria criteriaUtente = session.createCriteria(Utente.class);
		String PartitaIVA = request.getParameter("CF");
		String Email = request.getParameter("Email");
		String Password = request.getParameter("password");
		String Check = request.getParameter("check");
		criteriaAzienda.add(Restrictions.eq("codiceFiscaleIva", PartitaIVA));
		criteriaUtente.add(Restrictions.eq("email", Email));
		Azienda A = (Azienda) criteriaAzienda.uniqueResult();
		Utente U = (Utente) criteriaUtente.uniqueResult();

		if (PartitaIVA.length() != 11) {
			response.sendRedirect("RegistrazioneAzienda?errore=1");
		} else if (!Password.equals(Check)) {
			response.sendRedirect("RegistrazioneAzienda?errore=2");
		} else if (A != null) {
			response.sendRedirect("RegistrazioneAzienda?errore=3");
		} else if (U != null) {
			response.sendRedirect("RegistrazioneAzienda?errore=4");
		} else {
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
			e1.setConvenzionata(false);
			e1.setEmail(request.getParameter("Email"));
			String password = org.apache.commons.codec.digest.DigestUtils.sha256Hex(request.getParameter("password"));
			e1.setPassword(password);
			e1.setNumTirocinanti(0);
			e1.setValutazione(0);
			session.persist(e1);
			Query queryAzienda = session.createQuery("FROM Azienda a WHERE a.email= :email");
			queryAzienda.setParameter("email", request.getParameter("Email"));
			Azienda azienda = (Azienda) queryAzienda.uniqueResult();
			t.commit();
			
			SecurityLayer.createSession(request, request.getParameter("Email"), String.valueOf(azienda.getIdAzienda()),
					"azienda");
			response.sendRedirect("Home");

		}
		// doGet(request, response);
	}

}
