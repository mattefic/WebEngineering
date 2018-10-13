package servlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import hibernate.HibernateSettings;
import model.Utente;
import security.SecurityLayer;

/**
 * Servlet implementation class PasswordDimenticata
 */
@WebServlet("/PasswordDimenticata")
public class PasswordDimenticata extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PasswordDimenticata() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
		Template template = cfg.getTemplate("template/passwordDimenticata.ftl");
		Map<String, Object> input = new HashMap<String, Object>();
		ServerStart serverData = new ServerStart();
		String tipo = "visitatore";
		if (SecurityLayer.checkSession(request) != null) {
			if (SecurityLayer.checkSession(request).getAttribute("tipo") != null) {
				tipo = (String) SecurityLayer.checkSession(request).getAttribute("tipo");
			}
		}
		int errore;
		if (request.getParameter("errore") != null) {
			errore = Integer.parseInt(request.getParameter("errore"));
		} else {
			errore = 0;
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
		String email = request.getParameter("email");

		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		Query<Utente> query = session.createQuery("FROM Utente where email = :email");
		query.setParameter("email", email);
		Utente utente = query.uniqueResult();

		if (utente != null) {

			// Genero il token
			Random r = new Random();
			int x;
			char c;
			String token = "";
			for (int i = 0; i < 18; i++) {
				x = r.nextInt(3);
				if (x == 0) {
					c = (char) ((int) 'A' + r.nextInt(26));
					token = token + c;
				} else if (x == 1) {
					x = r.nextInt(10);
					token = token + x;
				} else {
					c = (char) ((int) 'a' + r.nextInt(26));
					token = token + c;
				}
			}

			Query<Utente> querycheck = session.createQuery("FROM Utente where password = :token");
			querycheck.setParameter("token", token);
			Utente utentecheck = querycheck.uniqueResult();

			// Ciclo while nel caso in cui mettiamo colonna token.
			while (utentecheck != null) {
				// Rigenero il token
				token = "";
				for (int i = 0; i < 18; i++) {
					x = r.nextInt(3);
					if (x == 0) {
						c = (char) ((int) 'A' + r.nextInt(26));
						token = token + c;
					} else if (x == 1) {
						x = r.nextInt(10);
						token = token + x;
					} else {
						c = (char) ((int) 'a' + r.nextInt(26));
						token = token + c;
					}
				}
				Query<Utente> querycheck2 = session.createQuery("FROM Utente where password = :token");
				querycheck.setParameter("token", token);
				utentecheck = querycheck2.uniqueResult();
			}

			// Setto il token come password dell'utente
			utente.setPassword(org.apache.commons.codec.digest.DigestUtils.sha256Hex(token));
			session.persist(utente);

			// Scrivo email
			FileWriter w;
			Map<String, String> env = System.getenv();
			String path;
			if (env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
				path = "C:\\Users\\Matteo\\git\\repository/Prova/src/main/webapp/FileProgetto/PasswordDimenticata/PD"
						+ utente.getEmail() + ".txt";
			} else if (env.get("COMPUTERNAME").equals("Win10")) {
				path = "C:\\Users\\Win10\\git\\WebEngineering/Prova/src/main/webapp/FileProgetto/PasswordDimenticata/PD"
						+ utente.getEmail() + ".txt";
			} else {
				path = "C:\\Users\\Francesco Giostra\\git\\WebEngineering/Prova/src/main/webapp/FileProgetto/PasswordDimenticata/PD"
						+ utente.getEmail() + ".txt";
			}
			w = new FileWriter(path);
			BufferedWriter b;
			b = new BufferedWriter(w);
			b.write("Internship Tutor");
			b.newLine();
			b.write("Abbiamo ricevuto la tua richiesta");
			b.newLine();
			b.write("I tuoi nuovi dati di accesso sono");
			b.newLine();
			b.write("E-mail: " + utente.getEmail());
			b.newLine();
			b.write("Password: " + token);
			b.close();
			t.commit();
			session.close();
			response.sendRedirect("Accedi");
		} else {
			response.sendRedirect("PasswordDimenticata?errore=1");
		}
	}
}