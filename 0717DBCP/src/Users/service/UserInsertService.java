package Users.service;

import java.sql.Connection;
import java.sql.SQLException;

import Users.Exception.ServiceException;
import Users.dao.UserDao;
import Users.model.User;
import jdbc.connection.ConnectionProvider;

//회원가입 처리하는 서비스 클래스
public class UserInsertService {
	//싱글톤 패턴
	private static UserInsertService instance = new UserInsertService();
	
	// 외부에서 메소드를 통해 사용할 수 있게함.
	// 메서드도 같은 이유로 static으로
	public static UserInsertService getInstance() throws SQLException{
		return instance;
	}
	//생성자 은닉 --> 외부클래스에서 생성자 호출 불가능
	private UserInsertService() {}
		
	public int Register(User user)throws ServiceException{
		
		Connection conn = null;
		
		try {
			//커넥션 풀 불러오기
			conn = ConnectionProvider.getConnection();
			
			//UserDao 객체를 가져오고
			UserDao userdao = UserDao.getInstance();
			
			//UserDao에게  사용자 입력정보를 보냄
			int OkRegister = userdao.insert(conn,user);
			
			return OkRegister;
				
		}catch(SQLException ex) {
			ex.printStackTrace();
			throw new ServiceException("메시지 등록 실패: " + ex.getMessage(), ex);
		}
	}
}
