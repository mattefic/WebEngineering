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
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Map<String, Object> input = new HashMap<String, Object>();

		String id = request.getParameter("idOfferta");

		Query query = session.createQuery("FROM Offerta o WHERE o.idOfferta = 1");
		Offerta offerta = (Offerta) query.uniqueResult();
		input.put("offerta", offerta);
		Query query2 = session.createQuery(
				"FROM Azienda a WHERE a.codiceFiscaleIva = " + offerta.getIdAzienda());
		Azienda azienda = (Azienda) query2.uniqueResult();
		input.put("azienda", azienda);
		System.out.println(offerta.getIdAzienda());
		System.out.println(azienda.getCodiceFiscaleIva());

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
		Template template = cfg.getTemplate("template/dettagliOfferta.ftl");
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
		HttpSession Securitysession = SecurityLayer.checkSession(request);
		String email = Securitysession.getId();
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
		Candidatura candidatura = new Candidatura();
		candidatura.setDataCanditatura(data);
		candidatura.setStato("attesa");
		//TODO cercare tramite email per settare l'idUtente
		int idUtente = 0;
		candidatura.setIdUtente(idUtente);
		candidatura.setIdOfferta(Integer.parseInt(request.getParameter("idOfferta")));

		session.persist(candidatura);

		response.sendRedirect("Home");
	}

}
