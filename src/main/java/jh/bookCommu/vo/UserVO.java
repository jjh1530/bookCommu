package jh.bookCommu.vo;

public class UserVO {

	private String userid;
	private String userpass;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpass=" + userpass + "]";
	}
	
	
	
	
	
}
