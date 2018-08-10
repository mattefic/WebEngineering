package servlet;

import java.io.File;
import java.io.IOException;
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
import model.TutoreUniversitario;

/**
 * Servlet implementation class ClassificaTutori
 */
@WebServlet("/ClassificaTutori")
public class ClassificaTutori extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ClassificaTutori() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if(sessionFactory != null) {
	
		} else {
			HibernateSettings settings = new HibernateSettings();
			 sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
	Transaction t = session.beginTransaction();

		Map<String, Object> input = new HashMap<String, Object>();

		Query query = session.createQuery("FROM TutoreUniversitario t ORDER BY t.numRichieste");
		List<TutoreUniversitario> tutori = query.list();
		for (Iterator iterator = tutori.iterator(); iterator.hasNext();) {
			TutoreUniversitario tutore = (TutoreUniversitario) iterator.next();
		}
		input.put("tutori", tutori);

		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File("C:/Users/Matteo/eclipse-workspace/Prova/template"));
		cfg.setIncompatibleImprovements(new Version(2, 3, 20));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setLocale(Locale.ITALIAN);
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		Template template = cfg.getTemplate("ClassificaTutori.ftl");
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
