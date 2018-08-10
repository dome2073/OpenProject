package com.bitcamp.op.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.op.user.model.UserVO;

@Controller

//    /user/mypage 요청이 들어왔을때 - 요청은 모두 소문자로 하즈아
@RequestMapping("user/mypage")
public class UserMypageController{
	
	//a태그를 통해서 GET방식으로 접근시 마이페이지로 이동(메서드실행)
		@RequestMapping(method=RequestMethod.GET)
		public String mypage(Model model, UserVO uservo,HttpSession session) {			
			
			//마이페이지 - 회원 정보를 보여줌.
			//1. 세션정보를 확인해보자.
			UserVO info = (UserVO)session.getAttribute("loginInfo");
			System.out.println(info);
			
			model.addAttribute("Userinfo",info);
			return "user/userMypage";
		}
		
		
}
