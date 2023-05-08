package CRUDorderDetail;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class ReadOrderDetail
 */
@WebServlet("/ReadOrderDetail")
public class ReadOrderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		accountDao spDao = new accountDao();
		String id= request.getParameter("id_ac");
		userInfo us1 = spDao.getUserbyId(id);
		request.setAttribute("us", us1);
		request.getRequestDispatcher("luufilethanhtoan.jsp").forward(request, response);
	}


}
