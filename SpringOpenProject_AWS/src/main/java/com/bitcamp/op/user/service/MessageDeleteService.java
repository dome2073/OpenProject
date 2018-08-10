package com.bitcamp.op.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.op.user.dao.MessageDaoInterface;
import com.bitcamp.op.user.model.MessageVO;


public class MessageDeleteService {

	// @주입
	@Autowired
	SqlSessionTemplate template;

	private MessageDaoInterface MessageDao;

	public int deleteMessage(int messageId, String sessionId) {
		
		MessageDao = template.getMapper(MessageDaoInterface.class);
		
		MessageVO messageVO = null;

		// 1. 메세지 객체 검색 (select 메서드 호출) messageId - SQL문에 들어감 pstmt.setInt(1,
		// 삭제 클릭한 글의 정보를 검색함
		// message 객체에 글의 정보를 담음
		// message_id, guest_name , password, massage
		messageVO = MessageDao.MessageSelect(messageId);
		System.out.println(messageVO);
		// 게시물 유무 확인 : 게시물이 없음
		if (messageVO == null) {
			
			return 0;
		}
		//아이디랑 비밀번호가 일치하지않은경우
		if(!messageVO.getGuestName().equals(sessionId) &&
				messageVO.getId()==messageId) {
			
			return -1;
		}
		//Message_id(쿼리결과)와 입력받은 messageId가 같으면 삭제처리한다.
		if(messageVO.getGuestName().equals(sessionId) &&
				messageVO.getId()==messageId) {
				//삭제처리
			
				MessageDao.MessageDelete(messageId);
				
				return 1;
		}

		return 2;
	}
	
}
