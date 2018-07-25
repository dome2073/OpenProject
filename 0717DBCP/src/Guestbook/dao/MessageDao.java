package Guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import Guestbook.model.Message;
import jdbcs.jdbcUtil;

public class MessageDao {
	// DAO 클래스는 기능 클래스 - 여러개의 인스턴스 생성이 불필요
	// -싱글톤 패턴으로 처리-

	// 1. 생성자 은닉 --> 외부클래스에서 생성자 호출 불가능
	private MessageDao() {

	}

	// 2.인스턴스 생성 : 1개만 생성하고 공유해서 사용
	// static을 사용하지않으면 초기화시점이 달라서 사용불가
	// 내부적으로만 사용할 수 있게 private
	private static MessageDao instance = new MessageDao();

	// 외부에서 메소드를 통해 사용할 수 있게함.
	// 메서드도 같은 이유로 static으로
	public static MessageDao getInstance() {
		return instance;
	}
	
	// (SQL)INSERT 실행하는 메서드
	// 방명록 글 삽입
	public int insert(Connection conn, Message message) throws SQLException {
		PreparedStatement pstmt = null;
		//SQL작성
		String sql = "insert into guestbook_message values (message_id_seq.NEXTVAL, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			//preparedStatement사용 순차적으로 값을 넣는다.
			//SQL문 ?에 해당하는 값을 넣는다.
			pstmt.setString(1, message.getGuestName()); //첫번째 ? 에 입력받은 사용자 이름을 넣는다.
			pstmt.setString(2, message.getPassword()); //두번째 ? 에 입력받은 사용자 비밀번호를 넣는다
			pstmt.setString(3, message.getMessage()); //세번째 ? 에 입력받은 방명록 메세지를 넣는다

			return pstmt.executeUpdate(); //insert이므로 executeUpdate 사용

		} finally {
			//jdbcUtil 호출해서 pstmt 반환
			jdbcUtil.close(pstmt);

		}
	}
	
	//select문 실행
	//전체 게시물이 몇개인지 확인하는 select문
	public int selectCount(Connection conn) throws SQLException {

		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from guestbook_message";

		try {
			stmt = conn.createStatement();
			// int totalCnt = stmt.executeUpdate(sql);

			rs =  stmt.executeQuery(sql);
//			re.next();
			rs.next();
			return rs.getInt(1);
			
			
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(stmt);
		}
	}
	
	//게시물 리스트를 반환
	public List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Message> messageList = null;
		
		String sql = "select message_id, guest_name, password, message " + " from ( "
				+ " select rownum rnum, message_id, guest_name, password, message " + " from ( " + " select * "
				+ " from guestbook_message m " + " order by m.message_id desc " + " ) " + " where rownum <= ? " + " )"
				+ " where rnum >= ? ";

		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, endRow);
		pstmt.setInt(2, firstRow);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			messageList = new ArrayList<Message>();
			do {
			
				messageList.add(makeMessageFromResultSet(rs));
				
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

	private Message makeMessageFromResultSet(ResultSet rs) throws SQLException {
		Message message = new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		return message;
	}

	public Message select(Connection conn, int messageId)throws SQLException {
		// TODO Auto-generated method stub
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Message message = null;
		
		//select 쿼리실행
		//입력한 방명록번호 정보를 찾음
		String SQL ="select * from guestbook_message where message_id = ?"; 
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,messageId); //입력받은 messageId로 검색
			
			rs = pstmt.executeQuery(); //select이므로 executeQuery
			
			//게시물이 있는경우 
			if(rs.next()) {
				//결과로 나온 행을 message 객체에 담음
				message = makeMessageFromResultSet(rs); //게시물 정보 				
			}else {
				return null;
			}
		}finally {
			// TODO: handle finally clause
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
		return message;
	}	
	

	
	public void delete(Connection conn, int messageId)throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//삭제할 방명록번호를 입력받아서 삭제 쿼리실행
		String SQL ="delete from guestbook_message where message_id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,messageId);
			pstmt.executeUpdate();//delete이므로 executeUpdate
			
		} finally {
			// TODO: handle finally clause			
			jdbcUtil.close(pstmt);
		}
	}

}

