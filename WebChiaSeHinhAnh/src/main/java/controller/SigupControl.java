package controller;

import java.io.IOException;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Dao.UserDao;
import Model.Accounts;

@WebServlet("/SigupControl")
public class SigupControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SigupControl() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String gmail = request.getParameter("gmail");
        String password = request.getParameter("password");
        String re_pass = request.getParameter("repeatpassword");
        String firstname = request.getParameter("firstName");
        String lastname = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String passwordRequirements = "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@#$%^&+=]).{8,}$";
        Pattern pattern = Pattern.compile(passwordRequirements);
        Matcher matcher = pattern.matcher(password);

        if (!matcher.matches()) {
            request.setAttribute("mess", "<div class=\"alert alert-warning\" role=\"alert\">"
                    + "Mật khẩu phải chứa ít nhất 8 ký tự, bao gồm chữ cái, số và ký tự đặc biệt (@#$%^&+=)"
                    + "</div>");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (!password.equals(re_pass)) {
            request.setAttribute("mess", "<div class=\"alert alert-warning\" role=\"alert\">"
                    + " Xác nhận mật khẩu không khớp"
                    + "</div>");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (gender == null || (!gender.equals("nam") && !gender.equals("nữ"))) {
            request.setAttribute("mess", "<div class=\"alert alert-warning\" role=\"alert\">"
                    + "Vui lòng chọn giới tính"
                    + "</div>");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            UserDao dao = new UserDao();
            Accounts a = dao.checkAccountsExit(gmail);
			if (a == null) {
			    // đăng ký tài khoản
			    dao.signup(gmail, password, firstname, lastname, gender);
			    Accounts ac = dao.checkLogin(gmail, password);
			    HttpSession session = request.getSession();
			    session.setAttribute("acc", ac);
			    session.setMaxInactiveInterval(1000000);
			    response.sendRedirect("HomeControl");
			} else {
			    request.setAttribute("mess",
			            "<div class=\"alert alert-warning\" role=\"alert\">" + "Email đã tồn tại trong hệ thống" + "</div>");
			    request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
        }
    }
}
