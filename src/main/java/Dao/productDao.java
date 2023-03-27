package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.product;
import connection.DbCon;



public class productDao {
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public List<product> selectProduct() {
		List<product> list = new ArrayList<>();
		String sql = "SELECT * FROM CSDLNC.product;";
		try {
			con = DbCon.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				product p = new product();
				p.setId(rs.getString("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getString("price"));
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
	public product getspByID(String id) {
product p = new product();
		String sql = "select * from product where id=? ;";
		try {
			con = DbCon.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				
				p.setId(rs.getString("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getString("price"));
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

	public List<product> search(String searchValue){
		List<product> listPSearchs;
		listPSearchs = new ArrayList<>();
		
		Connection con =null;
		PreparedStatement stm =  null;
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
				p.setId(rs.getString("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getString("price"));
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
	public static void main(String[] args) {
		productDao dao = new productDao();
		List<product> list = dao.selectProduct();
		System.out.println(list);
		String st="sua tam";
		List<product> list1 = dao.search(st);
		System.out.println(list1);
	}
}
