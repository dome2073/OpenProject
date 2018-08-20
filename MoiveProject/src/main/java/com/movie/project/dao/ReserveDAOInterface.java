package com.movie.project.dao;

import java.util.List;

import com.movie.project.model.Reservation;



public interface ReserveDAOInterface {
	public int insertSeat(Reservation reservation);
	public List<String> getSeatsByMv(String code);
	public List<Reservation> getSeatsByMvJson(String code);
}
