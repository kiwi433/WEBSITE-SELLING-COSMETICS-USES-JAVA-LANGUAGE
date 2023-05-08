package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.accountDao;
import Model.userInfo;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet("/cartServlet")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String id_ac = request.getParameter("id_ac");
		accountDao dao = new accountDao();
		userInfo u = dao.getUserbyId(id_ac);
		request.setAttribute("user_info", u);
		request.getRequestDispatcher("thanhtoan.jsp").forward(request, response);
	}

}
