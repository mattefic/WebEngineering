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
import model.Azienda;
import model.Offerta;

/**
 * Servlet implementation class DettagliOffertaServlet
 */
@WebServlet("/DettagliOfferta")
public class DettagliOfferta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DettagliOfferta() {
        super();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if(sessionFactory != null) {
	
		} else {
			HibernateSettings settings = new HibernateSettings();
			 sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
	Transaction t = session.beginTransaction();
		Map<String, Object> input = new HashMap<String, Object>();
		
		String id = request.getParameter("idOfferta");
		
		Query query = session.createQuery("FROM Offerta o WHERE o.idOfferta = 1");
		Offerta offerta = (Offerta) query.uniqueResult();
		input.put("offerta", offerta);
		Query query2 = session.createQuery("FROM Azienda a WHERE a.codiceFiscaleIva = "+ offerta.getAziendaPartitaIvaCodiceFiscale());
		Azienda azienda = (Azienda) query2.uniqueResult();
		input.put("azienda", azienda);
		System.out.println(offerta.getAziendaPartitaIvaCodiceFiscale());
		System.out.println(azienda.getCodiceFiscaleIva());
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\Matteo\\git\\repository/Prova/src/"));
		cfg.setIncompatibleImprovements(new Version(2, 3, 20));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setLocale(Locale.ITALIAN);
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		Template template = cfg.getTemplate("template/dettagliOfferta.ftl");
		try {
			template.process(input, response.getWriter());
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		t.commit();			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO Matteo Programmare la richiesta di candidatura a un'offerta
		doGet(request, response);
	}

}
