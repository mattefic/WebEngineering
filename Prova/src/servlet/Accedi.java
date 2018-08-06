package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import security.SecurityLayer;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Accedi")
public class Accedi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Accedi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("login") != null) {
			action_login(request, response);
		} else {
			action_default(request, response);
		}
	}

	private void action_default(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.getWriter().append((request.getRemoteAddr()));
	}

	private void action_login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("utente");
		String password = request.getParameter("password");

		if (!username.isEmpty() && !password.isEmpty()) {
			// Carichiamo userid dal database
			int userid = 1;
			SecurityLayer.createSession(request, username, userid);
			if (request.getParameter("referrer") != null) {
				response.sendRedirect(request.getParameter("referrer"));
			} else {
				response.sendRedirect("homepage");
			}
		}
		response.getWriter().append((request.getRemoteAddr()));
	}

}
