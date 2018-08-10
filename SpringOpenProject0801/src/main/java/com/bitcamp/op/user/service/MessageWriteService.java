package com.bitcamp.op.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.bitcamp.op.user.dao.MessageDaoInterface;
import com.bitcamp.op.user.model.MessageVO;



public class MessageWriteService {
	
	// @주입
	@Autowired
	SqlSessionTemplate template;

	private MessageDaoInterface MessageDao;
	
	public int write(MessageVO messageVO) {
		
		int resultCnt =0;
		
		MessageDao = template.getMapper(MessageDaoInterface.class);
		
		resultCnt = MessageDao.MessageInsert(messageVO);
		
		
		return resultCnt;
	}
}
