package Users.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import Users.Exception.ServiceException;
import Users.dao.UserDao;
import Users.model.User;
import jdbc.connection.ConnectionProvider;

public class UserLoginService {
	private static UserLoginService instance = new UserLoginService();
	
	// 외부에서 메소드를 통해 사용할 수 있게함.
	// 메서드도 같은 이유로 static으로
	public static UserLoginService getInstance() throws SQLException{
		return instance;
	}
	//생성자 은닉 --> 외부클래스에서 생성자 호출 불가능
	private UserLoginService() {}		
	
	public int loginCheck(String userid, String userpw)throws ServiceException{
		
		Connection conn = null;
		try {
			//커넥션 풀 불러오기
			conn = ConnectionProvider.getConnection();
			//UserDao 객체 불러오기
			UserDao userdao = UserDao.getInstance();
			
			//userdao에서 받은 결과를 저장
			//1 : 사용자 정보일치
			//0 : 일치하지 않은 경우
			//-1 : 아이디가 없을 경우
			int OkLogin = userdao.login(conn,userid,userpw);
			
			if(OkLogin==1) {
				return 1;
			}
			if(OkLogin==0) {
				return 0;
			}
			return 0;
				
			//UserDao에게 로그
		}catch(SQLException ex){
			ex.printStackTrace();
			throw new ServiceException("로그인실패 " + ex.getMessage(), ex);
		}
	}
	public List<User> login(String userid)throws ServiceException{
		
		Connection conn = null;
		List<User> Userinfo = null;
		
		try {
			//커넥션 풀 불러오기
			conn = ConnectionProvider.getConnection();
			//UserDao 객체 불러오기
			UserDao userdao = UserDao.getInstance();
			
			Userinfo = userdao.Logininfo(conn,userid);
			
			return Userinfo;
			//UserDao에게 로그
		}catch(SQLException ex){
			ex.printStackTrace();
			throw new ServiceException("로그인실패 " + ex.getMessage(), ex);
		}
	}
}
