<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>네이버 : 회원가입</title>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/register2.css"></c:url>">
</head>
 
<body>
<jsp:include page="/WEB-INF/views/commons/header.jsp"></jsp:include>
    <div id="wrap">
        <div id="header">
            <h1><a href="#" id="logo">NAVER</a></h1>
        </div>
        <div id="content">
            <form action="member/Register" method="post" onsubmit="return check();">
             
                <label for="userid"><b>아이디</b></label><br>
                <div id="divtext"><input type="text" id="text1" class="id" name="user_id"><span>@naver.com</span></div>
                <div id="return_id" class="return"></div>
 
                <label for="userid"><b>비밀번호</b></label><br>
                <div id="divtext"><input type="password" id="text1" class="pwd" name="user_pw"><img src="pwdnormal1.PNG" id="pwdimg1"></img>
                </div>
                <div id="return_pwd" class="return"></div>
 
                <label for="userid"><b>비밀번호 재확인</b></label><br>
                <div id="divtext"><input type="password" id="text1" class="pwd2"><img src="pwdnormal2.PNG" id="pwdimg2"></img>
                </div>
                <div id="return_pwd2" class="return"></div>
 
                <label for="userid"><b>이름</b></label><br>
                <div id="divtext"><input type="text" id="text1" class="name" name="user_name"></div>
                <div id="return_name" class="return"></div>
 
                <label for="userid"><b>생년월일</b></label><br>
                <div id="divtext2"><input type="text" id="text2" class="birthyear" placeholder="년(4자)" name="user_year"></div>
                <div id="divtext2"><select id=birthselect class="birthmonth" name="user_month">
                <option>월</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
            </select></div>
                <div id="divtext2"><input type="text" id="text2" class="birthday" placeholder="일" name="user_day"></div><br/>
                <div id="return_year" class="return"></div>
 
                <label for="userid"><b>성별</b></label><br>
                <input type=checkbox id="gendercheck" name="user_gender" value="남자"><label for="gendercheck" id="genderlabel"value="남자">남자</label>
                <input type=checkbox id="gendercheck2" name="user_gender" value="여자"><label for="gendercheck2" id="genderlabel2" value="남자">여자</label><br/>
                <div id="return_gender" class="return"></div>
 
                <label for="userid"><b>본인확인이메일</b></label><br>
                <div id="divtext"><input type="text" id="emailtext" class="email" placeholder="선택입력" name="user_email"></div>
                <div id="return_email" class="return"></div>
 
                <label for="userid"><b>휴대전화</b></label><br>
                <div id="divtext"><select id=phoneselect>
                <option>대한민국 +82</option>
            </select></div>
                <div id="divtext3"><input type="text" id="phonetext" class="phone" placeholder="전화번호 입력" name="user_phone"></div>
                <input type="button" id="cfbutton" value="인증번호 받기"><br/>
 
                <div id="divtext4"><input type="text" id="cfinput" disabled="true" placeholder="인증번호를 입력하세요"></div>
                <div id="return_phone" class="return"></div>
                <input type="submit" value="가입하기" id="sub">
 
 
            </form>
 
            <div id="footer">
                <ul>
                    <li id="footlist"><a href="#" id="foottext2">이용약관</a></li>
                    <li id="footlist"><a href="#" id="foottext2"><b>개인정보처리방침</b></a></li>
                    <li id="footlist"><a href="#" id="foottext2">책임의 한계와 법적고지</a></li>
                    <li id="footlist"><a href="#" id="foottext2">회원정보 고객센터</a></li>
                </ul>
                <ul id="footbanner">
                    <li id="footlist2"><a href="#" id="footlogo"><b>NAVER</b></a></li>
                    <li id="footlist2">Copyrigth</li>
                    <li id="footlist2"><a href="#" id="foota"><b>NAVER Corp.</b>
                    <li id ="footlist2">All Rights Reseved</li>
                    </a></li>
 
                </ul>
            </div>
 
        </div>
    </div>
    <script>
        //submit하기 전 유효성 검사
        //1. 입력사항을 입력하지 않은 경우 (빈값제출)
        //id,비밀번호, 비밀번호 확인,이름,성별,- 필수 입력 사항, 핸드폰 - 필수입력사항 + 인증이 필요, 생년월일 - 태어난 년도 4자리를 정확하게 입력하세요
        $(document).ready(function() {
            var idSet = /^[A-za-z0-9]{5,20}$/g; //6~20자리 아이디 정규식
            var pwdSet = /^.*(?=^.{6,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //6~16자리 특수기호포함 정규식
            var nameSet = /^[가-힣a-zA-Z]+$/; //이름 정규식
            var yearSet = /^[0-9]*$/; //숫자만 정규식
            var emailSet = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식
            var phoneSet = /^\d{3}-\d{3,4}-\d{4}$/;; //핸드폰정규식
 
 
            //아이디 유효성검사.
            //해당 입력창을 벗어나면 바로 결과가 나오게 하기위해서 focusout사용
            $('.id').focusout(function() {
                if ($(this).val() == null || $(this).val().length == 0) {
                    $('#return_id').html("필수 입력 정보입니다.");
                } else {
                    if (!idSet.test($(this).val())) {
                        $('#return_id').html("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
                    } else
                        $('#return_id').html("멋진 아이디네요!").css('color', 'green');
                }
 
            });
 
            //비밀번호 유효성검사.
            //해당 입력창을 벗어나면 바로 결과가 나오게 하기위해서 focusout사용
            $('.pwd').focusout(function() {
                if ($(this).val() == null || $(this).val().length == 0) {
                    $('#return_pwd').html("필수 입력 정보입니다.");
                    $('#pwdimg1').prop('src', "pwdnormal1.png");
                } else {
                    if (!pwdSet.test($(this).val())) {
                        $('#pwdimg1').prop('src', "pwdno.png");
                        $('#return_pwd').html("6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                    } else
                        $('#pwdimg1').prop('src', "pwdok.png");
                    $('#return_pwd').html("");
                }
            });
            //비빌번호 재확인 일치하는지 유효성검사.
            $('.pwd2').focusout(function() {
                if ($(this).val() == null || $(this).val().length == 0) {
                    $('#return_pwd2').html("필수 입력 정보입니다.");
                    $('#pwdimg2').prop('src', "pwdnormal2.png");
                } else {
                    if ($(this).val() == $('.pwd').val()) {
                        $('#pwdimg2').prop('src', "pwdcheckok.png");
                        $('#return_pwd2').html("확인");
                    } else {
                        $('#return_pwd2').html("비밀번호가 일치하지 않습니다.");
                        $('#pwdimg2').prop('src', "pwdnormal2.png");
                    }
                }
            });
 
            //이름 유효성검사.
            //해당 입력창을 벗어나면 바로 결과가 나오게 하기위해서 focusout사용
            $('.name').focusout(function() {
                if ($(this).val() == null || $(this).val().length == 0) {
                    $('#return_name').html("필수 입력 정보입니다.");
                } else {
                    if (!nameSet.test($(this).val())) {
                        $('#return_name').html("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
                    } else
                        $('#return_name').html("");
                }
 
            });
 
            //생년월일- 년 유효성검사
            $('.birthyear').focusout(function() {
                if ($(this).val() == null || $(this).val().length == 0) {
                    $('#return_year').html("필수 입력 정보입니다.");
                } else {
                    if ($(this).val().length != 4) {
                        $('#return_year').html("태어난 년도 4자리를 정확하게 입력하세요.");
                    } else
                        $('#return_year').html("");
                }
 
            });
 
            //생년월일 - 월 유효성검사
            $('.birthmonth').focusout(function() {
                if ($(this).val() == "월") {
                    $('#return_year').html("태어난 일(날짜) 2자리를 정확하게 입력하세요.");
                } else {
                    $('#return_year').html("");
                }
 
            });
 
            //생년월일 - 일 유효성검사
            $('.birthday').focusout(function() {
                if ($(this).val() == null || $(this).val().length == 0) {
                    $('#return_year').html("태어난 일(날짜) 2자리를 정확하게 입력하세요.2");
                } else {
                    if (!yearSet.test($(this).val())) {
                        $('#return_year').html("형식에 맞지 않습니다.");
                    } else
                        $('#return_year').html("");
                }
 
            });
 
            //이메일 유효성검사
            $('.email').focusout(function() {
                if ($(this).val() == null || $(this).val().length == 0) {
                    $('#return_email').html("필수 입력 정보입니다.");
                } else {
                    if (!emailSet.test($(this).val())) {
                        $('#return_email').html("이메일 주소를 다시 확인해주세요.");
                    } else
                        $('#return_email').html("");
                }
 
            });
 
            //전화번호 유효성검사
            //인증번호 받기 클릭시
            $('#cfbutton').click(function() {
                if ($('.phone').val() == null || $('.phone').val().length == 0) {
                    $('#return_phone').html("필수 입력 정보입니다.");
                } else {
                    if (!($('.phone').val().length == 10 || $('.phone').val().length == 11)) {
                        $('#return_phone').html("형식에 맞지 않는 번호입니다.");
                    } else
                        $('#return_phone').html("인증번호를 발송했습니다.(유효시간30분)").css('color', 'green');
                    $('#cfinput').prop('disabled', false);
                    $('#divtext4').css('background-color', 'white');
                }
            });
 
            //남,여 성별체크시 색변경
            $('#genderlabel').on('click', function() {
                $('#genderlabel').css('border', '1px solid green').css('color', 'green');
                $('#genderlabel2').css('border', '1px solid gray').css('color', 'gray');
            });
 
            $('#genderlabel2').on('click', function() {
                $('#genderlabel2').css('border', '1px solid green').css('color', 'green');
                $('#genderlabel').css('border', '1px solid gray').css('color', 'gray');
            });
        });
 
    </script>
</body>
 
</html>