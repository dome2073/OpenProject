<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.PrintWriter"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<style>
</style>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>

	<%	
		//세션정보를 가져옴
		String sessonId = (String)session.getAttribute("MEMBERID");
		String sessonBirth = (String)session.getAttribute("MEMBERBIRTH");
		String sessonName = (String)session.getAttribute("MEMBERNAME");
		//세션이 있는경우  login=true
				
		boolean login = sessonId == null ? false : true; 
	
		//세션이 없는 경우에는 alert띄우고 로그인창으로
		if(login==false){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 사용 가능합니다.')");
			script.println("location.href='Login.jsp'");
			script.println("</script>");
		}else{
			//마이페이지 보여줌
			%>
			<h2>회원 마이 페이지</h2>
			<div class="wrap">
				<img src="http://blogfiles4.naver.net/20120410_272/foreverdec_1334042019412IwRio_JPEG/%C4%BB%B0%C5%B7%E7.jpg" alt="그림없다" style="width:300px;"><br>
				<table>
					<tr>
						<td>회원생일</td>
						<td><%=sessonBirth %></td>
					</tr>
					<tr>
						<td>회원아이디</td>
						<td><%=sessonId %></td>
					</tr>
					<tr>
						<td>회원이름</td>
						<td><%=sessonName %></td>
					</tr>
				</table>
			</div>
		<% }
	%>
</body>
</html>