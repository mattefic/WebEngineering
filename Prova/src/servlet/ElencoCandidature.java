package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Calendar;
import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
import model.TutoreUniversitario;
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
		String stato="attesa";
		Query query = session.createQuery("FROM Candidatura WHERE idAzienda = :idAzienda AND stato= :stato");
		query.setParameter("idAzienda", Integer.parseInt((String)httpSession.getAttribute("userid")));
		query.setParameter("stato", stato);
		List<Candidatura> candidature = query.list();
		query = session.createQuery("FROM Offerta WHERE idAzienda = :idAzienda");
		query.setParameter("idAzienda", Integer.parseInt((String)httpSession.getAttribute("userid")));
		List<Offerta> offerte = query.list();
		for (Candidatura candidatura : candidature) {
			for (Offerta offerta : offerte) {
				if (candidatura.getIdOfferta() == offerta.getIdOfferta()) {
					offerta.getCandidature().add(candidatura);
				}
			}
		}
		input.put("offerte", offerte);
		t.commit();

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpSession = SecurityLayer.checkSession(request);
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		
		int idCandidatura = Integer.parseInt((String) request.getParameter("candidatura"));
		
		
		if (httpSession.getAttribute("tipo").equals("azienda")) {
			Query query = session.createQuery("FROM Candidatura c WHERE c.idCandidatura = :idCandidatura");
			query.setParameter("idCandidatura", idCandidatura);
			Candidatura candidatura = (Candidatura) query.uniqueResult();
			if (request.getParameter("check").equals("1")) {
				// Accetta
				
				int idOfferta = candidatura.getIdOfferta();
				Query queryOfferta = session.createQuery("FROM Offerta o WHERE o.idAzienda = :idAzienda and o.idOfferta = :idOfferta");
				queryOfferta.setParameter("idAzienda", Integer.parseInt((String)httpSession.getAttribute("userid")));
				queryOfferta.setParameter("idOfferta", idOfferta);
				Offerta offerta = (Offerta) queryOfferta.uniqueResult();
				if (offerta != null) {
					Date oggi = new Date(Calendar.getInstance().getTime().getTime());
					Contratto contratto = new Contratto();
					contratto.setIdOfferta(offerta.getIdOfferta());
					contratto.setIdAzienda(Integer.parseInt((String)httpSession.getAttribute("userid")));
					contratto.setIdTutoreAziendale(candidatura.getIdTutoreAziendale());
					contratto.setIdTutoreUniversitario(candidatura.getIdTutoreUniversitario());
					contratto.setIdUtente(candidatura.getIdUtente());
					contratto.setDataAccettazione(oggi);
					contratto.setCfu(candidatura.getCfu());
					
					
					String stato="accettata";
					Query query2 = session.createQuery("UPDATE Candidatura set stato= :stato WHERE idCandidatura = :idCandidatura");
					query2.setParameter("idCandidatura", idCandidatura);
					query2.setParameter("stato", stato);
					query2.executeUpdate();
					
					session.persist(contratto);
					t.commit();
					
					t= session.beginTransaction();
					Query query3 = session.createQuery("FROM Contratto WHERE idUtente = :idUtente");
					query3.setParameter("idUtente", candidatura.getIdUtente());
					Contratto contract = (Contratto) query3.uniqueResult(); 
					response.sendRedirect("PeriodoTirocinio?idContratto="+contract.getIdContratto());
					t.commit();

				}
			
			} else {
				// Rifiuta
				String stato="rifiuata";
				Query query2 = session.createQuery("UPDATE Candidatura set stato= :stato WHERE idCandidatura = :idCandidatura");
				query2.setParameter("idCandidatura", idCandidatura);
				query2.setParameter("stato", stato);
				query2.executeUpdate();
				response.sendRedirect("ElencoCandidature");
				t.commit();
			}
			
		}
	}

}
