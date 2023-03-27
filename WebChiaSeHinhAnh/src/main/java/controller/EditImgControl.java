package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ImageDao;

@WebServlet("/EditImgControl")
public class EditImgControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditImgControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String idImage = request.getParameter("idImage");
		String tieucu = request.getParameter("tieucu");
		String khaudo = request.getParameter("khaudo");
		String tocdomantrap = request.getParameter("tocdomantrap");
		String iso = request.getParameter("iso");
		String tenmayanh = request.getParameter("tenmayanh");
		String loaihinh = request.getParameter("loaihinh");
		String tag = request.getParameter("tag");
		String cate_id = request.getParameter("cate_id");
		String isPuclic = request.getParameter("isPublic");
		ImageDao imageDao = new ImageDao();
		imageDao.editImage(tieucu, khaudo, tocdomantrap, iso, tenmayanh, loaihinh, tag, cate_id, idImage, isPuclic);
		response.sendRedirect("AboutControl");
	}

}
