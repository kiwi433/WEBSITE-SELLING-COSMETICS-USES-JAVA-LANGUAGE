package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.OrderDao;
import Dao.productDao;
import Model.Cart;
import Model.Order;
import Model.account;
import Model.product;
import connection.DbCon;

import java.io.PrintWriter;

import java.util.*;
import java.text.SimpleDateFormat;
/**
 * Servlet implementation class OrderNowServlet
 */
@WebServlet("/OrderNowServlet")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();productDao dao = new productDao();
    		List<product> list1 = dao.selectProduct();
    		request.setAttribute("listS", list1);
            account auth = (account) request.getSession().getAttribute("login");

            if (auth != null) {
                String productId = request.getParameter("id");
                String productQuantity = request.getParameter("quantity");
//                if (Integer.parseInt(productQuantity)  <= 0) {
//                	productQuantity = 1;
//                }
                Order orderModel = new Order();
                orderModel.setId(Integer.parseInt( productId));
                orderModel.setU_id(auth.getId());
                orderModel.setQuanlity(Integer.parseInt(productQuantity));
                OrderDao orderDao = new OrderDao(DbCon.getConnection());
                boolean result = orderDao.insertOrder(orderModel);
                if (result) {
                    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                    if (cart_list != null) {
                        for (Cart c : cart_list) {
                            if (c.getId() ==Integer.parseInt(productId)) {
                                cart_list.remove(cart_list.indexOf(c));
                                break;
                            }
                        }
                    }
                    response.sendRedirect("Checkout");
                } else {
                    out.println("order failed");
                }
            } else {
                response.sendRedirect("loginServlet");
            }

        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


}
