<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	
	.wrap{
		width:100%;
	}
	.wrap-2{
		margin:0px 35%;
	}
	img{
		width:300px;
		height:100px;
	}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/commons/header.jsp" />
	<div class="wrap">
		<div class=wrap-2>
		<h1>마이페이지</h1>	
		<img src="<c:url value='/uploadFile/UserPhoto/${Userinfo.user_photo}'/>"><br>
		유저아이디 : ${Userinfo.user_id}<br>
		유저이름 : ${Userinfo.user_name}<br>
		유저이메일 : ${Userinfo.user_email}<br>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/commons/footer.jsp" />
</body>
</html>