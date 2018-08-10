<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#write-form td {
    border: none;
}
#write-form textarea {
    width: 99%;
}

</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/header.jsp" />


<div id="content-categories">방명록</div>
<h3>방명록쓰기</h3>
<form id="writeForm" method="POST">
<input type="hidden" name="boardCd" value="free" />
<table id="write-form" class="bbs-table">
<tr>
    <td>작성자</td>
    <td><input type="text" value="${Userinfo.user_id}" name="guestName"disabled="disabled" style="width: 90%;"></input></td>
	<input type="hidden" name="guestName" value="${Userinfo.user_id}">
</tr>
<tr>
    <td colspan="2">
        <textarea name="message" rows="17" cols="50"></textarea>
    </td>
</tr>
</table>
	<input type="submit" value="전송" />
</form>
<!-- 본문 끝 -->

<jsp:include page="/WEB-INF/views/commons/footer.jsp" />
</body>
</html>