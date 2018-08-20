package com.movie.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.project.mail.MailSendService;
import com.movie.project.model.UserVO;
import com.movie.project.service.UserRegService;

@Controller
@RequestMapping("user/reg")
public class UserRegisterController {

	@Autowired
	UserRegService userRegService;

	@Autowired
	MailSendService MailSendService;

	// a태그를 통해서 GET방식으로 접근시 회원가입 폼으로 이동(메서드실행)
	@RequestMapping(method = RequestMethod.GET)
	public String LoginForm() {

		return "user/userRegForm";
	}

	// 회원가입 폼에서 POST방식으로 값 전송시
	@RequestMapping(method = RequestMethod.POST)
	public String login(UserVO uservo, Model model, HttpServletRequest request) throws Exception {

		// 사용자 요청 데이터를 받음
		// 요청이 많으니 bean객체를 이용(회원가입정보)

		// 서비스실행 결과를 insertCnt에 담음
		int insertCnt = userRegService.RegMember(uservo, request);

		// 데이터가 잘 전달되는지 확인 , 데이터 전송
		// model.addAttribute("user",uservo);
		model.addAttribute("user_id", uservo.getUser_id());
		// 실행결과를 뷰페이지로 전송
		model.addAttribute("insertCnt", insertCnt);

		// 메일 발송
		MailSendService.MailSender(uservo.getUser_email(), MailSendService.NEW);

		return "index";
	}
}
