package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.accountDao;
import Model.account;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String username = request.getParameter("txtUsername");
		String password = request.getParameter("txtPassword");

		accountDao dao = new accountDao();
		// chuyen den cac view can cu vao ket qua dang nhap
		try {
			account isValid = dao.checkLogin(username, password);
			if (isValid != null) {
//				 khoi tao session
				HttpSession session = request.getSession();
				// thiet lap gia tri trong session
				session.setAttribute("login", isValid);
				// chuyen den view trang home
				response.sendRedirect("HomePageServlet");
			} else {
				request.setAttribute("mss", "Tên đăng nhập sai hoặc mật khẩu sai!!!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			response.getWriter().close();

		}
	}
}
