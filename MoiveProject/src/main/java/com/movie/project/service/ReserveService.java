package com.movie.project.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.movie.project.dao.ReserveDAOInterface;
import com.movie.project.model.Reservation;


public class ReserveService {
	@Autowired
	
	private SqlSessionTemplate template;
	private ReserveDAOInterface reserveDao;
	
	public int reserve(Reservation reservation) {
		int resultCnt=0;
		reserveDao=template.getMapper(ReserveDAOInterface.class);
		resultCnt=reserveDao.insertSeat(reservation);
		
		return resultCnt;
	}
	
	public List<String> getSeatsByMv(String movieCode) {
		List<String> reservedSeats=new ArrayList<String>();
		reserveDao=template.getMapper(ReserveDAOInterface.class);
		reservedSeats=reserveDao.getSeatsByMv(movieCode);
		return reservedSeats;
	}
	
	public List<Reservation> getSeatsByMvJson(String movieCode) {
		List<Reservation> reservedSeats=new ArrayList<Reservation>();		 
		reserveDao=template.getMapper(ReserveDAOInterface.class);
		reservedSeats=reserveDao.getSeatsByMvJson(movieCode);
		return reservedSeats;
	}
		
	
}
