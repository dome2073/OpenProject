package com.bitcamp.op.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.bitcamp.op.user.model.UserVO;
import com.mchange.v2.c3p0.impl.NewProxyDatabaseMetaData;

public class JdbcTemplateUserDao {
	
	//Jdbc 빈 등록 한것을 주입
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	//회원정보찾기 
	public UserVO selectById(String userId) {
		
		UserVO resultObj = null;
		String sql = "select * from userinfo where user_id=?";
		
		//jdbcTemplate query메서드 사용
		//query(sql문, 만들어놓은 RowMapper(), ?에 들어갈 값
		
		/*1 방법
		List<UserVO> result = jdbcTemplate.query(sql,new UserRowMapper(),userId);		
		결과가 비어있는 경우 null, 아니면 1번째 인덱스 값 반환
		resultObj =result.isEmpty() ? null : result.get(0);*/
		
		//2 방법
		resultObj = jdbcTemplate.queryForObject(sql, new UserRowMapper(),userId);
		
		
		return resultObj;
	}
	
	//회원가입처리
	public int insertUser(UserVO uservo) {
		
		int insertCnt = 0;
		
		//키홀더 사용
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		String sql_insert = "insert into userinfo values(num_seq.nextval,?,?,?,?,?,?,?,?)";
		
		insertCnt = jdbcTemplate.update(new PreparedStatementCreator() {
			
			//구현해야하는 메서드 - 
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				
				PreparedStatement pstmt = null;
				
				pstmt = con.prepareStatement(sql_insert,new String[] {"user_number"}); // new String[] - 자동으로 증가되는 값
				pstmt.setString(1, uservo.getUser_id());
				pstmt.setString(2, uservo.getUser_pw());
				pstmt.setString(3, uservo.getUser_name());
				pstmt.setInt(4, uservo.getUser_birth());
				pstmt.setString(5, uservo.getUser_gender());
				pstmt.setString(6, uservo.getUser_email());
				pstmt.setString(7, uservo.getUser_phone());
				pstmt.setString(8, uservo.getUser_photo());
				
				return pstmt;
			}
		},keyHolder);
		
		//키홀더 - 다른 테이블의 pk를 참조해야할 경우에 사용함.
		//찾아보기
		Number keyValue = keyHolder.getKey();
		
		uservo.setUser_number(keyValue.intValue());
		
//		키홀더 사용을 위해 주석처리
//		insertCnt = jdbcTemplate.update(
//				sql_insert,
//				uservo.getUser_id(),
//				uservo.getUser_pw(),
//				uservo.getUser_name(),
//				uservo.getUser_birth(),
//				uservo.getUser_gender(),
//				uservo.getUser_email(),
//				uservo.getUser_phone(),
//				uservo.getUser_Photo()
//				);
				
		return insertCnt;
	}
	
}
