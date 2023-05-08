package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import Dao.OrderDao;
import Dao.accountDao;
import Model.account;
import Model.product;
import Model.userInfo;
import Model.Cart;
import Model.Order;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try (PrintWriter out = response.getWriter()) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(0);
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			
			account auth = (account) request.getSession().getAttribute("username");
			if (cart_list != null && auth != null) {
				for (Cart c : cart_list) {
					Order order = new Order();
					order.setId(c.getId());
					order.setU_id(auth.getId());
					order.setQuanlity(c.getQuantity());
					order.setDate(formatter.format(date));
					OrderDao oDao = new OrderDao(DbCon.getConnection());
					boolean result = oDao.insertOrder(order);
					if (!result)
						break;
				}
				cart_list.clear();
				response.sendRedirect("order.jsp");
			} else {
				if (auth == null) {
					response.sendRedirect("loginServlet");
				}
				response.sendRedirect("cartServlet");
			}
		} catch (Exception e) {

			e.printStackTrace();
			e.getLocalizedMessage();
		}

	}	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
