<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<% 		
		//1. 세션있는지 확인 (로그인이 되어있는지)
		String sessonId = (String)session.getAttribute("MEMBERID");
		%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 남기기</title>

</head>
<body>
<jsp:include page="index.jsp"></jsp:include>
	<div class = "wrap">
	<h1> 방명록 쓰기</h1>
	<form action="writeMessage.jsp" method="post">
	
		닉네임  <br/>
		<input type="text" value="<%=sessonId%>" name="guestName"disabled="disabled"></input><br />
		<input type="hidden" name="guestName" value="<%=sessonId%>">
		암호<br/>
		<input type="password" name="password"/> <br />
		메세지<br/>
		 <textarea name="message" cols="50" row="30"></textarea> <br />
		<input type="submit" value="메시지 남기기" />
	</form>
	</div>
</body>
</html>