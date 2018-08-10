<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
	width:100%
}
.wrap{
	margin:0px 40%;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/commons/header.jsp" />
	<div class="wrap">
	<c:if test="${loginchk==true}">
		<h1>로그인 성공</h1>
		<h3>${userid} 님이 접속하셨습니다.</h3>
	</c:if>
	
	<c:if test="${loginchk==false}"><h1>로그인 실패입니당</h1></c:if>
	
	</div>
	
	<jsp:include page="/WEB-INF/views/commons/footer.jsp" />
</body>
</html>