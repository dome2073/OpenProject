package com.bitcamp.op.user.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.op.jdbc.ConnectionProvider;
import com.bitcamp.op.jdbc.jdbcUtil;
import com.bitcamp.op.user.dao.UserDao;
import com.bitcamp.op.user.model.UserVO;



public class UserLoginService {
	
	//주입
	@Autowired
	UserDao userdao;
	
	//입력한 아이디, 패스워드를 매개변수로 받음
	public boolean login(HttpServletRequest request, String userId, String userPw) throws SQLException {
		
		boolean result = false;
		
		//기존에 있는 세션생성
		HttpSession session = request.getSession(false);
		Connection conn = null;
		

		try {
			conn = ConnectionProvider.getConnection();
			
			//아이디 비밀번호 찾기 
			//커넥션 정보 , 입력한 아이디로 아이디 여부를 확인한 결과를 객체에 담음
			//유저정보가 객체에 담겨이씀
			UserVO uservo = userdao.selectById(conn, userId);
			
			//객체가 있고 비밀번호가 일치하면 loginInfo로 회원정보로 세션을 만듬
			if (uservo != null && uservo.Checkpw(userPw)) {
				session.setAttribute("loginInfo", uservo);
				System.out.println("로그인 성공");
				result = true;
			}
		} finally {
			jdbcUtil.close(conn);
		}

		return result;
	}

}
