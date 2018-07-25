<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8");%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>네이버: 로그인</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>
   <div id="wrap">
       <div id="header">
        <h1><a href="#" id="logo">NAVER</a></h1>
    </div>
    <div id="content">  	
        <form action="loginAction.jsp" method="post">
            <div id="divtext"><input type="text" id="text1" name="userid"></div>
            <input type="hidden" name ="noid" value="1">
            <div id="divtext"><input type="password" id="text1" name="userpw"></div>
            <input type="hidden" name ="nopw">
            <input type="submit" id="login" value="로그인"><br/>
            <input type="checkbox" id="logincheck" name="check" value="1"><label for="logincheck">아이디 저장</label> 
            <a id="register" href="Register2.jsp">회원가입</a>
        </form>
    </div>
    <div id="hiddendiv" name="hiddens" value=""></div>
    
    <h1>업데이트되어버림</h1>
</div>
</body>
</html>