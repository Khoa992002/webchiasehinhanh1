package adminControl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Dao;
import Model.adminAccount;

@WebServlet("/adminLoginControl")
public class adminLoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public adminLoginControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {

			String user = request.getParameter("adUsername");
			String pass = request.getParameter("adPassword");
			Dao dao = new Dao();
			adminAccount a = dao.adminLogin(user, pass);
			if (a == null) {
				request.setAttribute("mess", "<div class=\"alert alert-warning\" role=\"alert\">\r\n"
						+ "Sai tên đăng nhập hoặc mật khẩu\r\n" + "</div>");
				request.getRequestDispatcher("Admin_Login.jsp").forward(request, response);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("acc", a);
				session.setMaxInactiveInterval(1000000);
				response.sendRedirect("adminHomeControl");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
