package com.movie.project.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.project.model.ReplyVO;
import com.movie.project.model.UserVO;


@Controller
public class MovieController {

	@RequestMapping(value = "movie/movie")
	public String toMovieList(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		return "movie/movie";
	}
	
	@RequestMapping(value = "review", method = RequestMethod.GET)
	public void review(HttpSession session, @RequestParam("movie_code") String movie_code,@RequestParam("movieName") String movieName, Model model){
		UserVO info = (UserVO) session.getAttribute("loginInfo");
		ReplyVO review_id = (ReplyVO) session.getAttribute("");
		String user_id=info.getUser_id();
		model.addAttribute("movie_code", movie_code);
		model.addAttribute("movieName", movieName);
		model.addAttribute("user_id",user_id);
	}
	
}
