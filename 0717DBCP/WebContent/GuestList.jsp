<%@page import="java.io.PrintWriter"%>
<%@page import="Guestbook.model.MessageListView"%>
<%@page import="Guestbook.model.Message"%>
<%@page import="Guestbook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
		//추가
		//1. 세션있는지 확인 (로그인이 되어있는지)
		String sessonId = (String)session.getAttribute("MEMBERID");		
		boolean login = sessonId == null ? false : true; 
		
		//현재 페이지
		String pageNumStr = request.getParameter("page");
		
		//페이지 기본값 = 1
		int pageNumber=1;
		
		if(pageNumStr != null){
			pageNumber = Integer.parseInt(pageNumStr);
		}
		
		//getMessageListService 객체를 불러온다.
		GetMessageListService messageListService = GetMessageListService.getInstance();
		//해당페이지에 방명록을 불러옴
		MessageListView viewData =  messageListService.getMessageList(pageNumber);
%>
<%
		
	
		//세션이 없는 경우에는 alert띄우고 로그인창으로
		if(login==false){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 사용 가능합니다.')");
			script.println("location.href='Login.jsp'");
			script.println("</script>");
		}else{
			//세션있는경우 = 해당 JSP페이지를 보여줌
			//response.sendRedirect("GuestList");
		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GuestBook<%=pageNumStr%></title>
</head>
<body>
<jsp:include page="index.jsp"></jsp:include>
	<h1>방명록 </h1>
	<hr>
	<%
		if(viewData.isEmpty()){
	%>
		<h1>등록된 게시물이 없습니다.</h1>	
	<%
		} else {
	%>
	<table border="1">
	
		<%
		for (Message message : viewData.getMessageList()) { 
		%>
			<tr>
				<td>
				게시물 번호: <%=message.getId()%> <br /> 
				닉네임: <%=message.getGuestName()%><br />
				남긴 말: <%=message.getMessage()%> <br /> <a
				href="deleteMessage.jsp?messageId=<%=message.getId()%>">
				[삭제하기]</a>
			</td>
			</tr>
		<%} 
		%>
	</table>
		전체 게시물의 개수 : <%= viewData.getMessageTotalCount() %>  <a href = "GuestInsert.jsp">글쓰기</a> <br>
		<%
		for (int i = 1 ; i <= viewData.getPageTotalCount() ; i++) { %>
			
			<a href="GuestList.jsp?page=<%= i%>">[<%= i %>]</a>     
		
		<%} %>
		<%
	
		}%>
		
	</table>
</body>
</html>
<%}%>