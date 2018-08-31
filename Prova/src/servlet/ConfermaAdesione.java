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
import model.Offerta;
import model.TutoreUniversitario;
import security.SecurityLayer;

/**
 * Servlet implementation class ConfermaAdesione
 */
@WebServlet("/ConfermaAdesione")
public class ConfermaAdesione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConfermaAdesione() {
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
		Template template = cfg.getTemplate("template/confermaAdesione.ftl");

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
		Query query = session.createQuery("FROM Offerta o WHERE o.idOfferta = :idOfferta");
		query.setParameter("idOfferta", id);
		Offerta offerta = (Offerta) query.uniqueResult();
		t.commit();

		input.put("offerta", offerta);

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
		response.setContentType("text/html;charset=UTF-8");
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Date data = new Date();
		int idOfferta = Integer.parseInt(request.getParameter("idOfferta"));
		Query query = session.createQuery("FROM Offerta WHERE idOfferta = :idOfferta");
		query.setParameter("idOfferta", idOfferta);
		Offerta offerta = (Offerta) query.uniqueResult();
		Candidatura candidatura = new Candidatura();
		candidatura.setDataCandidatura(data);
		candidatura.setStato("attesa");
		int idUtente = Integer.parseInt((String) httpSession.getAttribute("userid"));
		candidatura.setIdUtente(idUtente);
		candidatura.setIdOfferta(idOfferta);
		candidatura.setIdAzienda(offerta.getIdAzienda());
		candidatura.setCfu(Integer.parseInt(request.getParameter("CFU")));

		Query queryTutore = session.createQuery("FROM Tutore WHERE telefono = :telefono");
		queryTutore.setParameter("telefono", request.getAttribute("telefono"));
		TutoreUniversitario tutore = (TutoreUniversitario) query.uniqueResult();

		if (tutore == null) {
			tutore = new TutoreUniversitario();
			tutore.setNome(request.getParameter("nome"));
			tutore.setCognome(request.getParameter("cognome"));
			tutore.setTelefono(request.getParameter("telefono"));
			session.persist(tutore);
		}
		t.commit();
		tutore = (TutoreUniversitario) query.uniqueResult();
		
		t = session.beginTransaction();
		candidatura.setIdTutore(tutore.getIdTutore());
		session.persist(candidatura);
		t.commit();

		response.sendRedirect("Home");
		doGet(request, response);
	}

}
