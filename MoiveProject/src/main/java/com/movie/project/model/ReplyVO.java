package com.movie.project.model;

import java.util.Date;

public class ReplyVO {
	private Integer rno;
	private String user_id;
	private String movie_code;
	private String replytext;
	private Date regdate;
	private Date updatedate;
	
	public ReplyVO() {}
	public ReplyVO(Integer rno, String user_id, String movie_code, String replytext, Date regdate, Date updatedate) {
		super();
		this.rno = rno;
		this.user_id = user_id;
		this.movie_code = movie_code;
		this.replytext = replytext;
		this.regdate = regdate;
		this.updatedate = updatedate;
	}
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", user_id=" + user_id + ", movie_code=" + movie_code + ", replytext="
				+ replytext + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	
}
