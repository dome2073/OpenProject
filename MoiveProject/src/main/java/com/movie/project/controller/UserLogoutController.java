package com.movie.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserLogoutController {
	@RequestMapping("/user/logout")
	public String logout(HttpSession session,Model model) {
		
		
		//세션 종료
		session.removeAttribute("loginInfo");
		//인터셉터 제외해야된다.
		return "index";
	}
}
