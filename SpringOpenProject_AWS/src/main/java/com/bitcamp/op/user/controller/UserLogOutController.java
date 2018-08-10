package com.bitcamp.op.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//로그아웃 컨트롤러
@Controller
public class UserLogOutController {
	
	@RequestMapping("/user/logout")
	public String logout(HttpSession session,Model model) {
		
		
		//세션 종료
		session.removeAttribute("loginInfo");
		//인터셉터 제외해야된다.
		return "user/userLogout";
	}
}
