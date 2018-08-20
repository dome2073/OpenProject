package com.movie.project.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.movie.project.dao.UserDaoInterface;
import com.movie.project.model.UserVO;

public class UserDeleteService {
	
	@Autowired
	SqlSessionTemplate template;
	
	private UserDaoInterface userDao; 
	
	public int deleteUser(int user_number) {
		
		userDao = template.getMapper(UserDaoInterface.class);
		
		UserVO uservo =null;
		
		uservo = userDao.UserSelect(user_number); 
		
		if(uservo ==null) {
			
			//회원 유무 확인 : 해당회원이 없음
			return 0;
		}else {
			userDao.UserDelete(user_number);
			return 1;
		}
	}

}
