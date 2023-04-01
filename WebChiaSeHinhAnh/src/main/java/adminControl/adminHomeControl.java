package adminControl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;
import Dao.UserDao;
import Model.Accounts;

@WebServlet("/adminHomeControl")
public class adminHomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public adminHomeControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String indexPage = request.getParameter("index");
		if (indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);

		UserDao Udao = new UserDao();
	
		int count = Udao.getTotalAccount();
		int endPage = count / 10;
		if (count % 10 != 0) {
			endPage++;
		}
		List<Accounts> listAc = Udao.get10RowAccountsUser(index);
		request.setAttribute("endP", endPage);		
		request.setAttribute("listAc", listAc);
		request.setAttribute("ati", index);
		request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
