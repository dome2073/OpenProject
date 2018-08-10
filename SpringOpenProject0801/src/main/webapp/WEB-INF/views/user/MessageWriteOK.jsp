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
	<c:if test="${insertCnt>0}">
		<h1>방명록 글 등록 성공</h1>
	</c:if>
	<c:if test="${!(insertCnt>0) }">
		<h1>방명록 글 등록 실패!</h1>
	</c:if>
	
</body>
</html>