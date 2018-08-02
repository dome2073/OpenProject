<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${loginInfo.memberPhoto ne null}">
<c:url var="myImg" value="/uploadFile/memberPhoto/${loginInfo.memberPhoto}"/>
</c:if>
<c:if test="${loginInfo.memberPhoto eq null}">
<c:url var="myImg" value="/img/no_img.png"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PROJECT</title>
<link href="<c:url value='/css/default.css'/>" rel="stylesheet">
<style>
td {
	padding: 10px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/commons/header.jsp" />
	<div id="contents">
		<h3>회원 마이페이지</h3>
		<hr>
		<div style="width: 300px; margin: 15px auto;">
			<div
				style="width: 200px; height: 200px; background-color: aqua; border: 1px solid #DDDDDD; margin: 15px auto; border-radius: 100px;background-image: url('${myImg}'); background-size: 100%"></div>
			<table width="100%">
				<tr>
					<td>회원번호</td>
					<td>${loginInfo.mIdx}</td>
				</tr>
				<tr>
					<td>회원아이디</td>
					<td>${loginInfo.memberId}</td>
				</tr>
				<tr>
					<td>회원이름</td>
					<td>${loginInfo.memberName}</td>
				</tr>
			</table>
		</div>

	</div>
</body>
</html>