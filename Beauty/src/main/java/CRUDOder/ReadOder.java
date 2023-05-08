package CRUDOder;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.OrderDao;
import Dao.accountDao;
import Dao.productDao;
import Model.Order;
import Model.product;

/**
 * Servlet implementation class ReadOder
 */
@WebServlet("/ReadOder")
public class ReadOder extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	public ReadOder() {
		// TODO Auto-generated constructor stub
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDao oDao = new OrderDao();
		List<Order> listo = oDao.selectAllOrder();
		request.setAttribute("listO", listo);
		request.getRequestDispatcher("CRUDOrder.jsp").forward(request, response);


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}
}
