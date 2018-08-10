package com.bitcamp.op.user.dao; //패키지이름 + 인터페이스 이름을 namespace로 등록해줌

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.op.user.model.UserListVO;
import com.bitcamp.op.user.model.UserVO;

public interface UserDaoInterface {
	
	public UserVO selectById(String userid);
	public int insertUser(UserVO uservo);
	public int UserCount();
	public List<UserVO> UserList(int firstRow, int endRow);
	
	
}
