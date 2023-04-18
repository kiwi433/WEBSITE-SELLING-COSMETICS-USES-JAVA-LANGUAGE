package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.accountDao;
import Model.userInfo;

/**
 * Servlet implementation class UpdateOrderdetail
 */
@WebServlet("/UpdateOrderdetail")
public class UpdateOrderdetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderdetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		accountDao spDao = new accountDao();
		String id= request.getParameter("id_ac");
		userInfo us1 = spDao.getUserbyId(id);
		request.setAttribute("us", us1);
		request.getRequestDispatcher("thanhtoan.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id_ac");
		String phone = request.getParameter("txtPhone");
		String fullname = request.getParameter("txtFullname");
		String address = request.getParameter("txtAddress");
		accountDao dao = new accountDao();
		userInfo us=dao.checkUserinfo(id);
		if(us==null)
		{
			dao.InsertUserInfo(id, fullname, phone, address);response.sendRedirect("ReadOrderDetail?id_ac="+id);
		}
		else {
		dao.updateUserInfo(id, fullname, phone, address);response.sendRedirect("ReadOrderDetail?id_ac="+id);
		}
		
	}

}
