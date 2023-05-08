package Model;

public class accountInsertErr {
	private String usernameLengthErr;
	private String passwordLengthErr;
	private String confirmNotMatch;
	private String usernameIsExit;
	public accountInsertErr() {
		super();
		// TODO Auto-generated constructor stub
	}
	public accountInsertErr(String usernameLengthErr, String passwordLengthErr, String confirmNotMatch,
			String usernameIsExit) {
		super();
		this.usernameLengthErr = usernameLengthErr;
		this.passwordLengthErr = passwordLengthErr;
		this.confirmNotMatch = confirmNotMatch;
		this.usernameIsExit = usernameIsExit;
	}
	public String getUsernameLengthErr() {
		return usernameLengthErr;
	}
	public void setUsernameLengthErr(String usernameLengthErr) {
		this.usernameLengthErr = usernameLengthErr;
	}
	public String getPasswordLengthErr() {
		return passwordLengthErr;
	}
	public void setPasswordLengthErr(String passwordLengthErr) {
		this.passwordLengthErr = passwordLengthErr;
	}
	public String getConfirmNotMatch() {
		return confirmNotMatch;
	}
	public void setConfirmNotMatch(String confirmNotMatch) {
		this.confirmNotMatch = confirmNotMatch;
	}
	public String getUsernameIsExit() {
		return usernameIsExit;
	}
	public void setUsernameIsExit(String usernameIsExit) {
		this.usernameIsExit = usernameIsExit;
	}

}
