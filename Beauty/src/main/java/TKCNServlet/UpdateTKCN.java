package TKCNServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.accountDao;

import Model.userInfo;

/**
 * Servlet implementation class UpdateTKCN
 */
@WebServlet("/UpdateTKCN")
public class UpdateTKCN extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateTKCN() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		accountDao spDao = new accountDao();
		String id = request.getParameter("idAccount");
		userInfo us1 = spDao.getUserbyId(id);
		request.setAttribute("us", us1);
		request.getRequestDispatcher("Updatetkcn.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
try {
	
		String id = request.getParameter("idAccount");
		String phone = request.getParameter("txtPhone");
		String fullname = request.getParameter("txtFullname");
		String gender = request.getParameter("txtGender");
		String address = request.getParameter("txtAddress");
		accountDao dao = new accountDao();

		dao.updateUserInfo2(id, fullname, phone, address, gender);
		response.sendRedirect("ReadTKCN?idAccount="+id);

	
} catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}}
}
