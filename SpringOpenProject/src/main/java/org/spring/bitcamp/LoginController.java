package org.spring.bitcamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	//GET 방식일 경우에는 FORM 실행
	//a태그에서 로그인을 눌렀을 경우에는 get방식이므로 실행
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView Login() {
		
		String viewName = "member/LoginForm";
		ModelAndView model = new ModelAndView();
		model.setViewName(viewName);
		
		return model;
	}
	
	//POST 방식일 경우에는  실행
	@RequestMapping(method=RequestMethod.POST)
	public String getLoginForm(HttpServletRequest request,
			@RequestParam("userid")String userid,@RequestParam("userpw")String userpw,
			LoginInfo loginfo,Model model) {
		
		//방법 1 : JSP처럼 request객체를 사용해서 사용자 요청받기
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		//방법2 : @RequestParam("")을 이용해 사용자 요청 받기
		//방법3 : 자바 빈 객체로 데이터 가져오기 LoginInfo.getId() 
		
		//방법1 결과
		System.out.println("방법1 폼데이터 :"+ id + "비밀번호:" +pw);
		//방법2 결과
		System.out.println("방법2 폼데이터 :"+ userid + "비밀번호" + userpw);
		//방법3 결과
		System.out.println("방법3 폼데이터 :"+ loginfo);
		
		model.addAttribute("requestID",id);
		model.addAttribute("requestPW",pw);
		model.addAttribute("RequestParamID",userid);
		model.addAttribute("RequestParamPW",userpw);
		model.addAttribute("BeanId",loginfo.getUserid());
		model.addAttribute("BeanPW",loginfo.getUserpw());
		model.addAttribute("Logininfo",loginfo);
		//Model 객체를 통해서 뷰에 데이터 전송
		
		return "loginok";
	}
	
}
