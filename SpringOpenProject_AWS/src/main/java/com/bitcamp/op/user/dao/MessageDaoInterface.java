package com.bitcamp.op.user.dao;

import java.util.List;

import com.bitcamp.op.user.model.MessageVO;

public interface MessageDaoInterface {
	
	//방명록 등록
	public int MessageInsert(MessageVO messageVO);
	// 전체 개시물 개수를 카운트
	public int selectCount();
	//해당 페이지의 방명록을 보임
	public List<MessageVO> selectList(int firstRow, int endRow);
	//
	public MessageVO MessageSelect(int messageId);
	//해당 방명록 삭제
	public void MessageDelete(int messageId);
	
}
