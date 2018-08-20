package com.movie.project.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.movie.project.SHA256.SHA256;
import com.movie.project.dao.UserDaoInterface;
import com.movie.project.model.UserVO;

public class UserMyDelete {

	// 자동 매퍼 생성 기능
	@Autowired
	SqlSessionTemplate template;
	@Autowired
	SHA256 SHA;
	
	private UserDaoInterface userDao;
	
	//회원탈퇴
	public int UserDelete(int user_number,String user_pw) {
		
		userDao = template.getMapper(UserDaoInterface.class);
		UserVO uservo =null;
		String userpw = SHA.encrypt(user_pw);
		int result;
		//회원정보를 uservo에 저장
		uservo = userDao.UserSelect(user_number); 
		
		if(uservo==null) {
			System.out.println("DB에 저장된 회원정보가 없음");
			//정보가없음
			result = 0;
		}else {
			//정보가있음
			//DB에 저장된 값과 , 사용자가 입력한 값이 맞는지 확인
			if(uservo.getUser_number()==user_number && uservo.getUser_pw().equals(userpw)) {
				
				userDao.UserDelete(user_number);
				System.out.println("회원정보삭제");
				result =1; //성공
			}else {
				
				result =-1; //불일치
				System.out.println("회원정보불일치");
			}
			
		}
		return result;
		
	}
}
