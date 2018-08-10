package com.bitcamp.op.user.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.op.user.service.UserLoginService;

@Controller

//   /user/login 요청이 들어왔을때 - 요청은 모두 소문자, user 은 뺴즈아
@RequestMapping("/user/login")
public class UserLoginController {
	
	//의존성 주입 - 싱글톤패톤 생략가능 (생성자역할)
	@Autowired
	UserLoginService userLoginService;
	
	//a태그를 통해서 GET방식으로 접근시 로그인 폼으로 이동(메서드실행)
	@RequestMapping(method=RequestMethod.GET)
	public String LoginForm() {			
		
		return "user/userLoginForm";
	}
	
	
	//로그인 폼에서 POST방식으로 값 전송시 
	@RequestMapping(method=RequestMethod.POST)
	public String login(HttpServletRequest request,Model model)throws SQLException  {
		
		//사용자 요청 데이터를 받음
		//요청이 2개니 request로 받도록함
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		//login 결과가 담겨있는 result
		//일치하는 아이디가 있을경우 - result = true
		//             없을경우  - result = false
		boolean result = userLoginService.login(request, id, pw);
		
		//뷰로 데이터 전송
		model.addAttribute("userid",id);
		model.addAttribute("loginchk",result);
		
		
		return "user/userLogin";
	}
}
