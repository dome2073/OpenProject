package Users.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import Users.Exception.ServiceException;
import Users.dao.UserDao;
import Users.model.User;
import Users.model.UserListView;
import jdbc.connection.ConnectionProvider;

public class UserListService {
	private static UserListService instance = new UserListService();
	
	// 외부에서 메소드를 통해 사용할 수 있게함.
	// 메서드도 같은 이유로 static으로
	public static UserListService getInstance() throws SQLException{
		return instance;
	}
	//생성자 은닉 --> 외부클래스에서 생성자 호출 불가능
	private UserListService() {}
	
	//한 페이지에 보여줄 회원정보 수 (5)
	private static final int USER_COUNT_PER_PAGE = 5;
	
	public UserListView getUserlist(int pageNumber) throws ServiceException{
		
		Connection conn = null;
		
		int currentPageNumber = 1;
		
		if(pageNumber > 0) {
			currentPageNumber = pageNumber;
		}
		try {
			conn = ConnectionProvider.getConnection();
			UserDao userdao = UserDao.getInstance();
			
			//회원 수 를 구함
			int UserTotalCount = userdao.UserCount(conn);
			
			List<User> UserList = null;
			int firstRow = 0;
			int endRow = 0;
			
			if(UserTotalCount >0) {
				firstRow = (currentPageNumber - 1) * USER_COUNT_PER_PAGE + 1;
				endRow = firstRow + USER_COUNT_PER_PAGE - 1;
				UserList = userdao.UserList(conn, firstRow, endRow);
			}else {
				//초기화
				currentPageNumber = 0;
				// 회원목록이 비어있으므로 빈값 반환
				UserList = Collections.emptyList();
			}
			
			//얻은 값으로 생성자 초기화
			return new UserListView(UserList,UserTotalCount,currentPageNumber
					,USER_COUNT_PER_PAGE,firstRow,endRow);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
		
	}
	
	 
}

