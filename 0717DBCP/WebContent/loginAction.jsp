<%@page import="java.io.PrintWriter"%>
<%@page import="Users.service.UserLoginService"%>
<%@page import="Users.model.User"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--1.사용자 입력 데이터 받기 (useBean)   -->
<jsp:useBean id="user" class="Users.model.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	//처리순서 

	//1. 사용자 입력 데이터 받기 (usebeans)
	//2. 요구사항을 처리할 서비스 객체 생성(받아오는 것)
	//3. 처리요청
	//4. 결과 받아서 사용자에게 보여줄 응답 view작성
	
	//로그인 처리결과를 받을 변수 초기화
	int OkLogin;

	//1 : 사용자 정보일치
	//0 : 일치하지 않은 경우 (아이디 또는 비밀번호가 틀린경우)
	System.out.println(userid);
	System.out.println(userpw);
	//2. 서비스객체 불러오기
	UserLoginService userlogin = UserLoginService.getInstance();
	
	//3. 처리요청(로그인 결과)
	OkLogin = userlogin.loginCheck(userid, userpw);
	System.out.println(OkLogin);
		
	%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리</title>
</head>
<body>
<jsp:include page="index.jsp"></jsp:include>
	<%
		//로그인 성공
		if(OkLogin==1){
			//세션생성
			userlogin.login(userid);
			session.setAttribute("MEMBERID",userid);
			session.setAttribute("MEMBERNAME",user.getUser_name());
			session.setAttribute("MEMBEREMAIL",user.getUser_email());
			%>
			<h1>로그인</h1><br>
			<h3>로그인  성공!</h3>
	 		<a href ="Mypage.jsp">마이페이지 보러가기</a>
		<% }
		//아이디 혹은 비밀번호 틀림
		if(OkLogin==0){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디 혹은 비밀번호가 틀렸습니다.')");
			script.println("location.href='Login.jsp'");
			script.println("</script>");
		}
	%>
					
	
</body>
</html>