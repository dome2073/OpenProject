<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 성공</h1>
<h3>방법1</h3>
request.getParameter로 가져온 아이디 값 : ${requestID} <br>
request.getParameter로 가져온 비밀번호  값 : ${requestPW} <br>
<h3>방법2</h3>
@RequestParam으로 가져온 아이디 값 : ${RequestParamID}<br> 
@RequestParam으로 가져온 비밀번호 값 : ${RequestParamPW}<br>
<h3>방법3</h3>
자바 빈 객체로 가져온 아이디 값 : ${BeanId} <br>
자바 빈 객체로 가져온 비밀번호 값 : ${BeanPw} <br>
자바 빈 객체 : ${Logininfo} <br>

</body>
</html>