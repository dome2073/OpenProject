<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/commons/header.jsp" />
	
	<h1>회원가입 페이지</h1>
	
	<form method="post" enctype="multipart/form-data">
	아이디 <input type="text" name = "user_id"><br>
	비밀번호 <input type="password" name = "user_pw"><br>
	비밀번호 확인 <input type="password" name = "user_pw1"><br>
	이름 <input type="text" name = "user_name"><br>
	생년월일<input type="text" name = "user_birth"><br>
	성별 - 남자<input type = "checkbox" name ="user_gender" value="남자">
	           여자 <input type = "checkbox" name ="user_gender" value="여자"><br>
	이메일  <input type="text" name = "user_email"><br>
	휴대전화  <input type="text" name = "user_phone"><br>
	<input type = "submit" value = "가입하기">
	사진  <input type="file" name="photoFile">
	</form>
	
	
</body>
</html>