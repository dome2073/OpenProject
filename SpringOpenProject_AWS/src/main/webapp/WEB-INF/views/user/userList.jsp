<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 img{
 	width:100px;
 }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/commons/header.jsp" />
	
	<h1 class="w3-xlarge">회원 목록</h1>
	
	<div class="wrap">
		<div class="wrap-2">
	<c:if test="${userlist.pageTotalCount==0}">
		<h1>등록된 회원이 없습니다.</h1>
	</c:if>
	<c:if test="${!(userlist.pageTotalCount==0)}">
		<table border="1" class="table">
			<tr>
				<td>회원번호</td>
				<td>회원아이디</td>
				<td>비밀번호</td>
				<td>회원명</td>
				<td>출생일</td>
				<td>성별</td>
				<td>이메일</td>
				<td>전화번호</td>
				<td>이미지</td>
				<td colspan="2">관리</td>
			</tr>
			
			<c:forEach items="${userlist.userList}" var="user">
				<tr>
					<td>${user.user_number}</td>
					<td>${user.user_id}</td>
					<td>${user.user_pw}</td>
					<td>${user.user_name}</td>
					<td>${user.user_birth}</td>
					<td>${user.user_gender}</td>
					<td>${user.user_email}</td>
					<td>${user.user_phone}</td>
					<td><img src="<c:url value='/uploadFile/UserPhoto/${user.user_photo}'/>"></td>
					<td><a href="<c:url value='/user/userlist?page=1'/>">[삭제하기]</a></td>
				</tr>
			</c:forEach>
	</table>
	</c:if>
	
	<div class="page">
	<c:forEach var="page" begin="1" end="${userlist.pageTotalCount}">
		<a href="<c:url value='/user/userlist?page=${page}'/>">${page}
	</c:forEach>
	</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/commons/footer.jsp" />
</body>
</html>