package Guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import Guestbook.dao.MessageDao;
import Guestbook.model.Message;
import jdbc.connection.ConnectionProvider;

//방명록에 글을 등록시켜주는 서비스 클래스 
public class WriteMessageService {
	//싱글톤 패턴
	private static WriteMessageService instance = new WriteMessageService();

	// 외부에서 메소드를 통해 사용할 수 있게함.
	// 메서드도 같은 이유로 static으로
	public static WriteMessageService getInstance() {
		return instance;
	}
	
	//생성자 은닉 --> 외부클래스에서 생성자 호출 불가능
	private WriteMessageService() {
	}
	
	public int write(Message message) throws ServiceException { 
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MessageDao dao = MessageDao.getInstance();
			
			int resultCnt = dao.insert(conn, message);
			
			return resultCnt;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServiceException("메시지 등록 실패: " + e.getMessage(), e);
			
		}
		
		
	}
}












