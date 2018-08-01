package com.bitcamp.op.user.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bitcamp.op.user.model.UserVO;

public class UserRowMapper implements RowMapper<UserVO> {

	@Override
	public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		UserVO uservo = new UserVO();
		uservo.setUser_number(rs.getInt(1));
		uservo.setUser_id(rs.getString(2));
		uservo.setUser_pw(rs.getString(3));
		uservo.setUser_name(rs.getString(4));
		uservo.setUser_birth(rs.getInt(5));
		uservo.setUser_gender(rs.getString(6));
		uservo.setUser_email(rs.getString(7));
		uservo.setUser_phone(rs.getString(8));
		
		return uservo;
	}
	
	
}
