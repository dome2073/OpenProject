<%@page import="Users.service.UserInsertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--1.사용자 입력 데이터 받기 (useBean)   -->
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="Users.model.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>

<%
	//처리순서 

//1. 사용자 입력 데이터 받기 (usebeans)
//2. 요구사항을 처리할 서비스 객체 생성(받아오는 것)
//3. 처리요청
//4. 결과 받아서 사용자에게 보여줄 응답 view작성

	
	
	//회원가입성공시 처리할 결과 초기화
	int Okresult = 0;
	
	//2. 서비스객체 불러오기
	UserInsertService userinsert = UserInsertService.getInstance();
	//3. 처리요청(회원가입처리)
	Okresult = userinsert.Register(user);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입처리</title>
</head>
<body>
	<% if ( Okresult > 0) { %>
	<jsp:include page="index.jsp"></jsp:include>
	 <h1>회원가입</h1><br>
	 <h3>회원가입  성공!</h3>
	 <a href ="Login.jsp">로그인 하러가기</a>
	<%} else { %>	
		<jsp:include page="index.jsp"></jsp:include>
	 <h3>회원가입  실패!</h3>
	 <a href ="Login.jsp">로그인 하러가기</a>
	<%} %>
</body>
</html>