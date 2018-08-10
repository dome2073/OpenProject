package com.bitcamp.op.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.op.user.model.UserListVO;
import com.bitcamp.op.user.service.UserListService;

//회원가입한 유저확인컨트롤러
@Controller
public class UserListController {

	@Autowired
	UserListService userListService;
	
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
}
