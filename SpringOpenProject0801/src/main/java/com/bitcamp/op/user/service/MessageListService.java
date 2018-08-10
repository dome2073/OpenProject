package com.bitcamp.op.user.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.op.user.dao.MessageDaoInterface;
import com.bitcamp.op.user.model.MessageListVO;
import com.bitcamp.op.user.model.MessageVO;


public class MessageListService {

	// @주입
	@Autowired
	SqlSessionTemplate template;

	private MessageDaoInterface MessageDao;

	// 한 페이지에 보여줄 방명록(게시물)의 수 (3)
	private static final int MESSAGE_COUNT_PER_PAGE = 3;

	public MessageListVO getMessageList(int pageNumber) {

		MessageDao = template.getMapper(MessageDaoInterface.class);

		int currentPageNumber = 1;

		if (pageNumber > 0) {
			currentPageNumber = pageNumber;
		}

		// 전체 게시물 개수 count하는 select문 결과를 messageTotalCount에 담음
		// messageTotalCount = 전체 게시물 수
		int messageTotalCount = MessageDao.selectCount();
		
		// 게시물의 리스트
		List<MessageVO> messageList = null;
		
		int firstRow = 0;
		int endRow = 0;
		
		//전체 게시물 수가 1개이상이면 (게시물이 있다면)  
		if (messageTotalCount > 0) { 
			//currentPageNumber : 사용자가 클릭한 페이지
			//1페이지는 1-3, 2페이지는 4-6, 3페이지는 6-9 를 표현하기 위해 만든 변수들
			firstRow = (currentPageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
			endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
			//해당하는 페이지에 방명록을 보여주는 selectList메서드 호출
			messageList = MessageDao.selectList(firstRow, endRow);
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
		return new MessageListVO(messageList, messageTotalCount, currentPageNumber, MESSAGE_COUNT_PER_PAGE,
				firstRow, endRow);
	}
}
