package com.movie.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.project.model.UserListVO;
import com.movie.project.model.UserVO;
import com.movie.project.service.UserDeleteService;
import com.movie.project.service.UserListService;

@Controller
public class UserListController {
	
	//회원리스트 서비스
	@Autowired
	UserListService userListService;
	//회원삭제 서비스
	@Autowired
	UserDeleteService userDeleteService;
	
	@RequestMapping("/user/userlist")
	public String Userlist(@RequestParam(value="page",required=false)String pageNumStr,Model model){
		
		UserListVO userlist =null;
		
		int pageNumber =1;
		
		System.out.println("pagenumber = "+pageNumber);
		System.out.println("pageNumStr = "+pageNumStr);
		
		if(pageNumStr != null) {
			pageNumber = Integer.parseInt(pageNumStr);
			System.out.println(pageNumber);
		}
		//요청이 들어오면 UserListService에 요청 -> 게시물에 대한 정보를 리턴
		 userlist = userListService.getUserlist(pageNumber);
		 
		 model.addAttribute("userlist",userlist);
		 
		 //클릭한 페이지
		 System.out.println(userlist);
		
		return "user/userList";
	}

	@RequestMapping("/user/userdelete")
	public String UserDelete(@RequestParam("user_number")int user_number,HttpSession session, Model model) {
		
		
		UserVO info = (UserVO)session.getAttribute("loginInfo");
		int result = userDeleteService.deleteUser(user_number);
		
		return "index";
	}
}
