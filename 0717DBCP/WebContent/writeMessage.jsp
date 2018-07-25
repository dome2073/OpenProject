<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Guestbook.service.WriteMessageService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GuestBook</title>
</head>

<%
		//데이터 받기, 서비스 객체생성, 메서드를 전달 -> DAO(insert 메서드)
		
		//1. 사용자 입력 데이터 받기 (usebeans)
		//2. 요구사항을 처리할 서비스 객체 생성(받아오는 것)
		//3. 처리요청( service.write 실행)
		//4. 결과 받아서 사용자에게 보여줄 응답 view작성

		request.setCharacterEncoding("utf-8");
	%>
<!-- 1.사용자 입력 데이터받기 (usebeans) -->
<jsp:useBean id="message" class="Guestbook.model.Message"></jsp:useBean>
<jsp:setProperty property="*" name="message" />
<%
	System.out.println("빈즈아이디"+message.getId());
	System.out.println("빈즈비밀번호"+message.getPassword());
	int resultCnt = 0;
	//객체불러옴
	WriteMessageService service = WriteMessageService.getInstance();
	//메세지를 등록하고 int형 값 반환
	resultCnt = service.write(message);
%>
<body>
	<% if ( resultCnt > 0) { %>
		<h1> 
			방명록 메시지가 작성되었습니다. 
			<br> 
			<a href="list.jsp">리스트 보기</a>
		</h1>
	<%} else { %>	
		<h1> 
			메시지 정상적으로 작성되지 않았습니다. 
			<br> 
			<a href="list.jsp">리스트 보기</a>
		</h1>
	<%} %>
</body>
</html>