package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import hibernate.HibernateSettings;
import model.Azienda;
import model.Contratto;

/**
 * Servlet implementation class VisualizzaPdf
 */
@WebServlet("/VisualizzaPdf")
public class VisualizzaPdf extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VisualizzaPdf() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/pdf");
		SessionFactory sessionFactory = HibernateSettings.getSessionFactory();
		if (sessionFactory != null) {

		} else {
			HibernateSettings settings = new HibernateSettings();
			sessionFactory = settings.getSessionFactory();
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		if (request.getParameter("convenzione") != null) {
			
			Query query = session.createQuery("FROM Azienda WHERE idAzienda = :idAzienda");
			query.setParameter("idAzienda", Integer.parseInt(request.getParameter("convenzione")));
			Azienda azienda = (Azienda) query.uniqueResult();

			t.commit();

			String filepath = "C:\\Users\\Win10\\git\\WebEngineering\\Prova\\src\\main\\webapp\\"
					+ azienda.getFileConvenzione();
			FileInputStream fileIn = new FileInputStream(new File(filepath));
			response.setHeader("Content-Disposition", "inline; filename=" + filepath + ";");
			OutputStream output = response.getOutputStream();
			int bytes;
			while ((bytes = fileIn.read()) != -1) {
				output.write(bytes);
			}
			fileIn.close();
		} else {
			if (request.getParameter("progetto") != null) {
				Query query = session.createQuery("FROM Contratto WHERE idContratto = :idContratto");
				query.setParameter("idContratto", Integer.parseInt(request.getParameter("progetto")));
				Contratto contratto = (Contratto) query.uniqueResult();

				t.commit();

				String filepath = "C:\\Users\\Win10\\git\\WebEngineering\\Prova\\src\\main\\webapp\\"
						+ contratto.getPercorso();
				FileInputStream fileIn = new FileInputStream(new File(filepath));
				response.setHeader("Content-Disposition", "inline; filename=" + filepath + ";");
				OutputStream output = response.getOutputStream();
				int bytes;
				while ((bytes = fileIn.read()) != -1) {
					output.write(bytes);
				}
				fileIn.close();
			}
		}
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
