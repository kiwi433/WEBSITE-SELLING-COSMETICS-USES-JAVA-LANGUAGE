package Controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.productDao;
import Model.product;

/**
 * Servlet implementation class HomePageServlet
 */
@WebServlet("/HomePageServlet")
public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			DecimalFormat dcf = new DecimalFormat();
			request.setAttribute("dcf", dcf);
			productDao dao = new productDao();
			List<product> list = dao.selectProduct();
			request.setAttribute("listP", list);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}

