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
 #message{
 	border-bottom: 2px solid gray;
 	display: block;
 	
 }
 #guest{
 	border-bottom: 2px solid gray;
 	padding-bottom: 20px;
 }
 .page{
 	margin:0px 47%;
 }
 .write{
 	margin :0px 47%;
 }
 .write2{
 	text-align: center;
 }

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/header.jsp" />
	<div class="wrap">
	<h1 id="guest">방명록</h1>
	
	
	<c:if test="${!(Message.messageTotalCount == 0)}">
		

		<c:forEach items="${Message.messageList}" var="List">
			<table id="message">
				<tr>
				<td>NO.${List.id}<b>${List.guestName}</b></td>
				<td>${List.message_date}</td>											
				<td><a href="<c:url value='/user/messagedelete?id=${List.id}'/>">[삭제하기]<td>
				</tr>	
				<tr>
				<td rowspan="3">${List.message}</td>
				</tr>
			</table>
		</c:forEach>
		
	</c:if>
	</table>
	<c:if test="${Message.messageTotalCount == 0}">
		<h1>아직 등록된 방명록이 없습니다.</h1>
	</c:if>
	
	<div class="page">
	<c:forEach var="page" begin="1" end="${Message.pageTotalCount}">
		<a href="<c:url value='/user/messagelist?page=${page}'/>">${page}
	</c:forEach>
	</div>
	
	<div class= "write">
		<a class="write2" href="<c:url value='/user/messageWrite'/>">글쓰기</a>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/commons/footer.jsp" />
</body>
</html>