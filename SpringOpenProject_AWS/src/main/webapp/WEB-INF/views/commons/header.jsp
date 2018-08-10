<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>고양이갤러리</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

</style>
</head>
<body>

<!-- Header -->
<header class="w3-panel w3-center w3-opacity" style="padding:50px 16px">
  <h1 class="w3-xlarge">OPEN PROJECT</h1>
  <h1>Jeong Dae Yoon</h1>
  
  <div class="w3-padding-32">
    <div class="w3-bar w3-border">
      <a href="<c:url value='/' />" class="w3-bar-item w3-button">홈</a>
      <c:if test="${loginInfo eq null}">
    	  <a href="<c:url value='/user/login'/>" class="w3-bar-item w3-button w3-light-grey">로그인</a>
      </c:if>
      <c:if test="${loginInfo ne null }">
     	 <a href="<c:url value='/user/logout'/>" class="w3-bar-item w3-button">로그아웃</a>
      </c:if>	
      <a href="<c:url value='/user/reg'/>" class="w3-bar-item w3-button w3-hide-small">회원가입</a>
      <a href="<c:url value='/user/mypage'/>" class="w3-bar-item w3-button w3-hide-small">마이페이지</a>
      <a href="<c:url value='/user/userlist'/>" class="w3-bar-item w3-button w3-hide-small">회원리스트</a>
      <a href="<c:url value='/user/messagelist'/>" class="w3-bar-item w3-button w3-hide-small">방명록</a>
      
    </div>
  </div>
</header>

  <%-- <div class="headbanner">
      <ul>
          
         	<li class="banner"><a href="<c:url value='/' />">홈</a></li>
         	<c:if test="${loginInfo eq null}">
    		<li class="banner"><a href="<c:url value='/user/login'/>">로그인</a></li>         	
         	</c:if>
         	<c:if test="${loginInfo ne null }">
         		<li class="banner"><a href="<c:url value='/user/logout'/>">로그아웃</a></li>
         	</c:if>
   			<li class="banner"><a href="<c:url value='/user/reg'/>">회원가입</a></li>
   			<li class="banner"><a href="<c:url value='/user/mypage'/>">마이페이지</a></li>
           	<li class="banner"><a href="<c:url value='/user/userlist'/>">회원리스트</a></li>
           	<li class="banner"><a href="<c:url value='/user/messagelist'/>">방명록</a></li>
        
        </ul>
    </div> --%>
    

</body>
</html>