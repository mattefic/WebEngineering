package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
import model.Contratto;
import model.Offerta;
import security.SecurityLayer;

/**
 * Servlet implementation class ElencoTirocinanti
 */
@WebServlet("/ElencoTirocinanti")
@MultipartConfig
public class ElencoTirocinanti extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ElencoTirocinanti() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		Map<String, Object> input = new HashMap<String, Object>();

		ServerStart serverData = new ServerStart();
		String tipo = "visitatore";
		if (SecurityLayer.checkSession(request) != null) {
			if (SecurityLayer.checkSession(request).getAttribute("tipo") != null) {
				tipo = (String) SecurityLayer.checkSession(request).getAttribute("tipo");
			}
		}
		HttpSession httpSession = SecurityLayer.checkSession(request);
		input.put("menu", serverData.menu.get(tipo));

		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}

		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		List<Contratto> contratti = new ArrayList();

		if (tipo.equals("azienda")) {
			Query query = session.createQuery("FROM Contratto WHERE idAzienda = :idAzienda");
			query.setParameter("idAzienda", Integer.parseInt((String) httpSession.getAttribute("userid")));
			contratti = query.list();
		}
		input.put("contratti", contratti);

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
		Template template = cfg.getTemplate("template/elencoTirocinanti.ftl");
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

		Part idContrattoPart = request.getPart("id");
		Scanner s = new Scanner(idContrattoPart.getInputStream());
		String idContrattoString = s.nextLine();
		if (httpSession.getAttribute("tipo").equals("azienda")) {

			SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
			if (sessionFactory != null) {

			} else {
				HibernateSettings settings = new HibernateSettings();
				sessionFactory = settings.getSessionFactory();
			}
			Session session = sessionFactory.openSession();
			Transaction t = session.beginTransaction();

			Query query = session
					.createQuery("FROM Contratto WHERE idContratto = :idContratto AND idAzienda = :idAzienda ");
			query.setParameter("idContratto", Integer.parseInt(idContrattoString));
			query.setParameter("idAzienda", Integer.parseInt((String) httpSession.getAttribute("userid")));
			Contratto contratto = (Contratto) query.uniqueResult();
			Map<String, String> env = System.getenv();
			if (contratto != null) {
				String path;
				if (env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
					path = "C:\\Users\\Matteo\\git\\repository/Prova/src/main/webapp/FileProgetto/ProgettiFormativi/"
							+ idContrattoString + ".pdf";

				} else if (env.get("COMPUTERNAME").equals("Win10")) {
					path = "C:\\Users\\Win10\\git\\WebEngineering/Prova/src/main/webapp/FileProgetto/ProgettiFormativi/"
							+ idContrattoString + ".pdf";
				} else {
					path = "C:\\Users\\Francesco Giostra\\git\\WebEngineering/Prova/src/main/webapp/FileProgetto/ProgettiFormativi/"
							+ idContrattoString + ".pdf";
				}

				String percorso = "FileProgetto/ProgettiFormativi/" + idContrattoString + ".pdf";
				contratto.setPercorso(percorso);
				contratto.setStatoFile("caricato");
				session.persist(contratto);

				t.commit();
				Part part = request.getPart("progetto");
				part.write(path);

			}
		}
		doGet(request, response);
	}

}
