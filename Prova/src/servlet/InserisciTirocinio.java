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

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import hibernate.HibernateSettings;
import model.Offerta;
import security.SecurityLayer;

/**
 * Servlet implementation class InserisciTirocinio
 */
@WebServlet("/InserisciTirocinio")
public class InserisciTirocinio extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InserisciTirocinio() {
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
		} else {
			cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Win10\\git\\WebEngineering/Prova/src/"));
		}
		cfg.setIncompatibleImprovements(new Version(2, 3, 20));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setLocale(Locale.ITALIAN);
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		Template template = cfg.getTemplate("template/inserisciTirocinio.ftl");
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
		if (httpSession.getAttribute("tipo").equals("azienda")) {
			Offerta offerta = new Offerta();
			offerta.setIdAzienda(Integer.parseInt((String) httpSession.getAttribute("id")));
			offerta.setLuogo(request.getParameter("luogo"));
			offerta.setMesi(Integer.parseInt((String) request.getParameter("mesi")));
			offerta.setModalità(request.getParameter("modalità"));
			offerta.setObiettivi(request.getParameter("obiettivi"));
			offerta.setOrario(request.getParameter("orario"));
			offerta.setRimborsiFacilitazioni(request.getParameter("luogo"));
			offerta.setOre(Integer.parseInt((String) request.getParameter("ore")));
			offerta.setVisibile(true);

			SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
			if (sessionFactory != null) {

			} else {
				HibernateSettings settings = new HibernateSettings();
				sessionFactory = settings.getSessionFactory();
			}
			Session session = sessionFactory.openSession();
			Transaction t = session.beginTransaction();

			session.persist(offerta);
			t.commit();

		}
	}

}
