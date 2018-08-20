<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<style>
img {
	width: 95px;
}
.tb{
	margin: 0 auto;
}
td{
	width:100px;
	height:70px;
}
tr:nth-child(1) {
	background-color: antiquewhite;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/commons/header.jsp" />

	<div class="w3-content" style="max-width: 2000px; margin-top: 46px">
		<div class="mySlides w3-display-container w3-center">
			<h1>회원리스트</h1>

		</div>
		
			<table class="tb">

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
						<td><img
							src="<c:url value='/uploadFile/UserPhoto/${user.user_photo}'/>"></td>
						<td><a href="<c:url value='/user/userdelete?user_number=${user.user_number}'/>">[삭제하기]</a></td>
					</tr>
				</c:forEach>

			</table>
		</div>

		<div class="w3-container w3-content w3-center w3-padding-64"
			style="max-width: 800px" id="band">
			<c:forEach var="page" begin="1" end="${userlist.pageTotalCount}">
				<a href="<c:url value='/user/userlist?page=${page}'/>">${page}
			</c:forEach>
		</div>

	</div>
</body>
</html>