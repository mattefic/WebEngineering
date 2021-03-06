package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Time;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import hibernate.HibernateSettings;
import model.Azienda;
import model.Candidatura;
import model.Offerta;
import model.Utente;
import security.SecurityLayer;

/**
 * Servlet implementation class DettagliOffertaServlet
 */
@WebServlet("/DettagliOfferta")
public class DettagliOfferta extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DettagliOfferta() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession httpSession = SecurityLayer.checkSession(request);
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Map<String, Object> input = new HashMap<String, Object>();

		int id = Integer.parseInt(request.getParameter("idOfferta"));
		
			Query queryCand = session
					.createQuery("FROM Candidatura WHERE idOfferta = :idOfferta AND idUtente = :idUtente");
			queryCand.setParameter("idOfferta", id);
			queryCand.setParameter("idUtente", Integer.parseInt((String)httpSession.getAttribute("userid")));
			Candidatura candidatura = (Candidatura) queryCand.uniqueResult();

				Query query = session.createQuery("FROM Offerta o WHERE o.idOfferta = :idOfferta");
				query.setParameter("idOfferta", id);
				Offerta offerta = (Offerta) query.uniqueResult();
				input.put("offerta", offerta);
			
			Configuration cfg = new Configuration();
			Map<String, String> env = System.getenv();
			if (env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
				cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Matteo\\git\\repository/Prova/src/"));
			} else if (env.get("COMPUTERNAME").equals("Win10")) {
				cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Win10\\git\\WebEngineering/Prova/src/"));
			} else {
				cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Francesco Giostra\\git\\WebEngineering/Prova/src/"));
			}
			cfg.setIncompatibleImprovements(new Version(2, 3, 20));
			cfg.setDefaultEncoding("UTF-8");
			cfg.setLocale(Locale.ITALIAN);
			cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
			Template template = cfg.getTemplate("template/dettagliOfferta.ftl");
			ServerStart serverData = new ServerStart();
			String tipo = "visitatore";
			if (SecurityLayer.checkSession(request) != null) {
				if (SecurityLayer.checkSession(request).getAttribute("tipo") != null) {
					tipo = (String) SecurityLayer.checkSession(request).getAttribute("tipo");
				}
			}
			input.put("menu", serverData.menu.get(tipo));
			if(candidatura==null) {
			input.put("tipo", tipo);
			} else {
				input.put("tipo", "");
			}
			try {
				template.process(input, response.getWriter());
			} catch (TemplateException e) {
				e.printStackTrace();
			}			
		t.commit();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
