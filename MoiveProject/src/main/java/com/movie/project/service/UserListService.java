package com.movie.project.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.movie.project.dao.UserDaoInterface;
import com.movie.project.model.UserListVO;
import com.movie.project.model.UserVO;



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
				//ORACLE
//				firstRow = (currentPageNumber - 1) * USER_COUNT_PER_PAGE + 1;
//				endRow = firstRow + USER_COUNT_PER_PAGE - 1;
//				UserList = userDao.UserList(firstRow,endRow);
				
				//mysql사용으로 변경 0번째 부터 사용할것이므로
				//firstRow = (currentPageNumber - 1) * USER_COUNT_PER_PAGE + 1;
				firstRow = (currentPageNumber - 1) * USER_COUNT_PER_PAGE;
				//endRow = firstRow + USER_COUNT_PER_PAGE - 1;
				
				//DB에서 클릭한 페이지수 (1)= 0부터 5개를 보여줌, (2) = 5~10 
				UserList = userDao.UserList(firstRow,USER_COUNT_PER_PAGE);

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
