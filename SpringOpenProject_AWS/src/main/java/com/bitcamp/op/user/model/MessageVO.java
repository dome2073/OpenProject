package com.bitcamp.op.user.model;

import java.sql.Date;

public class MessageVO {
	private int id;
	private String guestName;
	private String password;
	private String message;
	private String message_date;
	
	
	public String getMessage_date() {
		return message_date;
	}

	public void setMessage_date(String message_date) {
		this.message_date = message_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean hasPassword() {
		return password != null && !password.isEmpty();
	}

	public boolean matchPassword(String pwd) {
		return password != null && password.equals(pwd);
	}

	@Override
	public String toString() {
		return "MessageVO [id=" + id + ", guestName=" + guestName + ", password=" + password + ", message=" + message
				+ ", message_date=" + message_date + "]";
	}

	
}

