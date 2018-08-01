package com.bitcamp.op.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.op.user.model.UserVO;

public class MybatisUserDao {
	
	
	//SqlSessionTemplate 를 사용하기위해 주입! 
	//jdbc썼던 것과 같다.
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public UserVO selectById(String userId) {
		
		System.out.println("MybatisDao selectById 실행................");
	
		String str = "com.bitcamp.op.mapper.mybatis.UserMapper.selectById";
		
		//실행할 sql문(mapper 에서 해당 태그 id), 전달할 데이터
		//정해준 Name스페이스(UserMapper.xml)의 태그 id에게 전달해줄 데이터를 정해주면 된다
		//UserVO 객체로 반환
		Object obj = sqlSessionTemplate.selectOne(str, userId);
		
		return (UserVO)obj;
		//★ 서비스에도 등록하려면 MybatisUserDao를 Bean등록해야함! ★
	}
	public int insertUser(UserVO uservo) {
		System.out.println("MybatisDao insertUser 실행................");
		
		String str = "com.bitcamp.op.mapper.mybatis.UserMapper.insertMember";
		return sqlSessionTemplate.update(str,uservo);
	}
	
}
