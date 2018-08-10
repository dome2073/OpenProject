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
	<c:if test="${result==1}">
		<h1>메세지 삭제 성공!</h1>
	</c:if>
	
	<c:if test="${result==0}">
		<h1>삭제할 게시물이 없음</h1>
	</c:if>

	<c:if test="${result==-1}">
		<h1>자신의 글만 삭제할 수 있습니다</h1>
	</c:if>
	
	<c:if test="${result==2}">
		<h1>데이터베이스오류</h1>
	</c:if>
	
	
	
	
	
</body>
</html>