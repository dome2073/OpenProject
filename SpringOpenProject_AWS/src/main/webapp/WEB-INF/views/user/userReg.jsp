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
	<c:if test="${insertCnt>0}">
		<h1>회원가입 성공 페이지</h1>
		<h3>${user_id} 님 회원가입을 축하합니다.</h3>
	</c:if>
	<c:if test="${!(insertCnt>0) }">
		<h1>회원가입 실패!</h1>
	</c:if>
	
		</div>
	<jsp:include page="/WEB-INF/views/commons/footer.jsp" />
</body>
</html>