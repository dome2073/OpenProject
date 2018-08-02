<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입성공</h1>

<h3>방법1</h3>
request.getParameter로 가져온 유저 아이디 값 : ${requestID} <br>
request.getParameter로 가져온 유저비밀번호  값 : ${requestPW} <br>
request.getParameter로 가져온 유저 이름  값 : ${requestNAME} <br>
<h3>방법2</h3>
@RequestParam으로 가져온 아이디 값 : ${RequestParamID}<br> 
@RequestParam으로 가져온 비밀번호 값 : ${RequestParamPW}<br>
@RequestParam으로 가져온 이름 값 : ${RequestParamNAME}<br>
<h3>방법3</h3>
자바 빈 객체로 가져온 아이디 값 : ${BeanID} <br>
자바 빈 객체로 가져온 비밀번호 값 : ${BeanPW} <br>
자바 빈 객체로 가져온 이름 값 : ${BeanNAME} <br>
자바 빈 객체 : ${Userinfo} <br>

</body>
</html>