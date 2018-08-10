<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/header.jsp" />
	<h1> 방명록 쓰기</h1>
	<form method="POST">
		닉네임  <br/>
		<input type="text" value="${Userinfo.user_id}" name="guestName"disabled="disabled"></input><br />
		<input type="hidden" name="guestName" value="${Userinfo.user_id}">
		암호<br/>
		<input type="password" name="password"/> <br />
		메세지<br/>
		 <textarea name="message" cols="50" row="30"></textarea> <br />
		<input type="submit" value="메시지 남기기" />
	</form>
</body>
</html>