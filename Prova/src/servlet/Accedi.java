package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import hibernate.HibernateSettings;
import model.Azienda;
import model.Utente;
import security.SecurityLayer;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Accedi")
public class Accedi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Accedi() {
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
		if(env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
		cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Matteo\\git\\repository/Prova/src/"));
		}
		else {
			cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Win10\\git\\WebEngineering/Prova/src/"));
		}
		cfg.setIncompatibleImprovements(new Version(2, 3, 20));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setLocale(Locale.ITALIAN);
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		Template template = cfg.getTemplate("template/accedi.ftl");
		try {
			template.process(null, response.getWriter());
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("Email");
		String password = request.getParameter("Password");
		
		// Carichiamo userid dal database se esiste l'utente
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if(sessionFactory != null) {
		
		} else {
				HibernateSettings settings = new HibernateSettings();
				sessionFactory = settings.getSessionFactory();
			}
		Session session = sessionFactory.openSession();
		Criteria criteriaUtente = session.createCriteria(Utente.class);
		Criteria criteriaAzienda = session.createCriteria(Azienda.class);
		criteriaUtente.add(Restrictions.eq("email", email));
		criteriaUtente.add(Restrictions.eq("password", password));
		criteriaUtente.add(Restrictions.eq("email", email));
		criteriaUtente.add(Restrictions.eq("password", password));
		Utente U = (Utente) criteriaUtente.uniqueResult();
		Azienda A = (Azienda) criteriaAzienda.uniqueResult();
		
		if(U != null) {
			String userid= U.getCodiceFiscale();
			SecurityLayer.createSession(request, email, userid);
			response.sendRedirect("Home");
		} 
		else if(A != null){
			String userid= A.getCodiceFiscaleIva();
			SecurityLayer.createSession(request, email, userid);
			response.sendRedirect("Home");
			}
		else {
			//Ritornare errore utente o password errati
			}
	}

}


