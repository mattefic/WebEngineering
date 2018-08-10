package servlet;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import hibernate.HibernateSettings;
import model.Azienda;
import model.Utente;

public class StoreData {
	public static void main(String[] args) {

		Utente e1 = new Utente();
		e1.setCodiceFiscale("104");
		e1.setNome("Pincos");
		e1.setCognome("Pallinos");
		e1.setCorsoLaurea("informatica");
		e1.setDataNascita(new Date(140896));
		e1.setHandicap(true);
		e1.setResidenza("casa mia");
		e1.setTelefono("07123");
		e1.setLuogoNascita("ospedale");

		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if(sessionFactory != null) {
	
		} else {
			HibernateSettings settings = new HibernateSettings();
			 sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
	Transaction t = session.beginTransaction();
		
	
		Utente e2 = (Utente) session.load("model.Utente", "100");
		System.out.println(e2.getCognome());
		
		Azienda a = new Azienda();
		a.setCodiceFiscaleIva("a");
		a.setCognomeLegale("b");
		a.setCognomeRespTirocinio("c");
		a.setEmailRespTirocinio("email");
		a.setForo("Rieti");
		a.setIndirizzo("Azienda tua");
		a.setNomeLegale("matteo");
		a.setNomeRespTirocinio("fico");
		a.setRagioneSocialeNome("EHEH");
		a.setTelefonoRespTirocinio("987");
		
		Query query = session.createQuery("FROM Utente ");
		List utenti = query.list();
		for (Iterator iterator = utenti.iterator(); iterator.hasNext();) {
			Utente employee = (Utente) iterator.next();
			System.out.print("First Name: " + employee.getCodiceFiscale());
			System.out.print("  Last Name: " + employee.getCognome());
			System.out.println("  Salary: " + employee.getCorsoLaurea());
		}
			t.commit();// transaction is committed
			session.close();

			System.out.println("successfully saved");

		}
	}

