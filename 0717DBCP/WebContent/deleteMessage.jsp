<%@page import="Guestbook.service.InvalidMessagePasswordException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="Guestbook.service.DeleteMessageService" %>
<%@ page import="Guestbook.service.InvalidMessagePasswordException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	//세션 id, 게시물 번호 를 받아옴
	String sessionId = (String)session.getAttribute("MEMBERID");
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	
	boolean invalidPassowrd = false;
	
	System.out.println(sessionId);
	System.out.println(messageId);
	

	 //2. 요청의 처리를 위한 서비스 객체 생성
	DeleteMessageService deleteService = DeleteMessageService.getInstance();
	
	try{
		//3.삭제요청
		//사용자가 입력한 데이터를 매개변수로 삭제요청보냄
		deleteService.deleteMessage(messageId,sessionId);
	}catch(InvalidMessagePasswordException ex){
			invalidPassowrd =true;
	} 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 삭제</title>
</head>
<body>

	<% if (!invalidPassowrd) { %>
	메시지를 삭제하였습니다.
<% } else { %>
	다른 사용자의 글은 삭제할 수 없습니다.
<% }%>
<br/>
<a href="GuestList.jsp">[목록 보기]</a>
</body>
</html>