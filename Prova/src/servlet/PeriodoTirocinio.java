package servlet;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
import model.Azienda;
import model.Contratto;
import model.Offerta;
import model.TutoreAziendale;
import model.TutoreUniversitario;
import model.Utente;
import security.SecurityLayer;

/**
 * Servlet implementation class PeriodoTirocinio
 */
@WebServlet("/PeriodoTirocinio")
public class PeriodoTirocinio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeriodoTirocinio() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		Template template = cfg.getTemplate("template/periodoTirocinio.ftl");
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession securitySession = SecurityLayer.checkSession(request);
		String tipo = (String) securitySession.getAttribute("tipo");
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		if (tipo.equals("azienda")) {
        	
			DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd") ;
			String date = request.getParameter("dataInizio");
			LocalDate localDate = LocalDate.parse(date, format);
			String date2 = request.getParameter("dataFine");
			LocalDate localDate2 = LocalDate.parse(date2, format);
			Date dataInizio=Date.valueOf(localDate);
			Date dataFine=Date.valueOf(localDate2);
		
			Query query = session.createQuery("FROM Contratto WHERE idContratto = :idContratto");
			query.setParameter("idContratto", Integer.parseInt(request.getParameter("idContratto")));
			Contratto contract = (Contratto) query.uniqueResult();
			contract.setDataInizio(dataInizio);
			contract.setDataFine(dataFine);
			session.persist(contract);
        	t.commit();

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
    		Template template = cfg.getTemplate("template/document/ProgettoFormativo/ProgettoFormativo.ftl");
    		Map<String, Object> input = new HashMap<String, Object>();
    		FileWriter w;
			w=new FileWriter("ProgettoFormativo"+request.getParameter("idContratto")+".html");
			int idUtente = contract.getIdUtente();
			int idAzienda = contract.getIdAzienda();
			int idOfferta = contract.getIdOfferta();
			int idTutorU = contract.getIdTutoreUniversitario();
			int idTutorA = contract.getIdTutoreAziendale();
			
			Query queryU = session.createQuery("FROM Utente WHERE idUtente = :idUtente");
			queryU.setParameter("idUtente", idUtente);
			Utente U = (Utente) queryU.uniqueResult();
			
			Query queryA = session.createQuery("FROM Azienda WHERE idAzienda = :idAzienda");
			queryA.setParameter("idAzienda", idAzienda);
			Azienda A = (Azienda) queryA.uniqueResult();
			
			Query queryO = session.createQuery("FROM Offerta WHERE idOfferta = :idOfferta");
			queryO.setParameter("idOfferta", idOfferta);
			Offerta O = (Offerta) queryO.uniqueResult();
			
			Query queryTA = session.createQuery("FROM TutoreAziendale WHERE idTutore = :idTutore");
			queryTA.setParameter("idTutore", idTutorA);
			TutoreAziendale TA = (TutoreAziendale) queryTA.uniqueResult();
			
			Query queryTU = session.createQuery("FROM TutoreUniversitario WHERE idTutore = :idTutore");
			queryTU.setParameter("idTutore", idTutorU);
			TutoreUniversitario TU = (TutoreUniversitario) queryU.uniqueResult();
			
			input.put("utente", U);
			input.put("azienda", A);
			input.put("offerta", O);
			input.put("tutorA", TA);
			input.put("tutorU", TU);
			input.put("contract", contract);
			
    		try {
				template.process(input, w);
			} catch (TemplateException e) {
				e.printStackTrace();
			}
        	//TODO Convertire il file da html a pdf e salvarlo
			response.sendRedirect("ElencoTirocinanti");
			
		}
		else {
			
		}
		doGet(request, response);
	}

}
