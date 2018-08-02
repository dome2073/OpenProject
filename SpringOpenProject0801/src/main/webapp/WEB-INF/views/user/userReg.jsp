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
	<c:if test="${insertCnt>0 }">
		<h1>회원가입 성공 페이지</h1>
		<h3>${user}</h3>
	</c:if>
	<c:if test="${!(insertCnt>0) }">
		<h1>회원가입 실패!</h1>
	</c:if>
</body>
</html>