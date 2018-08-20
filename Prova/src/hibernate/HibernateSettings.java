package hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateSettings {
	private Configuration cfg = new Configuration();
	private static SessionFactory factory;

	public HibernateSettings() {
		cfg.configure("hibernate/hibernate.cfg.xml");
		factory = cfg.buildSessionFactory();
	}

	public static SessionFactory getSessionFactory() {
		return factory;
	}
}
