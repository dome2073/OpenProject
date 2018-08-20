package com.movie.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.project.model.Reservation;
import com.movie.project.model.UserVO;
import com.movie.project.service.ReserveService;



@Controller
public class ReserveController {
	@Autowired
	ReserveService reserve;
	
/*	@RequestMapping("getForms")
	public String getReserveForm() {
		return "reserveForm";
	}*/
	
	@RequestMapping("reserve/getReserve")
	public String getReserve(@RequestParam(value="movieCode", defaultValue="0") String movieCode,Model model) {
		List<String> reservedSeats=new ArrayList<String>();
		reservedSeats=reserve.getSeatsByMv(movieCode);
		model.addAttribute("reservedSeats",reservedSeats);
		model.addAttribute("movieCode",movieCode);
		return "reserve/seats";		
	}	
	@RequestMapping("reserve/reservAction")
	public String reserve(HttpSession session,Model model,Reservation reservation) {
		UserVO info = (UserVO) session.getAttribute("loginInfo");
		String user_id=info.getUser_id();
		reservation.setUser_id(user_id);
		int resultCnt=reserve.reserve(reservation);
		model.addAttribute("resultCnt",resultCnt);
		model.addAttribute("reservation",reservation);
		return "reserve/reserveAction";
	}	
	@RequestMapping("reserve/getReservedJason")
	@ResponseBody
	private List<Reservation> getJasonReservation(
			@RequestParam(value="movieCode", defaultValue="0") String movieCode,Model model) {
		List<Reservation> reservedSeats=new ArrayList<Reservation>();
		reservedSeats=reserve.getSeatsByMvJson(movieCode);
		return reservedSeats;
	}
	
	
	
	
	
	
	
	
	
	
	
}
