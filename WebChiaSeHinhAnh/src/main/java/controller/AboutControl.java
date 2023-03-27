package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.ImageDao;
import Dao.UserDao;
import Dao.categoryDao;
import Model.Accounts;
import Model.Images;
import Model.category;

@WebServlet("/AboutControl")
public class AboutControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AboutControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ImageDao imageDao = new ImageDao();
		UserDao userDao = new UserDao();
		categoryDao categoryDao = new categoryDao();
		HttpSession session = request.getSession();
		Accounts ac = (Accounts) session.getAttribute("acc");
		String userID = ac.getUserID();
		List<Images> list = imageDao.getAllImagesbyIdUser(userID);
		request.setAttribute("listUID", list);
		Accounts a = userDao.getNameUser(userID);
		request.setAttribute("AC", a);
		// edit
		String idImage = request.getParameter("Iid");
		Images I = imageDao.getImageByid(idImage);
		request.setAttribute("detail", I);
		// upload
		List<category> listC = categoryDao.getAllCategory();
		request.setAttribute("listC", listC);
		request.getRequestDispatcher("aboutme.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
