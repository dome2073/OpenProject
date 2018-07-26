package org.spring.bitcamp;

public class UserInfo {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_year;
	private String user_month;
	private String user_day;
	private String user_gender;
	private String user_email;
	private String user_phone;
	
	public UserInfo(String user_id, String user_pw, String user_name, String user_year, String user_month,
			String user_day, String user_gender, String user_email, String user_phone) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_year = user_year;
		this.user_month = user_month;
		this.user_day = user_day;
		this.user_gender = user_gender;
		this.user_email = user_email;
		this.user_phone = user_phone;
	}
	public UserInfo() {
		
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_year() {
		return user_year;
	}
	public void setUser_year(String user_year) {
		this.user_year = user_year;
	}
	public String getUser_month() {
		return user_month;
	}
	public void setUser_month(String user_month) {
		this.user_month = user_month;
	}
	public String getUser_day() {
		return user_day;
	}
	public void setUser_day(String user_day) {
		this.user_day = user_day;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	@Override
	public String toString() {
		return "UserInfo [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_year="
				+ user_year + ", user_month=" + user_month + ", user_day=" + user_day + ", user_gender=" + user_gender
				+ ", user_email=" + user_email + ", user_phone=" + user_phone + "]";
	}

}
