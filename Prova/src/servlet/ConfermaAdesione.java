package servlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
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

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import hibernate.HibernateSettings;
import model.Azienda;
import model.Candidatura;
import model.Offerta;
import model.TutoreUniversitario;
import model.Utente;
import security.SecurityLayer;

/**
 * Servlet implementation class ConfermaAdesione
 */
@WebServlet("/ConfermaAdesione")
public class ConfermaAdesione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConfermaAdesione() {
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
		Template template = cfg.getTemplate("template/confermaAdesione.ftl");

		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		Map<String, Object> input = new HashMap<String, Object>();

		int id = Integer.parseInt(request.getParameter("idOfferta"));
		Query query = session.createQuery("FROM Offerta o WHERE o.idOfferta = :idOfferta");
		query.setParameter("idOfferta", id);
		Offerta offerta = (Offerta) query.uniqueResult();
		t.commit();

		input.put("offerta", offerta);

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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession httpSession = SecurityLayer.checkSession(request);
		response.setContentType("text/html;charset=UTF-8");
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		int id = Integer.parseInt(request.getParameter("idOfferta"));
		Query queryCand = session.createQuery("FROM Candidatura WHERE idOfferta = :idOfferta AND idUtente = :idUtente");
		queryCand.setParameter("idOfferta", id);
		queryCand.setParameter("idUtente", Integer.parseInt((String) httpSession.getAttribute("userid")));
		Candidatura candidaturaX = (Candidatura) queryCand.uniqueResult();

		if (httpSession.getAttribute("tipo").equals("utente") && candidaturaX == null) {
			Date data = new Date();
			int idOfferta = Integer.parseInt(request.getParameter("idOfferta"));
			Query query = session.createQuery("FROM Offerta WHERE idOfferta = :idOfferta");
			query.setParameter("idOfferta", idOfferta);
			Offerta offerta = (Offerta) query.uniqueResult();
			Candidatura candidatura = new Candidatura();
			candidatura.setDataCandidatura(data);
			candidatura.setStato("attesa");
			int idUtente = Integer.parseInt((String) httpSession.getAttribute("userid"));
			candidatura.setIdUtente(idUtente);
			candidatura.setIdOfferta(idOfferta);
			candidatura.setIdAzienda(offerta.getIdAzienda());
			candidatura.setCfu(Integer.parseInt(request.getParameter("CFU")));

			Query queryTutore = session.createQuery("FROM TutoreUniversitario WHERE email = :email");
			queryTutore.setParameter("email", request.getParameter("email").toLowerCase());
			TutoreUniversitario tutore = (TutoreUniversitario) queryTutore.uniqueResult();

			if (tutore == null) {
				tutore = new TutoreUniversitario();
				tutore.setNome(request.getParameter("nome"));
				tutore.setCognome(request.getParameter("cognome"));
				tutore.setEmail(request.getParameter("email").toLowerCase());
				tutore.setNumRichieste(1);
				session.persist(tutore);
			} else {
				tutore.setNumRichieste(tutore.getNumRichieste() + 1);
				session.persist(tutore);
			}
			t.commit();

			t = session.beginTransaction();
			tutore = (TutoreUniversitario) queryTutore.uniqueResult();
			candidatura.setIdTutoreUniversitario(tutore.getIdTutore());
			session.persist(candidatura);
			t.commit();

			t = session.beginTransaction();
			Query queryUtente = session.createQuery("FROM Utente WHERE idUtente = :idUtente");
			queryUtente.setParameter("idUtente", idUtente);
			Utente utente = (Utente) queryUtente.uniqueResult();
			t.commit();

			// Scrivo email Tutor Universitario
			FileWriter w;
			Map<String, String> env = System.getenv();
			String path;
			if (env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
				path = "C:\\Users\\Matteo\\git\\repository/Prova/src/main/webapp/FileProgetto/EmailTutorUniversitario/Candidatura "
						+ candidatura.getIdCandidatura() + ".txt";
			} else {
				path = "C:\\Users\\Win10\\git\\WebEngineering/Prova/src/main/webapp/FileProgetto/EmailTutorUniversitario/Candidatura"
						+ candidatura.getIdCandidatura() + ".txt";
			}

			w = new FileWriter(path);
			BufferedWriter b;
			b = new BufferedWriter(w);
			b.write("Internship Tutor");
			b.newLine();
			b.write("È stata creata una candidatura da" + utente.getNome() + " " + utente.getCognome());
			b.newLine();
			b.write("Nato a " + utente.getLuogoNascita() + " il " + utente.getDataNascita());
			b.newLine();
			b.write("Residente a " + utente.getResidenza());
			b.newLine();
			b.write("Codice Fiscale: " + utente.getCodiceFiscale());
			b.newLine();
			b.write("Telefono: " + utente.getTelefono());
			b.newLine();
			b.write("Corso di Laurea " + utente.getCorsoLaurea());
			b.newLine();
			b.newLine();
			b.write("Per la seguente offerta " + offerta.getTitolo());
			b.newLine();
			b.write("Descrizione Offerta: " + offerta.getDescrizione());
			b.newLine();
			b.write("Obiettivi Offerta " + offerta.getObiettivi());
			b.newLine();
			b.write("Modalità Offerta: " + offerta.getModalita());
			b.newLine();
			b.write("Totale Mesi: " + offerta.getMesi());
			b.newLine();
			b.write("Totale Ore: " + offerta.getOre());
			b.newLine();
			b.write("Facilitazioni Previste: " + offerta.getRimborsiFacilitazioni());
			b.newLine();
			b.write("Sede di effettuazione: " + offerta.getLuogo());
			b.newLine();
			b.write("Per l'azienda: " + offerta.getAzienda().getRagioneSocialeNome());
			b.newLine();
			b.write("Partita IVA: " + offerta.getAzienda().getCodiceFiscaleIva());
			b.newLine();
			b.close();

			// Scrivo email Tutor Aziendale
			FileWriter z;
			if (env.get("COMPUTERNAME").equals("DESKTOP-K8MRIMG")) {
				path = "C:\\Users\\Matteo\\git\\repository/Prova/src/main/webapp/FileProgetto/EmailTutorAziendale/Candidatura"
						+ candidatura.getIdCandidatura() + ".txt";
			} else {
				path = "C:\\Users\\Win10\\git\\WebEngineering/Prova/src/main/webapp/FileProgetto/EmailTutorAziendale/Candidatura"
						+ candidatura.getIdCandidatura() + ".txt";
			}
			z = new FileWriter(path);
			b = new BufferedWriter(z);
			b.write("Internship Tutor");
			b.newLine();
			b.write("È stata creata una candidatura da" + utente.getNome() + " " + utente.getCognome());
			b.newLine();
			b.write("Nato a " + utente.getLuogoNascita() + " il " + utente.getDataNascita());
			b.newLine();
			b.write("Residente a " + utente.getResidenza());
			b.newLine();
			b.write("Codice Fiscale: " + utente.getCodiceFiscale());
			b.newLine();
			b.write("Telefono: " + utente.getTelefono());
			b.newLine();
			b.write("Corso di Laurea " + utente.getCorsoLaurea());
			b.newLine();
			b.newLine();
			b.write("Per la seguente offerta " + offerta.getTitolo());
			b.newLine();
			b.write("Descrizione Offerta: " + offerta.getDescrizione());
			b.newLine();
			b.write("Obiettivi Offerta " + offerta.getObiettivi());
			b.newLine();
			b.write("Modalità Offerta: " + offerta.getModalita());
			b.newLine();
			b.write("Totale Mesi: " + offerta.getMesi());
			b.newLine();
			b.write("Totale Ore: " + offerta.getOre());
			b.newLine();
			b.write("Facilitazioni Previste: " + offerta.getRimborsiFacilitazioni());
			b.newLine();
			b.write("Sede di effettuazione: " + offerta.getLuogo());
			b.newLine();
			b.write("Per l'azienda: " + offerta.getAzienda().getRagioneSocialeNome());
			b.newLine();
			b.write("Partita IVA: " + offerta.getAzienda().getCodiceFiscaleIva());
			b.newLine();
			b.close();

			response.sendRedirect("Home");
		} else {
			response.sendRedirect("Home");
		}
	}

}
