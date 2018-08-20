package com.movie.project.dao;

import java.util.List;

import com.movie.project.model.UserVO;

public interface UserDaoInterface {
	public UserVO selectById(String userid);
	public int insertUser(UserVO uservo);
	public int UserCount();
	public List<UserVO> UserList(int firstRow, int endRow);
	public void UpdateUser(UserVO uservo);
	public UserVO UserSelect(int user_number);
	public void UserDelete(int user_number);
}
