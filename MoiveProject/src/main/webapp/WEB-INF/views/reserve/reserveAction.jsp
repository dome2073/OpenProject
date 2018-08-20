<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
a {
	text-decoration: none;
}

@import url(https://fonts.googleapis.com/css?family=Arvo:700);

@import url(https://fonts.googleapis.com/css?family=Seaweed+Script);

body {
	background-color: #222;
}

.plate {
	width: 800px;
	margin: 10% auto;
}

.shadow {
	color: #fff;
	font-family: Arvo;
	font-weight: bold;
	text-shadow: -3px -3px 0 #222, 3px -3px 0 #222, -3px 3px 0 #222, 3px 3px
		0 #222, 4px 4px 0 #fff, 5px 5px 0 #fff, 6px 6px 0 #fff, 7px 7px 0 #fff;
	line-height: 0.8em;
	letter-spacing: 0.1em;
	transform: scaleY(0.7);
	-webkit-transform: scaleY(0.7);
	-moz-transform: scaleY(0.7);
	margin: 0;
	text-align: center;
}

.script {
	font-family: "Seaweed Script";
	color: #fff;
	text-align: center;
	font-size: 40px;
	position: relative;
	margin: 0;
}

.script span {
	background-color: #222;
	padding: 0 0.3em;
}

.script:before {
	content: "";
	display: block;
	position: absolute;
	z-index: -1;
	top: 50%;
	width: 100%;
	border-bottom: 3px solid #fff;
}

.text1 {
	font-size: 60px;
}

.text2 {
	font-size: 169px;
}

.text3 {
	font-size: 100px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="plate">
		<p class="script">
			<span></span>
		</p>
		<p class="shadow text1">${reservation.user_id}님
		</p>
		<p class="shadow text2">${reservation.seats_id}번
		</p>
		<p class="shadow text3">좌석 예약되었습니다.</p>
		<p class="script">
			<span><a href="<c:url value='/' />" style="color: white">메인페이지</a></span>
		</p>
	</div>

</body>
</html>