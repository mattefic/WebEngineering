package servlet;

import java.io.File;
import java.io.FileWriter;
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
import org.hibernate.query.Query;

import com.lowagie.text.DocumentException;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import hibernate.HibernateSettings;
import model.Azienda;
import model.Contratto;
import model.Offerta;
import model.TutoreUniversitario;
import model.Utente;
import pdf.PDF;
import security.SecurityLayer;

/**
 * Servlet implementation class CompilaResoconto
 */
@WebServlet("/CompilaResoconto")
public class CompilaResoconto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CompilaResoconto() {
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
		input.put("menu", serverData.menu.get(tipo));

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
		Template template = cfg.getTemplate("template/compilaResoconto.ftl");
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
		response.setContentType("text/html;charset=UTF-8");
		HttpSession securitySession = SecurityLayer.checkSession(request);
		String tipo = (String) securitySession.getAttribute("tipo");
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}

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
		Template template = cfg.getTemplate("template/document/ProgettoFormativo/ProgettoFormativo5.ftl");

		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		String idContrattoString = request.getParameter("idContratto");
		Query query = session.createQuery("FROM Contratto WHERE idContratto = :idContratto");
		query.setParameter("idContratto", Integer.parseInt(request.getParameter("idContratto")));
		Contratto contract = (Contratto) query.uniqueResult();
		if (securitySession.getAttribute("userid").equals(contract.getIdAzienda())
				&& contract.getStatoFile().equals("precompilato")) {

			Map<String, Object> input = new HashMap<String, Object>();
			FileWriter w;
			String path;
			if (env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
				path = "C:\\Users\\Matteo\\git\\repository/Prova/src/main/webapp/FileProgetto/ProgettiFormativi/"
						+ idContrattoString;
			} else {
				path = "C:\\Users\\Win10\\git\\WebEngineering/Prova/src/main/webapp/FileProgetto/ProgettiFormativi/"
						+ idContrattoString;
			}
			w = new FileWriter(path + ".html");

			int idUtente = contract.getIdUtente();
			int idAzienda = contract.getIdAzienda();
			int idOfferta = contract.getIdOfferta();
			int idTutorU = contract.getIdTutoreUniversitario();

			Query queryU = session.createQuery("FROM Utente WHERE idUtente = :idUtente");
			queryU.setParameter("idUtente", idUtente);
			Utente U = (Utente) queryU.uniqueResult();

			Query queryA = session.createQuery("FROM Azienda WHERE idAzienda = :idAzienda");
			queryA.setParameter("idAzienda", idAzienda);
			Azienda A = (Azienda) queryA.uniqueResult();

			Query queryO = session.createQuery("FROM Offerta WHERE idOfferta = :idOfferta");
			queryO.setParameter("idOfferta", idOfferta);
			Offerta O = (Offerta) queryO.uniqueResult();

			Query queryTU = session.createQuery("FROM TutoreUniversitario WHERE idTutore = :idTutore");
			queryTU.setParameter("idTutore", idTutorU);
			TutoreUniversitario TU = (TutoreUniversitario) queryTU.uniqueResult();

			input.put("utente", U);
			input.put("azienda", A);
			input.put("offerta", O);
			input.put("tutorU", TU);
			input.put("contract", contract);
			input.put("ore", request.getParameter("ore"));
			input.put("descrizione", request.getParameter("descrizione"));
			input.put("giudizio", request.getParameter("giudizio"));

			try {
				template.process(input, w);
				w.flush();
				w.close();
			} catch (TemplateException e) {
				e.printStackTrace();
			}
			try {
				String inputFile = path + ".html";
				String outputFile = path + ".pdf";
				;
				PDF.generatePDF(inputFile, outputFile);

			} catch (DocumentException | com.itextpdf.text.DocumentException e) {
				e.printStackTrace();
			}
			contract.setStatoFile("compilato");
			session.persist(contract);
			t.commit();

			response.sendRedirect("ElencoTirocinanti");
		} else {
			response.sendRedirect("Home");
		}
	}

}
