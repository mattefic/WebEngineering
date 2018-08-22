package servlet;
import java.util.HashMap;
import java.util.Map;

public class ServerStart {
	public static Map<String, String> menu = new HashMap<String, String>();

	public static void main(String[] args) {
		
	}
	
	public ServerStart() {
		menu.put("utente", "menu/MenuUtente.ftl");
		menu.put("azienda", "menu/MenuAzienda.ftl");
		menu.put("admin", "menu/MenuAdmin.ftl");
		menu.put("visitatore", "menu/MenuVisitatore.ftl");
		new hibernate.HibernateSettings();
	}
}
