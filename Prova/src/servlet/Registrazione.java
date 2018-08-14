package servlet;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Locale;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import hibernate.HibernateSettings;
import model.Utente;

/**
 * Servlet implementation class ProvaServlet
 */
@WebServlet("/ProvaServlet")
public class Registrazione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registrazione() {
		super();
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
	}

	/**
	 * @see Servlet#getServletInfo()
	 */
	public String getServletInfo() {
		return null;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if(sessionFactory != null) {
	
		} else {
			HibernateSettings settings = new HibernateSettings();
			 sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
	Transaction t = session.beginTransaction();

		Utente e1 = new Utente();
		e1.setCodiceFiscale(request.getParameter("CF"));
		e1.setNome(request.getParameter("Nome"));
		e1.setCognome(request.getParameter("Cognome"));
		e1.setCorsoLaurea(request.getParameter("Corso"));
		e1.setDataNascita(Date.valueOf(request.getParameter("Data")));
		e1.setHandicap(false);
		if (request.getParameter("Handicap") != null) {
			e1.setHandicap(true);
		}
		e1.setResidenza(request.getParameter("Residenza"));
		e1.setTelefono(request.getParameter("Numero"));
		e1.setLuogoNascita(request.getParameter("LuogoNascita"));
		if (e1.getCodiceFiscale().length() == 16)
			session.persist(e1);

		t.commit();// transaction is committed

		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File("C:/Users/Matteo/eclipse-workspace/Prova/template"));
		cfg.setIncompatibleImprovements(new Version(2, 3, 20));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setLocale(Locale.ITALIAN);
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		Template template = cfg.getTemplate("home.ftl");
		try {
			template.process(null, response.getWriter());
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		// doGet(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletRequest response) {
		try {
			action_error(request, response);
		} finally {
		}

	}

	protected void action_error(HttpServletRequest request, HttpServletRequest response) {
		String message = "";
		Object ex = request.getAttribute("exception");
		if (ex instanceof Exception && ((Exception) ex).getMessage() != null
				&& !((Exception) ex).getMessage().isEmpty()) {
			message = ((Exception) ex).getMessage();
		} else {
			message = "Unknown Error";
		}
		((ServletResponse) response).setContentType("text/html;charset=UTF-8");
	}

}
