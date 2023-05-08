package CRUDOder;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.OrderDao;
import Model.Order;
import connection.DbCon;




/**
 * Servlet implementation class ReadOrderKH
 */
@WebServlet("/ReadOrderKH")
public class ReadOrderKH extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadOrderKH() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String idUser = request.getParameter("idUser"); 
		 OrderDao OdDao;
		try {
			OdDao = new OrderDao(DbCon.getConnection());
			Order cs = OdDao.getOrderById(idUser);				 
		 request.setAttribute("order", cs);
		 request.getRequestDispatcher("KH_Order.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} 
		 
				 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
