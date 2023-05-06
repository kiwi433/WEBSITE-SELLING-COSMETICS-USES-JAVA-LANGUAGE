package CRUDOder;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.OrderDao;
import Model.Order;

/**
 * Servlet implementation class SearchOrder
 */
@WebServlet("/SearchOrder")
public class SearchOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");

			String txt = request.getParameter("txtSearch");
			DecimalFormat dcf = new DecimalFormat();
			request.setAttribute("dcf", dcf);

			OrderDao dao = new OrderDao();

			List<Order> list = dao.searchOrder(txt);
			request.setAttribute("listO", list);
			request.getRequestDispatcher("CRUDOrder.jsp").forward(request, response);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
	}

}
