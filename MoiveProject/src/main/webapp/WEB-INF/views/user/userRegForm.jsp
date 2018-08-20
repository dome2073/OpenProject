<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css" />" media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="<c:url value="/css/style.css" />" media="screen" title="no title" charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value="/js/bootstrap.min.js" />"></script>
<style>
	#usergender1 , #usergender2{
		display: none;
	}
	#genderlabel1 {
    display: inline-block;
    width: 260px;
    height:70px;
    border: 1px solid gray;
    text-align: center;
    line-height: 70px;
	}
	#genderlabel2{
    display: inline-block;
    width: 260px;
    height: 70px;
    border: 1px solid gray;
    text-align: center;
    line-height: 70px;
}

</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/commons/header.jsp" />
	
	
	<article class="container">
        <div class="page-header">
          <h1 style="padding-top: 20px">회원가입</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="id">아이디</label>
              <input type="text" class="form-control" id="id" placeholder="아이디" name="user_id">
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" id="InputPassword1" placeholder="비밀번호" name="user_pw">
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" id="InputPassword2" placeholder="비밀번호 확인" name="user_pw2">
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" id="username" placeholder="이름을 입력해 주세요" name="user_name">
            </div>
            <div class="form-group">
              <label for="userphoto">사진업로드</label>
              <input type="file" class="form-control" id="userphoto" placeholder="이름을 입력해 주세요" name="photoFile">
            </div>
            <div class="form-group">
              <label for="userbirth">생년월일</label>
              <input type="text" class="form-control" id="userbirth" placeholder="이름을 입력해 주세요" name="user_birth">
            </div>
            <div class="form-group">
              <label for="usergender">성별</label><br/>
              <input type="checkbox" class="form-control" id="usergender1" placeholder="이름을 입력해 주세요" name="user_gender" value="남자"><label for="usergender1" id="genderlabel1" value="남자">남자</label>
              <input type="checkbox" class="form-control" id="usergender2" placeholder="이름을 입력해 주세요" name="user_gender" value="여자"><label for="usergender2" id="genderlabel2" value="여자">여자</label><br/>
            </div>
			
			<div class="form-group">
              <label for="InputEmail">이메일 주소</label>
              <input type="email" class="form-control" id="InputEmail" placeholder="이메일 주소" name="user_email">
            </div>
			
            <div class="form-group">
              <label for="userphone">휴대폰 인증</label>
              <div class="input-group">
                <input type="tel" class="form-control" id="userphone" placeholder="- 없이 입력해 주세요" name=user_phone>
                <span class="input-group-btn">
                  <button class="btn btn-success">인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
                </span>
              </div>
            </div>
            
            <div class="form-group">
              <label for="userphonecf">인증번호 입력</label>
              <div class="input-group">
                <input type="text" class="form-control" id="userphonecf" placeholder="인증번호">
                <span class="input-group-btn">
                  <button class="btn btn-success">인증번호 입력<i class="fa fa-edit spaceLeft"></i></button>
                </span>
              </div>
            </div>
            
            <div class="form-group">
                <label>약관 동의</label>
              <div data-toggle="buttons">
              <label class="btn btn-primary active">
                  <span class="fa fa-check"></span>
                  <input id="agree" type="checkbox" autocomplete="off" checked>
              </label>
              <a href="#">이용약관</a>에 동의합니다.
              </div>
            </div>
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>

      </article>
	<jsp:include page="/WEB-INF/views/commons/footer.jsp" />
</body>
<script>
$(document).ready(function() {
	//남,여 성별체크시 색변경
    $('#genderlabel1').on('click', function() {
        $('#genderlabel1').css('border', '1px solid green').css('color', 'green');
        $('#genderlabel2').css('border', '1px solid gray').css('color', 'gray');
    });

    $('#genderlabel2').on('click', function() {
        $('#genderlabel2').css('border', '1px solid green').css('color', 'green');
        $('#genderlabel1').css('border', '1px solid gray').css('color', 'gray');
    });
});
</script>
</html>