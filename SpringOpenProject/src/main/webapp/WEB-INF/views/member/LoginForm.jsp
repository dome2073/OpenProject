<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>네이버: 로그인</title>
    <!-- url쓰면 컨텍스트경로가 필요없다. -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/login.css"></c:url>">
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/header.jsp"></jsp:include>	
   <div id="wrap">
       <div id="header">
        <h1><a href="#" id="logo">NAVER</a></h1>
    </div>
    <div id="content">  	
        <form action="member/login" method="post">
            <div id="divtext"><input type="text" id="text1" name="userid"></div>
            <input type="hidden" name ="noid" value="1">
            <div id="divtext"><input type="password" id="text1" name="userpw"></div>
            <input type="hidden" name ="nopw">
            <input type="submit" id="login" value="로그인"><br/>
            <input type="checkbox" id="logincheck" name="check" value="1"><label for="logincheck">아이디 저장</label> 
            <a id="register" href="Register">회원가입</a>
        </form>
    </div>
    <div id="hiddendiv" name="hiddens" value=""></div>
     
</div>
</body>
</html>