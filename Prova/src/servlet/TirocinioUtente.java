package servlet;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import hibernate.HibernateSettings;
import model.Azienda;
import model.Contratto;
import security.SecurityLayer;

/**
 * Servlet implementation class TirocinioUtente
 */
@WebServlet("/TirocinioUtente")
public class TirocinioUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TirocinioUtente() {
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
		ServerStart serverData = new ServerStart();
		String tipo = "visitatore";
		if (SecurityLayer.checkSession(request) != null) {
			if (SecurityLayer.checkSession(request).getAttribute("tipo") != null) {
				tipo = (String) SecurityLayer.checkSession(request).getAttribute("tipo");
			}
		}
		input.put("menu", serverData.menu.get(tipo));
		HttpSession httpSession = SecurityLayer.checkSession(request);
		Query query = session.createQuery("FROM Contratto WHERE idUtente = :idUtente");
		query.setParameter("idUtente", Integer.parseInt((String) httpSession.getAttribute("userid")));
		Contratto contract = (Contratto) query.uniqueResult();
		if (contract != null) {
			input.put("contratto", contract);
			input.put("votato", contract.isVotato());
			input.put("mancante", false);
		} else {
			input.put("mancante", true);
		}
		Template template = cfg.getTemplate("template/tirocinioUtente.ftl");
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
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		HttpSession httpSession = SecurityLayer.checkSession(request);
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("FROM Contratto WHERE idUtente = :idUtente");
		query.setParameter("idUtente", Integer.parseInt((String) httpSession.getAttribute("userid")));
		Contratto contract = (Contratto) query.uniqueResult();

		if (contract != null) {

			contract.setVotato(true);
			Query conto = session.createQuery("FROM Azienda WHERE idAzienda = :idAzienda");
			conto.setParameter("idAzienda", contract.getIdAzienda());
			Azienda azienda = (Azienda) conto.uniqueResult();
			float calcolo = azienda.getValutazione();
			int voto = Integer.parseInt(request.getParameter("voto"));
			azienda.setNumVoti(azienda.getNumVoti() + 1);
			int voti = azienda.getNumVoti();
			calcolo = ((calcolo * (voti - 1)) + voto) / voti;
			azienda.setValutazione(calcolo);
			session.persist(azienda);
			session.persist(contract);

		}
		t.commit();
		response.sendRedirect("TirocinioUtente");
	}

}
