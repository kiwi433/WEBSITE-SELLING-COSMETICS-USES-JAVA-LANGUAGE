package TKCNServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.accountDao;

import Model.userInfo;



@WebServlet("/ReadTKCN")
public class ReadTKCN extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReadTKCN() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String idAccount = request.getParameter("idAccount"); 
		 accountDao UIDao = new accountDao(); 
		 userInfo cs = UIDao.getUserbyId(idAccount);
		 request.setAttribute("tkcn", cs);
		 request.getRequestDispatcher("TKCN.jsp").forward(request, response);
				 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
