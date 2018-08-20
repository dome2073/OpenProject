package com.movie.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.project.model.UserVO;
import com.movie.project.service.UserMyDelete;
import com.movie.project.service.UserRegService;
import com.movie.project.service.UserUpdateService;

@Controller
//@RequestMapping("user/mypage")
public class UserMypageController {
	
	@Autowired
	UserUpdateService UpdateService;
	@Autowired
	UserMyDelete UserDelete;
	
	// a태그를 통해서 GET방식으로 접근시 마이페이지로 이동(메서드실행)
	//회원정보 확인- 수정입력 form
	@RequestMapping(value="user/mypage",method = RequestMethod.GET)
	public String mypage(Model model, UserVO uservo, HttpSession session) {

		// 마이페이지 - 회원 정보를 보여줌.
		// 1. 세션정보를 확인해보자.
		UserVO info = (UserVO) session.getAttribute("loginInfo");

		model.addAttribute("Userinfo", info);
		return "user/userMypage";
	}
	//회원정보수정
	@RequestMapping(value="user/mypage",method = RequestMethod.POST)
	public String mypageUpdate(HttpSession session,UserVO uservo,HttpServletRequest request) throws Exception {
		
		//해당 아이디의 정보를 수정,
		//1. 수정할 아이디
		UserVO info = (UserVO) session.getAttribute("loginInfo");

		//2. 데이터 수정 요청
		//user_number로 확인 후 수정, 변경사항만 변경
		UpdateService.UserUpdate(uservo, request,session); 
		
		session.removeAttribute("loginInfo");
		
		return "index";
	}
	//회원탈퇴폼 이동
	@RequestMapping(value="user/delete",method = RequestMethod.GET)
	public String deleteform() {
		
		//회원탈퇴 - 비밀번호 확인페이지로 이동
		return "user/userDelete";
	}
	
	@RequestMapping(value="user/delete",method = RequestMethod.POST)
	public String mydelete(@RequestParam("user_pw")String user_pw, HttpSession session) {

		//회원탈퇴 - 비밀번호 확인페이지 -> POST
		
		//1.세션의 number, 사용자가 입력한 비밀번호 불러옴
		UserVO info = (UserVO) session.getAttribute("loginInfo");	
		int user_number = info.getUser_number();
		
		//2. 회원탈퇴페이지에서 입력한 비밀번호로 db의 회원의 비밀번호와 일치하는지 확인(서비스)
		int resultcheck = UserDelete.UserDelete(user_number, user_pw);
		
		if(resultcheck == 1) {
			
			//세션제거(로그아웃)
			session.removeAttribute("loginInfo");
			//메인페이지로 이동
			return "index";
			}else {
				//실패
				return "index";
			}
		}
	}
	
