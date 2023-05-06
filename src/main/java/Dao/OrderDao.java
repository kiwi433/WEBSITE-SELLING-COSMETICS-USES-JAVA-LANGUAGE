package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Model.Order;
import Model.product;
import Model.userInfo;
import connection.DbCon;

import Model.Cart;

public class OrderDao {

	private Connection con;

	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public OrderDao(Connection con) {
		this.con = con;

	}

	public OrderDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean insertOrder(Order model) {
		boolean result = false;
		try {
			query = "insert into `order` (id_user,id_product,order_quantity) values(?,?,?)";
			pst = this.con.prepareStatement(query);
//            pst.setInt(1, model.getId());            

			pst.setInt(1, model.getU_id());

			pst.setInt(2, model.getId());
			pst.setInt(3, model.getQuanlity());
			pst.executeUpdate();
			result = true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}

	public List<Order> userOrders(int id) {
		List<Order> list = new ArrayList<>();
		try {
			query = "select * from `order` where id_user=? order by order.id desc";
			con = DbCon.getConnection();
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				Order o = new Order();
				productDao dao = new productDao();
				int pId = Integer.parseInt(rs.getString("id_product"));
				product product = dao.getspByID(pId);
				o.setOrder_id(rs.getInt("id"));
				o.setId(pId);
				o.setName(product.getName());
				o.setCategory(product.getCategory());
				o.setImage(product.getImage());
				o.setPrice(product.getPrice() * rs.getInt("order_quantity"));
				o.setQuanlity(rs.getInt("order_quantity"));
				o.setDate(rs.getString("date_order"));
				list.add(o);

			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}

	public Order getOrderById(String idUser) {
		Order o = new Order();
		product p = new product();
		userInfo u = new userInfo();
		String sql = "select *from `order` inner join product on `order`.id_product=product.id_p inner join user_infor on user_infor.id_account=`order`.id_user where user_infor.id_account=?;";
		try {
			Connection con = DbCon.getConnection();
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, idUser);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				o.setId(rs.getInt("id"));
				o.setProduct_id(rs.getInt("id_product"));
				o.setFullname(rs.getString("fullname"));
				o.setU_id(rs.getInt("id_user"));
				o.setQuantity(rs.getInt("quantity"));
				o.setDate(rs.getString("date_order"));
				o.setName(rs.getString("name"));
				o.setImage(rs.getString("image"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
	}

	public void cancelOrder(int id) {
		// boolean result = false;
		try {
			query = "delete from `order` where id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
			// result = true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		// return result;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					String query = "select price from product where id_p=?";
					con = DbCon.getConnection();
					pst = con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("price") * item.getQuantity();

					}

				}
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return sum;
	}

	public double getTotalOrderPrice(ArrayList<Order> ordertList) {
		double sum = 0;
		try {
			if (ordertList.size() > 0) {
				for (Order item : ordertList) {
					String query = "select price from product where id_p=?";
					con = DbCon.getConnection();
					pst = con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {

						sum += rs.getDouble("price") * item.getQuantity();

					}

				}
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return sum;
	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> book = new ArrayList<>();
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					String query = "select distinct* from product where id_p=?";
					con = DbCon.getConnection();
					pst = con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id_p"));
						row.setName(rs.getString("Name"));
						row.setCategory(rs.getString("category"));
						row.setImage(rs.getString("image"));
						row.setPrice(rs.getInt("price") * item.getQuantity());
						row.setQuantity(item.getQuantity());
						book.add(row);
					}

				}
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return book;
	}

	public List<Order> selectAllOrder() {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;

		List<Order> acc = new ArrayList<>();
		String sql = "select*from `order` inner join product on `order`.id_product=product.id_p inner join user_infor on `order`.id_user=`user_infor`.id_account;\r\n"
				+ "";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				Order o = new Order();
				productDao dao = new productDao();
//				int pId = Integer.parseInt(rs.getString("id_product"));
				product product = new product();
				o.setOrder_id(rs.getInt("id"));
				o.setProduct_id(rs.getInt("id_product"));
				o.setU_id(rs.getInt("id_user"));o.setFullname(rs.getString("fullname"));
				o.setName(rs.getString("name"));
				o.setCategory(rs.getString("category"));
				o.setImage(rs.getString("image"));
				o.setPrice(rs.getInt("price") * rs.getInt("order_quantity"));
				o.setQuanlity(rs.getInt("order_quantity"));
				o.setDate(rs.getString("date_order"));
				acc.add(o);
			}

		} catch (Exception e) {
		}
		return acc;
	}

	public List<Order> searchOrder(String searchValue) {
		List<Order> listPSearchs;
		listPSearchs = new ArrayList<>();

		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			con = DbCon.getConnection();
			String sql = "SELECT *from `order`inner join product on `order`.id_product=product.id_p inner join user_infor on `order`.id_user=`user_infor`.id_account where product.name like ? or user_infor.fullname like ? or YEAR(date_order) like ? or DAY(date_order) like  ?";
			stm = con.prepareStatement(sql);
			stm.setString(1, "%" + searchValue + "%");
			stm.setString(2, "%" + searchValue + "%");
			stm.setString(3, "%" + searchValue + "%");
			stm.setString(4, "%" + searchValue + "%");
			rs = stm.executeQuery();
			while (rs.next()) {
				Order p = new Order();
				p.setProduct_id(rs.getInt("id_product"));
				p.setU_id(rs.getInt("id_user"));
				p.setName(rs.getString("name"));
				p.setFullname(rs.getString("fullname"));
				p.setPrice(rs.getInt("price"));
				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));
				p.setQuanlity(rs.getInt("quantity"));
				p.setCategory(rs.getString("category"));
				p.setDate(rs.getString("date_order"));
				listPSearchs.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
			e.getStackTrace();
			e.getLocalizedMessage();
		}
		return listPSearchs;
	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		OrderDao d = new OrderDao(DbCon.getConnection());
		int id = 1;
		List<Order> o = d.userOrders(id);
		List<Order> or = d.selectAllOrder();
		System.out.println(o);
		System.out.println(or);

	}

}
