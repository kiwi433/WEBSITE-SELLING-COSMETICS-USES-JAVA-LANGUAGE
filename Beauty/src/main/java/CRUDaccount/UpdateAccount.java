package CRUDaccount;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.accountDao;
import Dao.productDao;
import Model.product;
import Model.userInfo;

/**
 * Servlet implementation class UpdateAccount
 */
@WebServlet("/UpdateAccount")
public class UpdateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		accountDao spDao = new accountDao();
		userInfo spEdit = spDao.getUserbyId(id);
		request.setAttribute("sp1", spEdit);
		request.getRequestDispatcher("CRUDAccount/editAccount.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		String id = request.getParameter("id");
		String fullname = request.getParameter("fullname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String isAdmin= request.getParameter("isadmin");
		
		accountDao spDao = new accountDao();
		try {
			userInfo us=spDao.checkUserinfo(id);
		if(us==null)
		{
			spDao.signUpAccount(username, password, fullname, phone, address, gender);
			response.sendRedirect("ReadAccount");
		}
		else {
			spDao.UpdateAccountAD(id, username, password, fullname, phone, address, isAdmin, gender);
			response.sendRedirect("ReadAccount");
		}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
