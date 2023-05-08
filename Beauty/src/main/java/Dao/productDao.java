package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.product;
import Model.userInfo;
import connection.DbCon;

public class productDao extends userInfo {
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public List<product> selectProduct() {
		List<product> list = new ArrayList<>();
		String sql = "SELECT distinct* FROM CSDLNC.product;";
		try {
			con = DbCon.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				product p = new product();
				p.setId(rs.getInt("id_p"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getInt("price"));
				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));
				p.setQuantity(rs.getInt("quantity"));
				p.setCategory(rs.getString("category"));
				list.add(p);
			}
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		return list;
	}

	public product getspByID(int id) {
		product p = new product();
		String sql = "select * from product where id_p= ? ;";
		try {
			con = DbCon.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {

				p.setId(rs.getInt("id_p"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getInt("price"));
				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));
				p.setQuantity(rs.getInt("quantity"));
				p.setCategory(rs.getString("category"));
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return p;
	}

	public List<product> search(String searchValue) {
		List<product> listPSearchs;
		listPSearchs = new ArrayList<>();

		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			con = DbCon.getConnection();
			String sql = "SELECT *from product where name like ? or price like ? or description like ?";
			stm = con.prepareStatement(sql);
			stm.setString(1, "%" + searchValue + "%");
			stm.setString(2, "%" + searchValue + "%");
			stm.setString(3, "%" + searchValue + "%");

			rs = stm.executeQuery();
			while (rs.next()) {
				product p = new product();
				p.setId(rs.getInt("id_p"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getInt("price"));
				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));
				p.setQuantity(rs.getInt("quantity"));
				p.setCategory(rs.getString("category"));

				listPSearchs.add(p);
			}
		} catch (Exception e) {
		}
		return listPSearchs;
	}
//	public List<product> search(String searchValue) {
//		List<product> listPSearchs;
//		listPSearchs = new ArrayList<>();
//
//		Connection con = null;
//		PreparedStatement stm = null;
//		ResultSet rs = null;
//		try {
//			con = DbCon.getConnection();
//			String sql = "SELECT *from product where name like ? or price like ? or decription like ?";
//			stm = con.prepareStatement(sql);
//			stm.setString(1, "%" + searchValue + "%");
//			stm.setString(2, "%" + searchValue + "%");
//			stm.setString(3, "%" + searchValue + "%");
//
//			rs = stm.executeQuery();
//			while (rs.next()) {
//				product p = new product();
//				p.setId(rs.getString("id"));
//				p.setName(rs.getString("name"));
//				p.setPrice(rs.getString("price"));
//				p.setDescription(rs.getString("decription"));
//				p.setImage(rs.getString("image"));
//				p.setQuantity(rs.getInt("quatity"));
//				p.setCategory(rs.getString("category"));
//				p.setDescription(rs.getString("decription"));
//
//				listPSearchs.add(p);
//			}
//		} catch (Exception e) {
//		}
//		return listPSearchs;
//	}

	public void insertSanpham(String name, String description, String image, String price, String quantity,String category) {

		String sql = "insert into product ( image,name,price,category,description ,quantity)" + "values (?,?,?,?,?,?);";
		try {
			con = DbCon.getConnection();
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, image);
			pre.setString(2, name);
			pre.setString(3, price);
			pre.setString(4, category);
			pre.setString(5, description);
			pre.setString(6, quantity);

			pre.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteSanpham(String id) {
		
		String sql = "delete from product where id_p = ?;";
		try {
			con = DbCon.getConnection();
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, id);
			pre.executeUpdate();
			
		} catch (Exception e) {
		}
	}
	public void updateSanpham(String id,String name, String description, String image, String price, String quatity,String category) {

		String sql = "update product set name =?, "
				+ "description =?,"
				+ "image =?,"
				+ "price =?,"
				+ "quantity =?,"
				+ "category =?"
				
				+ "where id_p =?";
		try {
			con = DbCon.getConnection();
			PreparedStatement pre = con.prepareStatement(sql);
			
			pre.setString(1, name);
			pre.setString(2, description);
			pre.setString(3, image);
			pre.setString(4, price);
			pre.setString(5, quatity);
			pre.setString(6, category);
			
			pre.setString(7, id);
			pre.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		productDao dao = new productDao();
		List<product> list = dao.selectProduct();
		System.out.println(list);
		String st = "sua tam";
		List<product> list1 = dao.search(st);
		System.out.println(list1);
	}
}
