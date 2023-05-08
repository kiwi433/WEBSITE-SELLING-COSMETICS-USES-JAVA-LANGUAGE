package CRUDproduct;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.productDao;
import Model.product;

/**
 * Servlet implementation class updateServlet
 */
@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =Integer.parseInt( request.getParameter("id"));
		productDao spDao = new productDao();
		product spEdit = spDao.getspByID(id);
		request.setAttribute("sp", spEdit);
		request.getRequestDispatcher("CRUDProduct/EditSp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		String id = request.getParameter("id");
		String image = request.getParameter("image");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		String quantity = request.getParameter("quantity");
		
		productDao spDao = new productDao();
		spDao.updateSanpham(id, name, description, image, price, quantity, category);
		response.sendRedirect("ReadServlet");
	}
}
