<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
	//세션값을 저장
	String memberId = (String)session.getAttribute("MEMBERID");
	//세션이 있는경우  login=true
	boolean login = memberId == null ? false : true; 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>고양이갤러리</title>
    <style>
    	
    	*{
    		margin:0;
    		padding :0;
    	}
               /* ul태그 스타일적용 */
        ul{
            list-style-type: none; /* 불릿을 없앤다. */
            background-color: cadetblue;
            overflow:hidden;
            background-color: black;
         
        }
        .headbanner{
        	
        }
        /* 마우스를 링크위에 올렸을때  */
        li a:hover{
            background-color: dimgray;
        }
        
		/* 맨위(네비게이션) div 태그 */
      	.mainbanner {
      		display: inline;
      	}
        .banner a{
        	float:left;
        }
   
        .banner{
            border-right: 1px solid white;
        }
        
        .headbanner li a{
            color :white;
            text-decoration: none; /* 밑줄을 없앰 */
            padding : 14px 16px; /* 탑,바텀 14, 양옆 14 */
            text-align: center;
            display:inline-block;
        }
        .side1 ol{
            list-style-type: none; /* 불릿을 없앤다. */
            float: left;
            background-color: lightslategray;
            color :white;
            margin :0;
            padding :15px 0;
            
        }
        .side1 li a{
            text-decoration: none; /* 밑줄을 없앰 */
            text-align: left;
            display:inline-block;
            color :white;         
            padding:20px;
        }
        
        .mainbanner li{
            
        }
        .imgdiv{
        	display:inline;
        	
        }
        </style>
</head>
<body>
  <div class="headbanner">
      <ul>
          
         	<li class="banner"><a href="<c:url value='/' />">홈</a></li>
         	<c:if test="${loginInfo eq null}">
    		<li class="banner"><a href="<c:url value='/user/login'/>">로그인</a></li>         	
         	</c:if>
         	<c:if test="${loginInfo ne null }">
         		<li class="banner"><a href="<c:url value='/user/login'/>">로그아웃</a></li>
         	</c:if>
   			<li class="banner"><a href="<c:url value='/user/reg'/>">회원가입</a></li>
   			<li class="banner"><a href="<c:url value='/user/mypage'/>">마이페이지</a></li>
           
          <!-- <li class="banner"><a href="Mypage.jsp">회원마이페이지(회원)</a></li>
          <li class="banner"><a href="Userlist.jsp">회원리스트(회원)</a></li>
          <li class="banner"><a href="emp_list.jsp">사원리스트</a></li>
          <li class="banner"><a href="emp_insertForm.jsp">사원등록</a></li>
          <li class="banner"><a href="GuestList.jsp">방명록</a></li> -->
        </ul>
    </div>
    

</body>
</html>