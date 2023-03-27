package Control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;
import Model .Accounts;
import Model.Comments;
import Model .Images;
import Model.InfUser;

@WebServlet("/ImageDetail")
public class ImageDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ImageDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String idImage = request.getParameter("Iid");
		String Uid = request.getParameter("Uid");
		String Cid = request.getParameter("Cid");
		Dao dao = new Dao();
		dao.upDateView(idImage);
		Accounts A = dao.getNameUser(Uid);
		request.setAttribute("Ac", A);
		Images I = dao.getImageByid(idImage);
		request.setAttribute("detail", I);
		List<Images> list = dao.getTop6ImagesByCid(Cid);
		request.setAttribute("listImg_Cid", list);
		List<InfUser> listCM = dao.getCommentByidImg(idImage);
		request.setAttribute("listCM", listCM);
		request.getRequestDispatcher("imageDetail.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
