package Model;

public class userInfo extends account {
	private int id_userinfo;
	private int id_ac;
	private String fullname;
	private boolean gender;
	private String phonenumber;
	private String address;
	
	public userInfo(int id_userinfo, int id_ac, String fullname, boolean gender, String phonenumber, String address) {
		super();
		this.id_userinfo = id_userinfo;
		this.id_ac = id_ac;
		this.fullname = fullname;
		this.gender = gender;
		this.phonenumber = phonenumber;
		this.address = address;
		
	}
	
	public userInfo(String fullname, String phonenumber, String address) {
		super();
		this.fullname = fullname;
		this.phonenumber = phonenumber;
		this.address = address;
	}

	public userInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId_userinfo() {
		return id_userinfo;
	}
	public void setId_userinfo(int id_userinfo) {
		this.id_userinfo = id_userinfo;
	}
	public int getId_ac() {
		return id_ac;
	}
	public void setId_ac(int id_ac) {
		this.id_ac = id_ac;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "userInfo [id_userinfo=" + id_userinfo + ", id_ac=" + id_ac + ", fullname=" + fullname + ", gender="
				+ gender + ", phonenumber=" + phonenumber + ", address=" + address + ", getId()=" + getId() + ", getUsername()=" + getUsername() + ", getPassword()=" + getPassword()
				+ ", getIsAdmin()=" + getIsAdmin() + "]";
	}

}
