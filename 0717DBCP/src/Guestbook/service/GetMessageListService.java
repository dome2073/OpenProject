package Guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import Guestbook.dao.MessageDao;
import Guestbook.model.Message;
import Guestbook.model.MessageListView;
import jdbc.connection.ConnectionProvider;

//방명록에 등록된 글을 보여주는 서비스클래스
//MessageDao에 요청하고 요청받은 값을 view로
public class GetMessageListService {
	// -싱글톤 패턴으로 처리-
	private static GetMessageListService instance = new GetMessageListService();
	
	// 외부에서 메소드를 통해 사용할 수 있게함.
	// 메서드도 같은 이유로 static으로
	public static GetMessageListService getInstance() {
		return instance;
	}
	
	//생성자 은닉 --> 외부클래스에서 생성자 호출 불가능
	private GetMessageListService() {
	}

	// 한 페이지에 보여줄 방명록(게시물)의 수
	private static final int MESSAGE_COUNT_PER_PAGE = 3;

	//현재 페이지에 글을 불러온다.
	//1페이지에 있는 3개의 방명록, 2페이지에 있는 3개의 방명록
	//DB에있는 값을 1페이지는 ROWNUM이 1-3 , 2페이지는 4-6, 3페이지는 7-9
	//사용자가 클릭한 페이지 = pageNumber
	public MessageListView getMessageList(int pageNumber) throws ServiceException {
	
		Connection conn = null;
		MessageDao dao = null;
		
		int currentPageNumber = 1; 
		
		
		if (pageNumber > 0) {
			currentPageNumber = pageNumber;
		}

		try {
			//커넥션 풀에서 생성한 객체를 불러옴
			conn = ConnectionProvider.getConnection();
			//MessageDao 객체를 불러옴. (SQL- CRUD처리 하기위해)
			dao = MessageDao.getInstance();

			// 전체 게시물 개수 count하는 select문 결과를 messageTotalCount에 담음
			// messageTotalCount = 전체 게시물 수
			int messageTotalCount = dao.selectCount(conn);

			// 게시물의 리스트
			List<Message> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			//전체 게시물 수가 1개이상이면 (게시물이 있다면)  
			if (messageTotalCount > 0) { 
				//currentPageNumber : 사용자가 클릭한 페이지
				//1페이지는 1-3, 2페이지는 4-6, 3페이지는 6-9 를 표현하기 위해 만든 변수들
				firstRow = (currentPageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				//해당하는 페이지에 방명록을 보여주는 selectList메서드 호출
				messageList = dao.selectList(conn, firstRow, endRow);
			} else {
				//게시물이 없다면
				currentPageNumber = 0;
				//게시물이 없다는것을 알림
				messageList = Collections.emptyList();
			}
			//messageList : selectList(DAO)에서 반환한 결과를 리스트에 담음 
			//messageTotalCount : 전체 게시물수
			//currentPageNumber : 사용자가 클릭한 페이지
			//MESSAGE_COUNT_PER_PAGE : 한 페이지당 보여줄 방명록 수
			//== MessageListView(생성자)초기화하고 전체 페이지 수를 구하는 메서드를 호출한다.
			return new MessageListView(messageList, messageTotalCount, currentPageNumber, MESSAGE_COUNT_PER_PAGE,
					firstRow, endRow);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

}
