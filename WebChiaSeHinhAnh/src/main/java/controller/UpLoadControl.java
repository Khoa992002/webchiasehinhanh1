package controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Dao.ImageDao;
import Dao.categoryDao;
import Model.Accounts;
import Model.category;

@MultipartConfig
@WebServlet("/UpLoadControl")
public class UpLoadControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpLoadControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ImageDao imageDao = new ImageDao();

		try {
			Part part = request.getPart("imgUpload");
			String realPath = request.getServletContext().getRealPath("/img/dataImg");
			String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
			if (!Files.exists(Paths.get(realPath))) {
				Files.createDirectory(Paths.get(realPath));
			}
			part.write(realPath + "/" + fileName);
		} catch (Exception e) {
			// TODO: handle exception
		}
		Part part = request.getPart("imgUpload");
		String images = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		String tieucu = request.getParameter("tieucu");
		String khaudo = request.getParameter("khaudo");
		String tocdomantrap = request.getParameter("tocdomantrap");
		String iso = request.getParameter("iso");
		String tenmayanh = request.getParameter("tenmayanh");
		String loaihinh = request.getParameter("loaihinh");
		String tag = request.getParameter("tag");
		String cate_id = request.getParameter("cate_id");
		String isPublic = request.getParameter("isPublic");
		HttpSession session = request.getSession();
		Accounts a = (Accounts) session.getAttribute("acc");
		String Uid = a.getUserID();
		imageDao.insertImage(images, tieucu, khaudo, tocdomantrap, iso, tenmayanh, loaihinh, tag, cate_id, Uid,
				isPublic);
		response.sendRedirect("AboutControl");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
