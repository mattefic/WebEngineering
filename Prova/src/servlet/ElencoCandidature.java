package servlet;
//TODO Francesco rendere dinamico ftl e riempirlo
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
import model.Candidatura;
import model.Contratto;
import model.Offerta;
import security.SecurityLayer;

/**
 * Servlet implementation class ElencoCandidature
 */
@WebServlet("/ElencoCandidature")
public class ElencoCandidature extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ElencoCandidature() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//TODO Ricavare elenco candidature per l'azienda
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
		Template template = cfg.getTemplate("template/elencoCandidature.ftl");
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
		HttpSession httpSession = SecurityLayer.checkSession(request);
		int idAzienda = Integer.parseInt((String) httpSession.getAttribute("userid"));
		int idCandidatura = Integer.parseInt((String) request.getParameter("candidatura"));
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		if (httpSession.getAttribute("tipo").equals("azienda")) {
			if (request.getParameter("accetta").equals("accetta")) {
				// Accetta
				Query query = session.createQuery("FROM Candidatura c WHERE c.idCandidatura = :idCandidatura");
				query.setParameter("idCandidatura", idCandidatura);
				Candidatura candidatura = (Candidatura) query.uniqueResult();
				int idOfferta = candidatura.getIdOfferta();
				Query queryOfferta = session.createQuery("FROM Offerta o WHERE o.idAzienda = :idAzienda and o.idOfferta = :idOfferta");
				queryOfferta.setParameter("idAzienda", httpSession.getAttribute("iduser"));
				queryOfferta.setParameter("idOfferta", idOfferta);
				Offerta offerta = (Offerta) queryOfferta.uniqueResult();
				if (offerta != null) {
					session.delete(candidatura);
					Contratto contratto = new Contratto();
					contratto.setIdOfferta(offerta.getIdOfferta());
					contratto.setIdTutoreAziendale(candidatura.getIdTutore());
					contratto.setIdTutoreUniversitario(candidatura.getIdTutore());
					contratto.setIdUtente(candidatura.getIdUtente());
					contratto.setDataAccettazione(new Date());
				}
			} else {
				// Rifiuta
				Query query = session.createQuery("FROM Candidatura c WHERE c.idCandidatura = :idCandidatura");
				query.setParameter("idCandidatura", idCandidatura);
				Candidatura candidatura = (Candidatura) query.uniqueResult();
				session.delete(candidatura);

			}
		}
	}

}
