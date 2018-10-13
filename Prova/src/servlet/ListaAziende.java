package servlet;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import security.SecurityLayer;

/**
 * Servlet implementation class ListaAziendeServlet
 */
@WebServlet("/ListaAziende")
public class ListaAziende extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListaAziende() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if(sessionFactory != null) {
	
		} else {
			HibernateSettings settings = new HibernateSettings();
			 sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
	
		Map<String, Object> input = new HashMap<String, Object>();
		
		String query="FROM Azienda WHERE convenzionata=1 ";
		String query2="FROM Azienda WHERE convenzionata=1 ";
		
		if(request.getParameter("ragioneSociale")!=null) {
			if(request.getParameter("ragioneSociale")!="") {
				query=query+"AND idAzienda= :idAzienda ";
				
			}
		}
		if(request.getParameter("foro")!=null) {	
			if(request.getParameter("foro")!="") {
				query=query+"AND foro= :foro";
			}
		}
		
		Query queryA = session.createQuery(query);
		Query queryB = session.createQuery(query2);
		if(request.getParameter("ragioneSociale")!=null) {
			if(request.getParameter("ragioneSociale")!="") {
				queryA.setParameter("idAzienda", Integer.parseInt((String) request.getParameter("ragioneSociale")));
			}
		}
		
		if(request.getParameter("foro")!=null) {	
			if(request.getParameter("foro")!="") {
				queryA.setParameter("foro", request.getParameter("foro"));
			}
		}
		
		List<Azienda> aziendeRicerca= queryB.list();
		List<Azienda> aziende = queryA.list();
		input.put("aziende", aziende);
		input.put("aziendeRicerca", aziendeRicerca);
		List<String> fori = new ArrayList<String>();
		for(Azienda azienda : aziendeRicerca) {
			if(!fori.contains(azienda.getForo())){
				fori.add(azienda.getForo());
			}
		}
		fori.sort(null);
		input.put("fori", fori);
		
		Configuration cfg = new Configuration();
		Map<String, String> env = System.getenv();
		if(env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
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
		Template template = cfg.getTemplate("template/listaAzienda.ftl");
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
