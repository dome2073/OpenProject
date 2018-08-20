<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Header</title>
<style>

</style>
</head>
<body>
	<div class="w3-top">
		<div class="w3-bar w3-black w3-card">
			<a
				class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right"
				href="javascript:void(0)" onclick="myFunction()"
				title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> 
				<a href="<c:url value='/'/>"
				class="w3-bar-item w3-button w3-padding-large">홈</a> 
				<a href="<c:url value='/movie/movie'/>"
				class="w3-bar-item w3-button w3-padding-large w3-hide-small">영화</a>
			<a href="<c:url value='/movie/movie'/>"
				class="w3-bar-item w3-button w3-padding-large w3-hide-small">예매</a>
			<a href="<c:url value='/movie/movie'/>" 
				class="w3-bar-item w3-button w3-padding-large w3-hide-small">리뷰</a>
			<!-- 세션이 없는 경우(로그인을 하지 않은 경우) -->
			<c:if test="${loginInfo eq null}">
				<a href="<c:url value='/user/login'/>"
					class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그인</a>
				<a href="<c:url value='/user/reg'/>"
					class="w3-bar-item w3-button w3-padding-large w3-hide-small">회원가입</a>
			</c:if>
			<div class="w3-dropdown-hover w3-hide-small">

				<!-- 세션이 있는 경우 로그인을 한 경우 -->
				<c:if test="${loginInfo ne null }">	
					<button class="w3-padding-large w3-button" title="More">
						${loginInfo.user_name}님 <i class="fa fa-caret-down"></i>
					</button>
					<c:if test="${loginInfo.user_id ne 'master'}">
						<div class="w3-dropdown-content w3-bar-block w3-card-4">
							<a href="<c:url value='/user/logout'/>"
								class="w3-bar-item w3-button">로그아웃</a> <a
								href="<c:url value='/user/mypage'/>"
								class="w3-bar-item w3-button">회원정보수정</a> 
								<a href="<c:url value='/user/delete'/>"
								class="w3-bar-item w3-button">회원탈퇴</a>
						</div>
					</c:if>

					<c:if test="${loginInfo.user_id eq 'master'}">
						<div class="w3-dropdown-content w3-bar-block w3-card-4">
							<a href="<c:url value='/user/logout'/>"
								class="w3-bar-item w3-button">로그아웃</a> <a
								href="<c:url value='/user/mypage'/>"
								class="w3-bar-item w3-button">회원정보수정</a>

							<!-- 관리자일 경우에는 회원리스트를 출력 -->
							<a href="<c:url value='/user/userlist'/>"
								class="w3-bar-item w3-button">회원리스트</a> 
						</div>
					</c:if>
				</c:if>
			</div>
			<a href="javascript:void(0)"
				class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i
				class="fa fa-search"></i></a>
		</div>
	</div>
</body>
</html>