<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/commons/header.jsp" />
	
	<div>
		<h1>로그인페이지</h1>
	
	<form method="POST">
		아이디 : <input type="text" name= "userid">
		비밀번호 : <input type="password" name= "userpw">
	<input type = "submit" value="로그인">
	</form>
	
	</div>
</body>
</html>