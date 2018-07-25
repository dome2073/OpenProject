package Users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import Users.model.User;
import jdbcs.jdbcUtil;

public class UserDao {
	// DAO 클래스는 기능 클래스 - 여러개의 인스턴스 생성이 불필요
	// -싱글톤 패턴으로 처리-

	// 1. 생성자 은닉 --> 외부클래스에서 생성자 호출 불가능
	private UserDao() {
	}

	// 2.인스턴스 생성 : 1개만 생성하고 공유해서 사용
	// static을 사용하지않으면 초기화시점이 달라서 사용불가
	// 내부적으로만 사용할 수 있게 private
	private static UserDao instance = new UserDao();

	public static UserDao getInstance() {
		return instance;
	}

	// Register서비스 클래스에서 DB에 데이터저장요청
	// 회원가입 성공시 출력화면을 보여주기 위해 int 형반환
	public int insert(Connection conn, User user) throws SQLException {
		// TODO Auto-generated method stub
		// PreparedStatement초기화
		PreparedStatement pstmt = null;

		// SQL문 정의 (회원가입 - INSERT)
		String SQL = "insert into users values(?,?,?,?,?,?,?,user_num_sequence.nextval)";

		try {
			pstmt = conn.prepareStatement(SQL);

			// PrepareStatement(?) 값 안에 차례대로 값을 넣음
			// 사용자가 회원가입에서 입력한 것을 User객체에 담은것을 매개변수로
			pstmt.setString(1, user.getUser_id());
			pstmt.setString(2, user.getUser_pw());
			pstmt.setString(3, user.getUser_name());
			pstmt.setString(4, user.getUser_birth2());
			pstmt.setString(5, user.getUser_gender());
			pstmt.setString(6, user.getUser_email());
			pstmt.setString(7, user.getUser_phone());

			return pstmt.executeUpdate();

		} finally {
			// 커넥션 풀 반환
			jdbcUtil.close(pstmt);
		}

	}

	public int login(Connection conn, String userid, String userpw) throws SQLException {
		// PreparedStatement초기화

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String SQL = "select user_id,user_pw from users where user_id=?";

		try {
			// SQL실행
			pstmt = conn.prepareStatement(SQL);
			// PrepareStatement(?) 값 안에 입력받은 userid를 넣음
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			// 아이디가 있는경우
			if (rs.next()) {
				// 사용자가 입력한 비밀번호와 DB에 저장된 비밀번호가 같은지 확인
				if (rs.getString("user_pw").equals(userpw)) {
					// 맞을 경우 1반환
					return 1;
				} else {// 일치하지 않을경우
						// 틀릴경우 0반환
					return 0;
				}
			} // 아이디가 없을경우
				// 0 반환
			return 0;

		} finally {
			// TODO: handle finally clause
			// 커넥션 풀 반환
			jdbcUtil.close(pstmt);
			jdbcUtil.close(rs);
		}

	}

	// 전체 회원수를 구함
	public int UserCount(Connection conn) throws SQLException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet rs = null;

		// 회원 수를 구하는 쿼리
		String SQL = "select count(*) from users";

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(SQL);

			rs.next();
			// 회원 수 결과를 출력
			return rs.getInt(1);
		} finally {
			jdbcUtil.close(stmt);
		}
	}

	public List<User> UserList(Connection conn, int firstRow, int endRow) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<User> UserList = null;

		String SQL = "select * from " + "(select * " + "from (select * from users u order by u.user_number asc) "
				+ "where rownum <=?)" + "where rownum >=?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				UserList = new ArrayList<>();
				do {
					UserList.add(makeUserFromResultSet(rs));
				} while (rs.next());
			} else {
				UserList = Collections.emptyList();
			}
			return UserList;
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}

	}

	private User makeUserFromResultSet(ResultSet rs) throws SQLException {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUser_id(rs.getString(1));
		user.setUser_pw(rs.getString(2));
		user.setUser_name(rs.getString(3));
		user.setUser_birth(rs.getString(4));
		user.setUser_gender(rs.getString(5));
		user.setUser_email(rs.getString(6));
		user.setUser_phone(rs.getString(7));
		return user;
	}

	// 사용자 로그인정보 불러오기 (세션용)
	public List<User> Logininfo(Connection conn,String userid) throws SQLException {
		// PreparedStatement초기화

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<User> UserList = null;

		String SQL = "select * from users where user_id=?";

		try {
			// SQL실행
			pstmt = conn.prepareStatement(SQL);
			// PrepareStatement(?) 값 안에 입력받은 userid를 넣음
			// 해당아이디의 정보를 불러옴
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			// 앞에서 검사했으므로 진행
			if (rs.next()) {
				UserList = new ArrayList<>();
				do {
					UserList.add(makeUserFromResultSet(rs));
				} while (rs.next());
			 } else {
				UserList = Collections.emptyList();
			}
			return UserList;
		} finally {
			// TODO: handle finally clause
			// 커넥션 풀 반환
			jdbcUtil.close(pstmt);
			jdbcUtil.close(rs);
		}

	}
}