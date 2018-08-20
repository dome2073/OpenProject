package com.movie.project.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

public class Reservation {
	private String seats_id;
	private String user_id;
	private String movie_code;
	
	public Reservation() {}
	
	public Reservation(String seats_id, String user_id, String movie_code) {
		super();
		this.seats_id = seats_id;
		this.user_id = user_id;
		this.movie_code = movie_code;
	}

	public String getSeats_id() {
		return seats_id;
	}

	public void setSeats_id(String seats_id) {
		this.seats_id = seats_id;
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

	@Override
	public String toString() {
		return "Reservation [seats_id=" + seats_id + ", user_id=" + user_id + ", movie_code=" + movie_code + "]";
	}
	
	
	
	
	
	
}
