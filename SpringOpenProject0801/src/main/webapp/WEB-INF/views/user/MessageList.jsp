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
	<h1>방명록</h1>
	<c:if test="${!(Message.messageTotalCount == 0)}">
		<table border="1">
		<tr>
			<td>게시물번호</td>
			<td>닉네임</td>
			<td>남긴 말</td>
			<td colspan="2">관리</td>			
		</tr>
		
		<c:forEach items="${Message.messageList}" var="List">
				<tr>
				<td>${List.id}</td>
				<td>${List.guestName}</td>
				<td>${List.message}</td>											
				<td><a href="<c:url value='/user/messagedelete?id=${List.id}'/>">[삭제하기]<td>
				</tr>
				
				
			</c:forEach>
		
		</c:if>
	</table>
	<c:if test="${Message.messageTotalCount == 0}">
		<h1>아직 등록된 방명록이 없습니다.</h1>
	</c:if>
	
	<c:forEach var="page" begin="1" end="${Message.pageTotalCount}">
		<a href="<c:url value='/user/messagelist?page=${page}'/>">${page}
	</c:forEach>
	
	<br><a href="<c:url value='/user/messageWrite'/>">글쓰기</a>
</body>
</html>