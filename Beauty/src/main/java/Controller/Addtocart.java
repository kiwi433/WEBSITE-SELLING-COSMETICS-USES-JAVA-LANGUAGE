package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.accountDao;
import Model.Cart;
import Model.account;
import Model.userInfo;

/**
 * Servlet implementation class Addtocart
 */
@WebServlet("/Addtocart")
public class Addtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Addtocart() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			out.print("add to cart servlet");	
			HttpSession session = request.getSession();
			account auth = (account) request.getSession().getAttribute("username");
	
				if (auth != null) {	ArrayList<Cart> cartList = new ArrayList<>();
				int id = Integer.parseInt(request.getParameter("id"));
				String id_ac = request.getParameter("id_ac");
				
				Cart cm = new Cart();
				cm.setId(id);
				cm.setQuantity(1);
	
			
				ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
				if (cart_list == null) {
					cartList.add(cm);
					session.setAttribute("cart-list", cartList);
					accountDao dao = new accountDao();
					userInfo u = dao.getUserbyId(id_ac);
					request.setAttribute("user_info", u);
					request.getRequestDispatcher("ReadOrderDetail").forward(request, response);
				} else {
					cartList = cart_list;
					boolean exist = false;
					for (Cart c : cart_list) {
						if (c.getId() == id) {
							exist = true;
							c.setQuantity(c.getQuantity() + 1);
							accountDao dao = new accountDao();
							userInfo u = dao.getUserbyId(id_ac);
							request.setAttribute("user_info", u);
							request.getRequestDispatcher("ReadOrderDetail").forward(request, response);
                      
						}
					}
					if (!exist) {
						cartList.add(cm);
						
						accountDao dao = new accountDao();
						userInfo u = dao.getUserbyId(id_ac);
						request.setAttribute("user_info", u);
						request.getRequestDispatcher( "ReadOrderDetail").forward(request, response);
					}
				}
			} else {
				response.sendRedirect("loginServlet");
			}
		}

		catch (Exception e) {

			// TODO: handle exception
			e.printStackTrace();
			e.getLocalizedMessage();
		}
	}

}
