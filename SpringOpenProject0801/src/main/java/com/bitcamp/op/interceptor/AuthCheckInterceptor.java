package com.bitcamp.op.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//핸들러인터페이스 어댑터를 사용, 메서드를 오버라이딩해서 사용
//인터페이스를 직접 구현하지 않음.
public class AuthCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	//preHandle() = 전처리
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("인터셉터 진입...");
		//기존에 있는 세션을 가져온다
		HttpSession session = request.getSession(false);
		
		//세션이 있는 경우
		if(session != null) {
			
			//세션에 있는 값이 logininfo인 경우
			if(session.getAttribute("loginInfo")!= null) {
				System.out.println("check....");
				return true;
			}
		}

		//세션이 없는 경우
		//요청페이지로 다시보내줌  (loginform)
		response.sendRedirect(request.getContextPath()+"/user/login?url=");
		return false;
	}
	
}
