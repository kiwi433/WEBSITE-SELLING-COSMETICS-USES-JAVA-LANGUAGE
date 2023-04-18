package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Order;
import Model.account;
import Model.userInfo;
import connection.DbCon;

public class accountDao {
	Connection conn = null;

	PreparedStatement pst = null;
	ResultSet rs = null;

// lấy tài khoản theo username và password
	public account checkLogin(String username, String password) {

		try {
			conn = DbCon.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM accounts where username=? and password=?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, username);
				pst.setString(2, password);
				rs = pst.executeQuery();
				while (rs.next()) {
					return new account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4));
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

// Lấy tài khỏản theo username
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
					return new account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4));
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
				String sql = "INSERT INTO `accounts` (`username`,`password`,isAdmin) VALUES (?,?,0); ";
				pre = con.prepareStatement(sql);
				pre.setString(1, username);
				pre.setString(2, password);
				pre.executeUpdate();
			}

		} catch (Exception e) {
		}
	}

// danh sách tài khoản và thông tin người dùng
	public List<userInfo> getListAccount() {
		List<userInfo> arr = new ArrayList<>();
		String sql = "SELECT distinct * FROM user_infor right join  accounts on user_infor.id_account=accounts.id_ac";
		try {
			conn = new DbCon().getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				userInfo u = new userInfo();
				u.setId_userinfo(rs.getInt("id_userinfo"));
				u.setId_ac(rs.getInt("id_account"));
				u.setId(rs.getInt("id_ac"));
				u.setFullname(rs.getString("fullname"));
				u.setGender(rs.getBoolean("gender"));
				u.setAddress(rs.getString("Address"));
				u.setPhonenumber(rs.getString("phonenumber"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setIsAdmin(rs.getBoolean("isAdmin"));
				arr.add(u);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}

// lấy thông tin người dungf theo id
	public userInfo getUserbyId(String id) {
		userInfo u = new userInfo();

		String sql = "SELECT * FROM user_infor inner join accounts on user_infor.id_account=accounts.id_ac where user_infor.id_account=?";
		try {
			conn = DbCon.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				u.setId_userinfo(rs.getInt("id_userinfo"));
				u.setId_ac(rs.getInt("id_account"));
				u.setId(rs.getInt("id_ac"));
				u.setFullname(rs.getString("fullname"));
				u.setGender(rs.getBoolean("gender"));
				u.setAddress(rs.getString("address"));
				u.setPhonenumber(rs.getString("phonenumber"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setIsAdmin(rs.getBoolean("isAdmin"));

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

// cập nhật thông tin người mua trong giỏ hàng
	public void updateUserInfo(String id, String fullname, String phone, String address) {

		String sql = "Update user_infor set `fullname`=?,phonenumber=?,address=? where id_account =?;\r\n" + "";
		try {
			conn = DbCon.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, fullname);
			pst.setString(2, phone);
			pst.setString(3, address);
			pst.setString(4, id);
			pst.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// cập nhât thông tin cá nhân
	public void updateUserInfo2(String id_ac, String fullname, String phone, String address, String gender) {

		String sql = "Update user_infor set `fullname`=?,phonenumber=?,address=?,gender=? where id_account =?;\r\n"
				+ "";
		try {
			conn = DbCon.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, fullname);
			pst.setString(2, phone);
			pst.setString(3, address);
			pst.setString(4, gender);
			pst.setString(5, id_ac);
			pst.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// chèn thông tin vào trong trang giỏ hàng
	public void InsertUserInfo(String id, String fullname, String phone, String address) {

		String sql = "Insert into user_infor (id_account,fullname,phonenumber,address) values (?,?,?,?);\r\n" + "";
		try {
			conn = DbCon.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, fullname);
			pst.setString(3, phone);
			pst.setString(4, address);

			pst.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

// kiểm tra thông tin tài khoản theo id account
	public userInfo checkUserinfo(String id_account) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;

		try {
			con = DbCon.getConnection();
			if (con != null) {
				String sql = "SELECT * FROM user_infor where id_account=?";
				pre = con.prepareStatement(sql);
				pre.setString(1, id_account);

				rs = pre.executeQuery();
				while (rs.next()) {
					return new userInfo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4), rs.getString(5),
							rs.getString(6));
				}
			}
		} catch (Exception e) {
		}
		return null;
	}

// danh sách thông tin tài khoản
	public List<userInfo> selectAllUser() {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		List<userInfo> userinfor = new ArrayList<>();
		String sql = "select * from user_infor;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				userinfor.add(new userInfo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4),
						rs.getString(5), rs.getString(6)));

			}

		} catch (Exception e) {
		}
		return userinfor;
	}

// lấy thông tin tài khoản thêm idaccount
	public userInfo getAllUser(String idAccount) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM `accounts` \r\n"
				+ "INNER JOIN `user_infor` as o ON `accounts`.id_ac= o.id_account WHERE `accounts`.id_ac = ?";
		try {
			con = DbCon.getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, idAccount);
			rs = pre.executeQuery();
			while (rs.next()) {
				return new userInfo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4), rs.getString(5),
						rs.getString(6));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	// them thông tin tài khoản trong admin

	public void InsertAccountAD(String id, String username, String password, String fullname, String phone,
			String address, String isadmin, String gender) throws ClassNotFoundException {
		String sql1 = "INSERT INTO accounts (id_ac,username,password,isadmin) VALUES (?,?, ?,?)";
		String sql2 = "INSERT INTO user_infor (id_account, fullname, phonenumber, address,gender) VALUES ((SELECT id_ac FROM accounts WHERE id_ac = ?), ?, ?, ?,?)";
		Connection conn = null;
		PreparedStatement stmt1 = null, stmt2 = null;
		try {
//	    	stmt1 = conn.prepareStatement(sql1);
//	    	stmt2 = conn.prepareStatement(sql2);
			conn = DbCon.getConnection();

			stmt1 = conn.prepareStatement(sql1);
			stmt1.setString(1, id);
			stmt1.setString(2, username);
			stmt1.setString(3, password);
			stmt1.setString(4, isadmin);
			stmt1.executeUpdate();

			stmt2 = conn.prepareStatement(sql2);

			stmt2.setString(1, fullname);
			stmt2.setString(2, phone);
			stmt2.setString(3, address);
			stmt2.setString(4, gender);
			stmt2.setString(5, id);
			stmt2.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

// cập nhât tài khoản và thông tin cá nhân
	public void UpdateAccountAD(String id, String username, String password, String fullname, String phone,
			String address, String isadmin, String gender) throws ClassNotFoundException {
		String sql1 = "update accounts set `username`=?,`password`=?,`isAdmin`=? where id_ac=?";
		String sql2 = "Update user_infor set `fullname`=?,phonenumber=?,address=?,gender=? where id_account =?;";
		Connection conn = null;
		PreparedStatement stmt1 = null, stmt2 = null;
		try {
//	    	stmt1 = conn.prepareStatement(sql1);
//	    	stmt2 = conn.prepareStatement(sql2);
			conn = DbCon.getConnection();

			stmt1 = conn.prepareStatement(sql1);

			stmt1.setString(1, username);
			stmt1.setString(2, password);
			stmt1.setString(3, isadmin);
			stmt1.setString(4, id);
			stmt1.executeUpdate();

			stmt2 = conn.prepareStatement(sql2);

			stmt2.setString(1, fullname);
			stmt2.setString(2, phone);
			stmt2.setString(3, address);
			stmt2.setString(4, gender);
			stmt2.setString(5, id);
			stmt2.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void deleteAccount(String id) {

		String sql1 = "delete from accounts where id_ac = ?;";
		String sql = "delete from user_infor where id_account = ?;";
		try {
			conn = DbCon.getConnection();
			PreparedStatement pre = conn.prepareStatement(sql);
			pre.setString(1, id);
			pre.executeUpdate();
			PreparedStatement pre1 = conn.prepareStatement(sql1);
			pre1.setString(1, id);
			pre1.executeUpdate();

		} catch (Exception e) {
		}
	}
	public List<userInfo> searchAccount(String searchValue) {
		List<userInfo> listPSearchs;
		listPSearchs = new ArrayList<>();

		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			con = DbCon.getConnection();
			String sql = "SELECT * FROM `accounts` INNER JOIN `user_infor` as o ON `accounts`.id_ac= o.id_account WHERE o.fullname like ? or o.gender like ? or o.phonenumber like? or o.address like ?";
			stm = con.prepareStatement(sql);
			stm.setString(1, "%" + searchValue + "%");
			stm.setString(2, "%" + searchValue + "%");
			stm.setString(3, "%" + searchValue + "%");
			stm.setString(4, "%" + searchValue + "%");

			rs = stm.executeQuery();
			while (rs.next()) {
				userInfo u = new userInfo();
				u.setId_userinfo(rs.getInt("id_userinfo"));
				u.setId_ac(rs.getInt("id_account"));
				u.setId(rs.getInt("id_ac"));
				u.setFullname(rs.getString("fullname"));
				u.setGender(rs.getBoolean("gender"));
				u.setAddress(rs.getString("address"));
				u.setPhonenumber(rs.getString("phonenumber"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setIsAdmin(rs.getBoolean("isAdmin"));
				listPSearchs.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listPSearchs;
	}
	public static void main(String[] args) throws ClassNotFoundException {

		accountDao dao = new accountDao();
		String id = " 2";
		String user = "g";
		String pas = "1";
		String full = "thanh giang1";
		String phone = "098";
		String address = "acs";
		String isadmin = "1";
		String gender = "0";
//		dao.InsertAccountAD(id, user, pas, full, phone, address,isadmin,gender);
		dao.UpdateAccountAD(id, user, pas, full, phone, address, isadmin, gender);
		List<userInfo> uss = dao.getListAccount();
		System.out.println(uss);

	}
}
