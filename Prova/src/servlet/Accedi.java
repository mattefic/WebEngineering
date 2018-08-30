package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
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
 * Servlet implementation class Login
 */
@WebServlet("/Accedi")
public class Accedi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Accedi() {
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
		} else {
			cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Win10\\git\\WebEngineering/Prova/src/"));
		}
		cfg.setIncompatibleImprovements(new Version(2, 3, 20));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setLocale(Locale.ITALIAN);
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		Template template = cfg.getTemplate("template/accedi.ftl");
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

		String email = request.getParameter("email");
		MessageDigest digest;
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		String password="";
		try {
			//TODO Fixare Charsets
			digest = MessageDigest.getInstance("SHA-256");
			byte[] encodedhash = digest.digest(request.getParameter("password").getBytes(StandardCharsets.UTF_8));
			password = new String(encodedhash, StandardCharsets.UTF_8);
			System.out.println(password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		// Carichiamo userid dal database se esiste l'utente
		
		//TODO Cambiare da Criteria a metodo classico con query
		Criteria criteriaUtente = session.createCriteria(Utente.class);
		Criteria criteriaAzienda = session.createCriteria(Azienda.class);
		criteriaUtente.add(Restrictions.eq("email", email));
		criteriaUtente.add(Restrictions.eq("password", password));

		criteriaAzienda.add(Restrictions.eq("email", email));
		criteriaAzienda.add(Restrictions.eq("password", password));

		Utente U = (Utente) criteriaUtente.uniqueResult();
		Azienda A = (Azienda) criteriaAzienda.uniqueResult();
		String userid;

		if (U != null) {
			userid = String.valueOf(U.getIdUtente());
			SecurityLayer.createSession(request, email, userid, U.getTipo());
			response.sendRedirect("Home");
		} else if (A != null) {
			userid = String.valueOf(A.getIdAzienda());
			SecurityLayer.createSession(request, email, userid, "azienda");
			response.sendRedirect("Home");
		} else {
			// Ritornare errore utente o password errati
		}
	}

}
