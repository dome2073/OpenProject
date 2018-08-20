<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style>
	img{
		width:435px;
	}
	th:nth-child(1){
		background-color: antiquewhite;
	}
	td{
		height: 100px;
	}
</style>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/commons/header.jsp" />
	
	<div class="w3-content" style="max-width: 2000px; margin-top: 46px">
		<div class="mySlides w3-display-container w3-center">
			<h1>회원정보 확인</h1>
			
			<h5 style="color: gray">회원님의 소중한 정보를 안전하게 관리하세요.</h5>
			
			</div>
			
			<div class="w3-container w3-content w3-center w3-padding-64"
			style="max-width: 800px" id="band">
			
			<h3 style="float: left">회원정보</h3>

			<form method="post" enctype="multipart/form-data">
				<table style="width: 800px">


					<tr>
						<th>이름</th>
						<td id="name">${Userinfo.user_name}
						<input type="button" value="이름변경" id="nameChange"><br></td>
						
						<td rowspan="8"><img src="<c:url value='/uploadFile/UserPhoto/${Userinfo.user_photo}'/>"><br>
							<input type="file" name="photoFile">
						</td>
					</tr>

					<tr>
						<input type ="hidden" name="user_number" value="${Userinfo.user_number}">
						<th>아이디</th>
						<td>${Userinfo.user_id}</td>

					</tr>

					<tr>
						<th>비밀번호<br>
						<input type="button" value="변경" id="pwChange"></th>
						<td id="pw"></td>
					</tr>


					<tr>
						<th>생년월일</th>
						<td>${Userinfo.user_birth}</td>

					</tr>

					<tr>
						<th>성별</th>
						<td>${Userinfo.user_gender}</td>

					</tr>

					<tr>
						<th>휴대전화</th>
						<td>${Userinfo.user_phone}</td>

					</tr>

					<tr>
						<th>이메일</th>
						<td>${Userinfo.user_email}</td>

					</tr>

					<tr>
						<th>회원가입일시</th>
						<td>${Userinfo.user_date}</td>

					</tr>
				</table>
				<input type="submit" value="수정">
			</form>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/commons/footer.jsp" />
	
	<script>
		$(document).ready(function(){
			
			$('#nameChange').click(function(){
				
				if($('#hiddenname').val()!=1){
					$('#name').append("<input type='text' id='addname' name='user_name' placeholder='이름을 입력해 주세요'>"+"<input type='hidden' id='hiddenname' name='hiddenname' value=1>");
				}else{
					$('#addname').remove();
					$('#hiddenname').remove();
				}
				
				
			});
			
				$('#pwChange').click(function(){
				
				if($('#hiddenpw').val()!=1){
					$('#pw').append("<input type='text' id='addpw' name = 'user_pw' placeholder='비밀번호를 입력해 주세요'>"+"<input type='hidden' id='hiddenpw' name='hiddenpw' value=1>");
				}else{
					$('#addpw').remove();
					$('#hiddenpw').remove();
				}
				
				
			});
			
		});
	
	</script>
</body>
</html>