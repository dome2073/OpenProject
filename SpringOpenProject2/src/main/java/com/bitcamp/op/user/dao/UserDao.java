package com.bitcamp.op.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.bitcamp.op.jdbc.jdbcUtil;
import com.bitcamp.op.user.model.UserVO;

public class UserDao {

	public UserVO selectById(Connection conn, String userId) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql_select = "select * from userinfo where user_id=?";
		
		//저장할 객체
		UserVO uservo = null;

		try {
			pstmt = conn.prepareStatement(sql_select);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				uservo = makeMemberFromResultSet(rs);
			}
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
		return uservo;
	}

	private UserVO makeMemberFromResultSet(ResultSet rs) throws SQLException {
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

	public int insertMember(Connection conn, UserVO uservo) throws SQLException {
		int insertCnt = 0;
		PreparedStatement pstmt = null;
		String sql_insert = "insert into userinfo values(num_seq.nextval,?,?,?,?,?,?,?,?)";
//		String sql_insert = "insert into userinfo (user_number, user_id, user_pw, user_name, user_birth, user_gender, user_email, user_phone)"
//				+ " values (num_seq.nextval, ?,?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql_insert);
			pstmt.setString(1, uservo.getUser_id());
			pstmt.setString(2, uservo.getUser_pw());
			pstmt.setString(3, uservo.getUser_name());
			pstmt.setInt(4, uservo.getUser_birth());
			pstmt.setString(5, uservo.getUser_gender());
			pstmt.setString(6, uservo.getUser_email());
			pstmt.setString(7, uservo.getUser_phone());
			pstmt.setString(8, uservo.getUser_Photo());
			
			//있다가 회원사진 처넣을거임 ㅋ
//			pstmt.setString(3, uservo.getMemberPhoto());
			insertCnt = pstmt.executeUpdate();
		} finally {
			jdbcUtil.close(pstmt);
		}

		return insertCnt;
	}
	
	


	public int selectCount(Connection conn) throws SQLException {

		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from userinfo";

		try {
			stmt = conn.createStatement();
			// int totalCnt = stmt.executeUpdate(sql);

			rs = stmt.executeQuery(sql);

			rs.next();
			return rs.getInt(1);

		} finally {
			jdbcUtil.close(stmt);
		}
	}

	public List<UserVO> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<UserVO> messageList = null;
		String sql = "select * from " + "(select * " + "from (select * from userinfo u order by u.user_number asc) "
				+ "where rownum <=?)" + "where rownum >=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				messageList = new ArrayList<UserVO>();
				do {

					messageList.add(makeMemberFromResultSet(rs));

				} while (rs.next());

			} else {
				messageList = Collections.emptyList();
			}

			return messageList;
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
	}

	public UserVO selectByIdx(Connection conn, int user_number) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql_select = "select * from userinfo where user_number=?";
		UserVO uservo = null;

		try {
			pstmt = conn.prepareStatement(sql_select);
			pstmt.setInt(1, user_number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				uservo = makeMemberFromResultSet(rs);
			}
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
		return uservo;
	}

//	public int editMember(Connection conn, UserVO memberVo) throws SQLException {
//
//		PreparedStatement pstmt = null;
//		
//		String sql_update = "update userinfo set "
//				+ " user_name = ? , user_Photo = ? "
//				+ " where user_number=?";
//		
//		int editCnt = 0;
//
//		try {
//			pstmt = conn.prepareStatement(sql_update);
//			pstmt.setString(1, memberVo.getUser_name());
//			pstmt.setString(2, memberVo.getUser_photo());
//			pstmt.setInt(3, memberVo.getUser_number());
//			editCnt = pstmt.executeUpdate();
//			
//		} finally {			
//			jdbcUtil.close(pstmt);
//		}
//		return editCnt;
//	}
//
//	public int deleteByIdx(Connection conn, int user_number) throws SQLException {
//
//		PreparedStatement pstmt = null;
//		
//		String sql_update = "delete from userinfo where user_number=?";
//		
//		int deleteCnt = 0;
//
//		try {
//			pstmt = conn.prepareStatement(sql_update);
//			pstmt.setInt(1, user_number);
//			deleteCnt = pstmt.executeUpdate();
//			
//		} finally {			
//			jdbcUtil.close(pstmt);
//		}
//		return deleteCnt;
//	}

}
