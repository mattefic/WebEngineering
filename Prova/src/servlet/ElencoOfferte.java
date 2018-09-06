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
import model.Offerta;
import security.SecurityLayer;

/**
 * Servlet implementation class ListaOfferte
 */
@WebServlet("/ElencoOfferte")
public class ElencoOfferte extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ElencoOfferte() {
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
		
		String queryRicerca="FROM Offerta WHERE visibile=1 ";
		int check=0;
		
		if(request.getParameter("azienda")!=null) {
			if(request.getParameter("azienda")!="") {
				if(check!=0) {
					queryRicerca= queryRicerca+"AND idAzienda= :idAzienda ";
				}
				else {
					queryRicerca= queryRicerca+"WHERE idAzienda= :idAzienda ";
					check=1;
				}
			}
		}
		if(request.getParameter("luogo")!=null) {
			if(request.getParameter("luogo")!="") {
				if(check!=0) {
					queryRicerca= queryRicerca+"AND luogo= :luogo ";
				}
				else {
					queryRicerca= queryRicerca+"WHERE luogo= :luogo ";
					check=1;
				}
			}
		}
		if(request.getParameter("mesimin")!=null) {
			if(request.getParameter("mesimin")!="") {
				if(check!=0) {
					queryRicerca= queryRicerca+"AND mesi>= :mesimin ";
				}
				else {
					queryRicerca= queryRicerca+"WHERE mesi>= :mesimin ";
					check=1;
				}
			}
		}
		if(request.getParameter("mesimax")!=null) {
			if(request.getParameter("mesimax")!="") {
				if(check!=0) {
					queryRicerca= queryRicerca+"AND mesi<= :mesimax ";
				}
				else {
					queryRicerca= queryRicerca+"WHERE mesi<= :mesimax ";
					check=1;
				}
			}
		}
		if(request.getParameter("oremin")!=null) {
			if(request.getParameter("oremin")!="") {
				if(check!=0) {
					queryRicerca= queryRicerca+"AND ore>= :oremin ";
				}
				else {
					queryRicerca= queryRicerca+"WHERE ore>= :oremin ";
					check=1;
				}
			}
		}
		if(request.getParameter("oremax")!=null) {
			if(request.getParameter("oremax")!="") {
				if(check!=0) {
					queryRicerca= queryRicerca+"AND ore<= :oremax ";
				}
				else {
					queryRicerca= queryRicerca+"WHERE ore<= :oremax ";
					check=1;
				}
			}
		}
		if(request.getParameter("cerca")!=null) {
			if(request.getParameter("cerca")!="") {
				if(check!=0) {
					queryRicerca= queryRicerca+"AND descrizione LIKE :descrizione OR titolo LIKE :titolo OR settore LIKE :settore OR obiettivi LIKE :obiettivi OR rimborsiFacilitazioni LIKE :rimborsi OR modalita LIKE :modalita ";
				}
				else {
					queryRicerca= queryRicerca+"WHERE descrizione LIKE :descrizione OR titolo LIKE :titolo OR settore LIKE :settore OR obiettivi LIKE :obiettivi OR rimborsiFacilitazioni LIKE :rimborsi OR modalita LIKE :modalita ";
					check=1;
				}
			}
		}
		
		Query query = session.createQuery("FROM Offerta");
		List<Offerta> offerte = query.list();
		input.put("offerte", offerte);
		
		Query query2 = session.createQuery(queryRicerca);
		if(request.getParameter("azienda")!=null) {
			if(request.getParameter("azienda")!="") {
				int idAzienda;
				Query query3=session.createQuery("FROM Azienda WHERE ragioneSocialeNome= :ragioneSocialeNome");
				query3.setParameter("ragioneSocialeNome", request.getParameter("azienda"));
				Azienda azienda=(Azienda) query3.uniqueResult();
				query2.setParameter("idAzienda", azienda.getIdAzienda());
			}
		}
		if(request.getParameter("luogo")!=null) {
			if(request.getParameter("luogo")!="") {
				query2.setParameter("luogo", request.getParameter("luogo"));
			}
		}
		if(request.getParameter("mesimin")!=null) {
			if(request.getParameter("mesimin")!="") {
				query2.setParameter("mesimin", Integer.parseInt(request.getParameter("mesimin")));
			}
		}
		if(request.getParameter("mesimax")!=null) {
			if(request.getParameter("mesimax")!="") {
				query2.setParameter("mesimax", Integer.parseInt(request.getParameter("mesimax")));
			}
		}
		if(request.getParameter("oremin")!=null) {
			if(request.getParameter("oremin")!="") {
				query2.setParameter("oremin", Integer.parseInt(request.getParameter("oremin")));
			}
		}
		if(request.getParameter("oremax")!=null) {
			if(request.getParameter("oremax")!="") {
				query2.setParameter("oremax", Integer.parseInt(request.getParameter("oremax")));
			}
		}
		if(request.getParameter("cerca")!=null) {
			if(request.getParameter("cerca")!="") {
				query2.setParameter("descrizione","%"+request.getParameter("cerca")+"%");
				query2.setParameter("titolo","%"+request.getParameter("cerca")+"%");
				query2.setParameter("settore","%"+request.getParameter("cerca")+"%");
				query2.setParameter("obiettivi","%"+request.getParameter("cerca")+"%");
				query2.setParameter("rimborsi","%"+request.getParameter("cerca")+"%");
				query2.setParameter("modalita","%"+request.getParameter("cerca")+"%");
			}
		}
		List<Offerta> offerteTrovate = query2.list();
		input.put("offerteTrovate", offerteTrovate);
		
		List<String> luoghi = new ArrayList<String>();
		for(Offerta offerta : offerte) {
			if(!luoghi.contains(offerta.getLuogo())){
				luoghi.add(offerta.getLuogo());
			}
		}
		luoghi.sort(null);
		input.put("luoghi", luoghi);
		
		List<String> aziende = new ArrayList<String>();
		for(Offerta offerta : offerte) {
			if(!aziende.contains(offerta.getAzienda().getRagioneSocialeNome())){
				aziende.add(offerta.getAzienda().getRagioneSocialeNome());
			}
		}
		aziende.sort(null);
		input.put("aziende", aziende);
		
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
		ServerStart serverData = new ServerStart();
		String tipo = "visitatore";
		if (SecurityLayer.checkSession(request) != null) {
			if (SecurityLayer.checkSession(request).getAttribute("tipo") != null) {
				tipo = (String) SecurityLayer.checkSession(request).getAttribute("tipo");
			}
		}
		input.put("menu", serverData.menu.get(tipo));
		Template template = cfg.getTemplate("template/elencoOfferte.ftl");
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
		doGet(request, response);
	}

}
