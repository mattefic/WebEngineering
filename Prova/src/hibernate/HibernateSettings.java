package hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateSettings {
	private Configuration cfg = new Configuration();
	private SessionFactory factory;
	private Session session;
	public HibernateSettings() {
		cfg.configure("hibernate/hibernate.cfg.xml");
		factory = cfg.buildSessionFactory();
		session = factory.openSession();
	}
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
}
