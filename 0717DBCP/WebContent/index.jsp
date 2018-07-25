<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            background-image: url(http://cfile202.uf.daum.net/image/1824080B4AD14604DE72E8) ;
            background-size:100%;
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
       	.headbanner {
       		
       	}
        /* a태그 - 고양이갤러리 */
        /* 나머지a태그 */
       
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
            padding:15px;
        }
        img{
            width: 70%;
            height: 50%;
            float:rigth;
            opacity: 0.7;
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
          
          <li class="banner"><a href="Register2.jsp">회원가입</a></li>	  
          <!-- 세션이 있을 경우 logout으로 나오고, 세션이 없는 경우에는 login으로 나옴 -->
          <%if(login==true){
        	  %>
          <li class="banner"><a href="Logout.jsp">로그아웃</a></li>
        	  <%
          }else{
        	  %>
        	  <li class="banner"><a href="Login.jsp">로그인</a></li>
        	  <%
          }
        	  %>
          <li class="banner"><a href="Mypage.jsp">회원마이페이지(회원)</a></li>
          <li class="banner"><a href="Userlist.jsp">회원리스트(회원)</a></li>
          <li class="banner"><a href="emp_list.jsp">사원리스트</a></li>
          <li class="banner"><a href="emp_insertForm.jsp">사원등록</a></li>
          <li class="banner"><a href="GuestList.jsp">방명록</a></li>
        </ul>
    </div>
    

</body>
</html>