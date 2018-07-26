package org.spring.bitcamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Register") 
//1. 하나는 a태그 클릭시 요청 url - GET - 둘다 URL은 /Register
//2. form태그 액션 요청 url - POST - 둘다 URL은 /Register
public class RegisterController {
	
	
	//GET 방식일 경우에는 FORM 실행
	//a태그에서 로그인을 눌렀을 경우에는 get방식이므로 실행
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView Register() {
		
		String ViewName = "member/RegisterForm";
		ModelAndView model = new ModelAndView();
		model.setViewName(ViewName);
		return model;
	}
	//POST 방식일 경우에는  실행
	//사용자 요청 등록
	//RogisterForm 데이터를 전송했을 때 실행 action = "Register" method =post 이기 때문엥
		@RequestMapping(method=RequestMethod.POST)
		public String getLoginForm(HttpServletRequest request,
				@RequestParam("user_id")String userid,@RequestParam("user_pw")String userpw,
				@RequestParam("user_name")String username,@RequestParam("user_year")String useryear,
				@RequestParam("user_month")String usermonth,@RequestParam("user_day")String userday,
				@RequestParam("user_gender")String usergender,@RequestParam("user_pw")String useremail,
				@RequestParam("user_phone")String userphone,
				UserInfo userinfo,Model model) {
			
			//방법 1 : JSP처럼 request객체를 사용해서 사용자 요청받기
			//좋은 방법 아니다...
			String id = request.getParameter("user_id");
			String pw = request.getParameter("user_pw");
			String name = request.getParameter("user_name");
			String year = request.getParameter("user_year");
			String month = request.getParameter("user_month");
			String day = request.getParameter("user_day");
			String gender = request.getParameter("user_gender");
			String email = request.getParameter("user_email");
			String phone = request.getParameter("user_phone");
			
			//방법2 : @RequestParam("")을 이용해 사용자 요청 받기
			//이것도 역시 좋은방법이아님.. 받아와야할 데이터가 많을수록 불편불편
			// request보다 오타나서 오류가 날확률도 높높;
			
			//방법3 : 자바 빈 객체로 데이터 가져오기 Userinfo.getUser_id() 
			// ★가장 좋은방법★
			
			//방법1 결과
			System.out.println("방법1 폼데이터 :"+ id + "비밀번호:" +pw);
			//방법2 결과
			System.out.println("방법2 폼데이터 :"+ userid + "비밀번호" + userpw);
			//방법3 결과
			System.out.println("방법3 폼데이터 :"+ userinfo);
			
			//Model 객체를 통해서 뷰에 데이터 전송
			// 귀찮으니 3개씩만 보내도록 합니다
			model.addAttribute("requestID",id);
			model.addAttribute("requestPW",pw);
			model.addAttribute("requestNAME",name);
			model.addAttribute("RequestParamID",userid);
			model.addAttribute("RequestParamPW",userpw);
			model.addAttribute("RequestParamNAME",username);
			model.addAttribute("BeanID",userinfo.getUser_id());
			model.addAttribute("BeanPW",userinfo.getUser_pw());
			model.addAttribute("BeanNAME",userinfo.getUser_name());
			model.addAttribute("Userinfo",userinfo);
			
			return "registerok";
		}
}
