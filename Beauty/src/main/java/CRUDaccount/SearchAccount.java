package CRUDaccount;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.accountDao;
import Dao.productDao;
import Model.product;
import Model.userInfo;

/**
 * Servlet implementation class SearchAccount
 */
@WebServlet("/SearchAccount")
public class SearchAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");

			String txt = request.getParameter("txtSearch");
			DecimalFormat dcf = new DecimalFormat();
			request.setAttribute("dcf", dcf);

			accountDao dao = new accountDao();

			List<userInfo> list = dao.searchAccount(txt);
			request.setAttribute("listAC", list);
			request.getRequestDispatcher("CRUDAccount/account.jsp").forward(request, response);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}

	}
}
