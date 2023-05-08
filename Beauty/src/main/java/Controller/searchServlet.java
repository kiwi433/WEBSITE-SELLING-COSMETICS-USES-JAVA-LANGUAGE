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
 * Servlet implementation class searchServlet
 */
@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			
			String txt=request.getParameter("txtSearch");
			DecimalFormat dcf = new DecimalFormat();
			request.setAttribute("dcf", dcf);
		
		productDao dao = new productDao();
	
		List<product> list =dao.search(txt);		
		request.setAttribute("search",list);
		request.getRequestDispatcher("search.jsp").forward(request, response);	

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
	}

}
