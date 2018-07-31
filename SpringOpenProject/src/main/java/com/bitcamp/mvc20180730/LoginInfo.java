package com.bitcamp.mvc20180730;

public class LoginInfo {
	private String userid;
	private String userpw;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public LoginInfo() {
		
	}
	public LoginInfo(String userid, String userpw) {
		super();
		this.userid = userid;
		this.userpw = userpw;
	}
	@Override
	public String toString() {
		return "LoginInfo [userid=" + userid + ", userpw=" + userpw + "]";
	}
	
	
	
	
	
	
	
}
