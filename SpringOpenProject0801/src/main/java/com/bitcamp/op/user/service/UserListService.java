package com.bitcamp.op.user.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.op.user.dao.UserDaoInterface;
import com.bitcamp.op.user.model.UserListVO;
import com.bitcamp.op.user.model.UserVO;



public class UserListService {
	
	//주입
	@Autowired
	SqlSessionTemplate template;
	
	private UserDaoInterface userDao; 
	
	//한 페이지에 보여줄 회원정보 수 (5)
	private static final int USER_COUNT_PER_PAGE = 5;
		
	public UserListVO getUserlist(int pageNumber) {
		
		userDao = template.getMapper(UserDaoInterface.class);
		
		
		int currentPageNumber = 1;
		
		//사용자가 클릭한 페이지 
		if(pageNumber > 0) {
			currentPageNumber = pageNumber;
		}
		
		int UserTotalCount = userDao.UserCount();
		
		List<UserVO> UserList = null;
		int firstRow = 0;
		int endRow = 0;
		
		if(UserTotalCount >0) {
			firstRow = (currentPageNumber - 1) * USER_COUNT_PER_PAGE + 1;
			endRow = firstRow + USER_COUNT_PER_PAGE - 1;
			UserList = userDao.UserList(firstRow,endRow);

		}else {
			//초기화
			currentPageNumber = 0;
			// 회원목록이 비어있으므로 빈값 반환
			UserList = Collections.emptyList();
		}
		return new UserListVO(UserList,UserTotalCount,currentPageNumber
				,USER_COUNT_PER_PAGE,firstRow,endRow);
	}
}
