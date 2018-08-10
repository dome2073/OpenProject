package com.bitcamp.op.user.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.op.SHA256.SHA256;
import com.bitcamp.op.user.dao.UserDaoInterface;
import com.bitcamp.op.user.model.UserVO;

public class UserLoginService {
	
	@Autowired
	SqlSessionTemplate template;
	
	//암호화
	@Autowired
	SHA256 SHA;
	
	private UserDaoInterface userDao; 
	
	//입력한 아이디, 패스워드를 매개변수로 받음
	public boolean login(HttpServletRequest request, String userId, String userPw) throws SQLException {
		
		userDao = template.getMapper(UserDaoInterface.class);
		
		//비밀번호 SHA암호화로 변경
		String pw= SHA.encrypt(userPw);
	
		boolean result = false;
		
		//기존에 있는 세션생성
		HttpSession session = request.getSession(false);
	
			//아이디 비밀번호 찾기 
			//커넥션 정보 , 입력한 아이디로 아이디 여부를 확인한 결과를 객체에 담음
			//유저정보가 객체에 담겨이씀
			UserVO uservo = userDao.selectById(userId);
			
	
			//객체가 있고 비밀번호가 일치하면 loginInfo로 회원정보로 세션을 만듬
			if (uservo != null && uservo.Checkpw(pw)) {
				session.setAttribute("loginInfo", uservo);
				System.out.println("로그인 성공");
				result = true;
			}else {
				result = false;
			}
		return result;
	}

}
