package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.account;
import connection.DbCon;


public class accountDao {
	Connection conn = null;

	PreparedStatement pst = null;
	ResultSet rs = null;

	public account checkLogin(String username, String password) {

		try {
			conn =DbCon.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM accounts where username=? and password=?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, username);
				pst.setString(2, password);
				rs = pst.executeQuery();
				while (rs.next()) {
					return new account(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getBoolean(4));
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public account checkAccount(String username) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;

		try {
			con = DbCon.getConnection();
			if (con != null) {
				String sql = "SELECT * FROM accounts where username=?";
				pre = con.prepareStatement(sql);
				pre.setString(1, username);

				rs = pre.executeQuery();
				while (rs.next()) {
					return new account(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getBoolean(4));
				}
			}

		} catch (Exception e) {
		}
		return null;
	}

	public void signUpAccount(String username, String password) {
		Connection con = null;
		PreparedStatement pre = null;

		try {
			con = DbCon.getConnection();
			if (con != null) {
				String sql = " INSERT INTO  `accounts` (`username`,`password`,isAdmin) VALUES (?,?,0); ";
				pre = con.prepareStatement(sql);
				pre.setString(1, username);
				pre.setString(2, password);
				pre.executeUpdate();
			}

		} catch (Exception e) {
		}
	}
	

//	public List<Account> getListAccount() {
//		List<Account> arr = new ArrayList<>();
//		String sql = "SELECT * FROM shop.account";
//		try {
//			conn = new Dbcon().getConnection();
//			pst = conn.prepareStatement(sql);
//			rs = pst.executeQuery();
//			while (rs.next()) {
//				arr.add(new  Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4),rs.getDate(5),rs.getTimestamp(6)));
//
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return arr;
//	}
//
//	public Account getAccountbyId(String id) {
//		String sql = "SELECT * FROM shop.account where id=?";
//		try {
//			conn = new Dbcon().getConnection();
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, id);
//			rs = pst.executeQuery();
//			while (rs.next()) {
//				return new  Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4),rs.getDate(5),rs.getTimestamp(6));
//
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return null;
//	}
}
