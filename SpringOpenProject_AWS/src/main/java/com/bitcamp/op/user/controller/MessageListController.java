package com.bitcamp.op.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.op.user.model.MessageListVO;
import com.bitcamp.op.user.model.MessageVO;
import com.bitcamp.op.user.model.UserVO;
import com.bitcamp.op.user.service.MessageDeleteService;
import com.bitcamp.op.user.service.MessageListService;
import com.bitcamp.op.user.service.MessageWriteService;


@Controller
public class MessageListController {

	@Autowired
	MessageListService messageListService;
	@Autowired
	MessageWriteService messageWriteService;
	@Autowired
	MessageDeleteService messageDeleteService;
	
	///user/messagelist
	@RequestMapping("/user/messagelist")
	public String messagelist(@RequestParam(value = "page", required = false) String pageNumStr, Model model) {
		MessageListVO messagelist = null;

		int pageNumber = 1;

		if (pageNumStr != null) {
			pageNumber = Integer.parseInt(pageNumStr);
		}

		messagelist = messageListService.getMessageList(pageNumber);
		
		model.addAttribute("Message", messagelist);
		
		System.out.println(messagelist);
		
		return "user/MessageList";
	}
	
	@RequestMapping(value="/user/messageWrite",method=RequestMethod.GET)
	public String messageWriteForm(HttpSession session,Model model) {
		
		UserVO info = (UserVO)session.getAttribute("loginInfo");
		
		model.addAttribute("Userinfo",info);
		
		return "user/MessageWrite";
	
	}
	@RequestMapping(value="/user/messageWrite",method=RequestMethod.POST)
	public String messageWrite(MessageVO messageVO, Model model) {
		
		int messageWrite = messageWriteService.write(messageVO);
		
		model.addAttribute("insertCnt", messageWrite);
		
		
		return "user/MessageWriteOK";
	}
	
	//메세지 삭제 요청
	@RequestMapping("/user/messagedelete")
	public String messageDelete(@RequestParam("id")int messageId,HttpSession session,Model model){
		
		UserVO info = (UserVO)session.getAttribute("loginInfo");
		//결과 - result
		int result = messageDeleteService.deleteMessage(messageId, info.getUser_id());
		
		model.addAttribute("result", result);
		
		//메세지 삭제 완료 페이지
		return "user/MessageDelete";
		
		
	}

}
