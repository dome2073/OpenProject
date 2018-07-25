<%@page import="Users.model.User"%>
<%@page import="Users.model.UserListView"%>
<%@page import="Users.service.UserListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트 출력</title>
<style>
	td {
		text-align: right;
		padding : 10px 20px;;
		border-bottom: 1px solid gray; 
	}
</style>
</head>
<body>
<jsp:include page="index.jsp"></jsp:include>
	<% //세션이 있는경우  login=true
		String sessonId = (String)session.getAttribute("MEMBERID");
		boolean login = sessonId == null ? false : true;
		
		if(login==false){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 사용 가능합니다.')");
			script.println("location.href='Login.jsp'");
			script.println("</script>");
		
		 }else{
		 %>
		 <%		
			String pageNumStr = request.getParameter("page");
	
			int pageNumber =1;
			if(pageNumStr != null){
				pageNumber = Integer.parseInt(pageNumStr);
			}
			//userListService 객체 불러옴
			UserListService userListService = UserListService.getInstance();
			UserListView Userdata = userListService.getUserlist(pageNumber);
	%>			
	<h1>회원 목록</h1>
	<table border="1">
		<tr>
			<td>회원아이디</td>
			<td>비밀번호</td>
			<td>회원명</td>
			<td>출생일</td>
			<td>성별</td>
			<td>이메일</td>
			<td>전화번호</td>
			<td colspan="2">관리</td>
		</tr>
			<%
		if(Userdata.isEmpty()){
	%>
		<h1>등록된 게시물이 없습니다.</h1>	
	<%
		} else {
	%>
		<%
		for (User user : Userdata.getUserList()) { 
		%>
		<tr>
		<td><%=user.getUser_id()%></td>
			<td><%=user.getUser_pw()%></td>
			<td><%=user.getUser_name()%></td>
			<td><%=user.getUser_birth() %></td>
			<td><%=user.getUser_gender() %></td>
			<td><%=user.getUser_email() %></td>
			<td><%=user.getUser_phone() %></td>
		 	<td colspan="2"><a href="confirmDeletion.jsp?Userid=<%=user.getUser_id()%>">
		 	[삭제하기]</a></td>
			</tr>
	<%}%>
	</table>
	전체 게시물의 개수 : <%= Userdata.getUserTotalCount()%><br/>
	전체 페이지 카운트 : <%= Userdata.getPageTotalCount() %><br/>
	
	<%

		for (int i = 1 ; i <= Userdata.getPageTotalCount() ; i++) { %>
			
			<a href="Userlist.jsp?page=<%= i%>">[<%= i %>]</a>     
		
		<%} %>

		
	<%}%>
	<%} %>
</body>
</html>