package CRUDproduct;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.accountDao;
import Dao.productDao;
import Model.account;
import Model.product;

/**
 * Servlet implementation class CreateServlet
 */
@WebServlet("/CreateServlet")
public class CreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("CRUDProduct/CreateProduct.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String image = request.getParameter("image");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String category = request.getParameter("category");
		String quantity = request.getParameter("quantity");
		String description = request.getParameter("description");
		productDao spDao = new productDao();
		spDao.insertSanpham(name, description, image, price, quantity, category);
		response.sendRedirect("ReadServlet");
	}
}