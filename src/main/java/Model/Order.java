package Model;

import java.sql.Date;


public class Order extends product  {
	private int Order_id;
	private int u_id;
	private int product_id;
	private int quanlity;
	private String date;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Order(int Order_id, int u_id, int product_id, int quanlity, String date) {
		super();
		this.Order_id = Order_id;
		this.u_id = u_id;
		this.product_id = product_id;
		this.quanlity = quanlity;
		this.date = date;
	}
	public int getOrder_id() {
		return Order_id;
	}
	public void setOrder_id(int Order_id) {
		this.Order_id = Order_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getQuanlity() {
		return quanlity;
	}
	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Order [Order_id=" + Order_id + ", u_id=" + u_id + ", product_id=" + product_id + ", quanlity="
				+ quanlity + ", date=" + date + ", getId()=" + getId() + ", getName()=" + getName()
				+ ", getDescription()=" + getDescription() + ", getImage()=" + getImage() + ", getPrice()=" + getPrice()
				+ ", getQuantity()=" + getQuantity() + ", getCategory()=" + getCategory() + ", toString()="
				+ super.toString() + ", getId_userinfo()=" + getId_userinfo() + ", getId_ac()=" + getId_ac()
				+ ", getFullname()=" + getFullname() + ", isGender()=" + isGender() + ", getPhonenumber()="
				+ getPhonenumber() + ", getAddress()=" + getAddress() + ", getUsername()=" + getUsername()
				+ ", getPassword()=" + getPassword() + ", getIsAdmin()=" + getIsAdmin() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}
	

	

	

}
