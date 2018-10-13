package servlet;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
import security.SecurityLayer;

/**
 * Servlet implementation class CaricaConvenzioni
 */
@WebServlet("/CaricaConvenzioni")
@MultipartConfig
public class CaricaConvenzioni extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CaricaConvenzioni() {
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

		Query query = session.createQuery("FROM Azienda WHERE fileConvenzione='assente'");
		List<Azienda> aziende = query.list();
		for (Iterator iterator = aziende.iterator(); iterator.hasNext();) {
			Azienda azienda = (Azienda) iterator.next();
		}
		input.put("aziende", aziende);

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
		Template template = cfg.getTemplate("template/caricaConvenzioni.ftl");

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
		t.commit();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession httpSession = SecurityLayer.checkSession(request);

		Part idAziendaPart = request.getPart("name");
		Scanner s = new Scanner(idAziendaPart.getInputStream());
		String idAziendaString = s.nextLine();

		if (httpSession.getAttribute("tipo").equals("admin")) {

			SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
			if (sessionFactory != null) {

			} else {
				HibernateSettings settings = new HibernateSettings();
				sessionFactory = settings.getSessionFactory();
			}

			Map<String, String> env = System.getenv();

			String path;
			if (env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
				path = "C:\\Users\\Matteo\\git\\repository/Prova/src/main/webapp/FileProgetto/Convenzioni/";
			} else if (env.get("COMPUTERNAME").equals("Win10")) {
				path = "C:\\Users\\Win10\\git\\WebEngineering/Prova/src/main/webapp/FileProgetto/Convenzioni/";
			} else {
				path = "C:\\Users\\Francesco Giostra\\git\\WebEngineering/Prova/src/main/webapp/FileProgetto/Convenzioni/";
			}

			Session session = sessionFactory.openSession();
			Transaction t = session.beginTransaction();

			Query query = session.createQuery("FROM Azienda WHERE idAzienda = :idAzienda ");
			query.setParameter("idAzienda", Integer.parseInt(idAziendaString));
			Azienda azienda = (Azienda) query.uniqueResult();

			azienda.setFileConvenzione("FileProgetto/Convenzioni/" + idAziendaString + ".pdf");
			azienda.setConvenzionata(true);
			session.persist(azienda);

			t.commit();
			Part part = request.getPart("convenzione");
			part.write(path + idAziendaString + ".pdf");
			response.sendRedirect("CaricaConvenzioni");
		}else {
			response.sendRedirect("Home");
		}

	}
}
