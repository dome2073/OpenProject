package com.bitcamp.op.user.model;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private int user_number;
	private String user_id;
	private String user_pw;
	private String user_name;
	private int user_birth;
	private String user_gender;
	private String user_email;
	private String user_phone;
	
	//DB 데이터 입력을 위한 변수
	private String user_photo;
	
	public String getUser_photo() {
		return user_photo;
	}
	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}
	//파일 업로드를 위한 변수
	private MultipartFile photoFile;
	
	public MultipartFile getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}
	public int getUser_number() {
		return user_number;
	}
	public void setUser_number(int user_number) {
		this.user_number = user_number;
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
	public int getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(int user_birth) {
		this.user_birth = user_birth;
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

	public boolean Checkpw(String pw) {

		return user_pw.equals(pw) ? true : false;
	}
	@Override
	public String toString() {
		return "UserVO [user_number=" + user_number + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_birth=" + user_birth + ", user_gender=" + user_gender + ", user_email="
				+ user_email + ", user_phone=" + user_phone + ", user_photo=" + user_photo + ", photoFile=" + photoFile
				+ "]";
	}
	
	
}
