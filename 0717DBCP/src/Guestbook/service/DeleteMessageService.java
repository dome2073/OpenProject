package Guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import Guestbook.dao.MessageDao;
import Guestbook.model.Message;
import jdbc.connection.ConnectionProvider;
import jdbcs.jdbcUtil;

public class DeleteMessageService {

	private static DeleteMessageService instance = new DeleteMessageService();

	public static DeleteMessageService getInstance() {
		return instance;
	}

	private DeleteMessageService() {
	}
	
	//매개변수 messageId,password = 사용자가 입력한 messageId,password 
	public void deleteMessage(int messageId, String sessionId)
			throws ServiceException, InvalidMessagePasswordException, MessageNotFoundException {
		Connection conn = null;
		try {
			//커넥션 풀 초기화
			conn = ConnectionProvider.getConnection();
			
			conn.setAutoCommit(false);
			//SQL문에 접근할 수 있는 MessageDao 객체를 가져옴. (select, delect)
			MessageDao dao = MessageDao.getInstance();

			// 1. 메세지 객체 검색 (select 메서드 호출) messageId - SQL문에 들어감  pstmt.setInt(1, messageId);
			// 삭제 클릭한 글의 정보를 검색함 
			// message 객체에 글의 정보를 담음
			// message_id, guest_name , password, massage
			Message message = dao.select(conn, messageId);
			
			// 게시물 유무 확인 : 게시물이 없다면 예외 발생
			if(message == null) {
				throw new MessageNotFoundException("사용자의 글이 없습니다.:"+messageId);
			}
			if(!message.getGuestName().equals(sessionId) &&
					message.getId()==messageId){
				throw new InvalidMessagePasswordException("유저이름으로 등록된 게시물이 아닙니다");		
					}
			
			//쿼리결과로 나온 guestName과 세션 아이디가 같고 
			//Message_id(쿼리결과)와 입력받은 messageId가 같으면 삭제처리한다.
			if(message.getGuestName().equals(sessionId) &&
					message.getId()==messageId) {
					//삭제처리
					dao.delete(conn,messageId);
			}
			
			
			// 트랜잭션완료 : commit()
			conn.commit();
		} catch (SQLException ex) {
			jdbcUtil.close(conn);
			throw new ServiceException("삭제 처리 중 에러가 발생했습니다:" + ex.getMessage(), ex);	
		} catch(InvalidMessagePasswordException ex) {
			jdbcUtil.rollback(conn);
			throw ex;
		}catch(MessageNotFoundException ex) {
			jdbcUtil.rollback(conn);
			throw ex;
		}finally {
			if(conn != null) {
				try {
					//커넥션 풀 반환
					conn.setAutoCommit(false);
				} catch (SQLException e) { }
				jdbcUtil.close(conn);
			}
		}
	}
}
