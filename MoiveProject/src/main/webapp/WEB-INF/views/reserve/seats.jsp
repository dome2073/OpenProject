<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
       body{
       background:rgb(207, 204, 204);
       }
       .screen{
            font-size: 35px;
            text-align: center;
            outline:floralwhite;
            background: linear-gradient(45deg,
            rgba(255, 252, 236, 0.815), white);
            -webkit-background-size:30px 30px;
            background-size:30px 30px;            
        }
       
        button{
           display: inline-block;
           border:none;
            background: rgb(1, 7, 59);
            font-size: 30px;
            color: white;
        }
        p{
            text-align: center;
        }
        a{
            text-decoration: none;
            color: white;
        }

    </style>
     <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
</body>
<c:url var="json" value="/reserve/getReservedJason"></c:url>
<script>

var reservedSeats='<c:out value="${reservedSeats}"/>';
var seatsArr=reservedSeats.split("seats_id=");
var movieCode='<c:out value="${movieCode}"/>';
var seatsArr1 = new Array();

for(var i=0;i<seatsArr.length;i++){
	seatsArr1[i]=seatsArr[i].split(",")
}

var tmp="<form name='sub' action='reserve/reservAction'><button type='submit'>예매확정</button><button><a href='<c:url value='/movie/movie'/>'> 예매취소</a></button><br>";
tmp+="<h1 class='screen'>screen</h1><br><br>";
 tmp+="<p>";
var divtag=document.querySelector('div');
for(var i=1;i<57;i++){
    if(i<10){
        tmp+="<button class='seat' name='seats' id="+i+" type=button"+" value="+ i +" onclick=chgcol(this)"+">0"+i+"</button>";
        tmp+= "<input type='hidden' name='seats' value=" + i + ">";
    }else{
    tmp+="<button class='seat' name='seats' id="+i+" type=button"+" value="+ i +" onclick=chgcol(this)"+">"+i+"</button>";
    tmp+= "<input type='hidden' name='seats' value=" + i + ">";}
    if(i%7==0 && i!=0)
    tmp+="<br>";
}
tmp+="</p></form>";

var seats_id = new Array();

if(reservedSeats=="[]"){
	document.body.innerHTML+=tmp;
}else{
	for(var i=1;i<seatsArr1.length;i++){
		seats_id[i-1]=parseInt(seatsArr1[i][0]);		
	}
	document.body.innerHTML+=tmp;
    var buttons=document.querySelectorAll("button");
    for(var i=0;i<seats_id.length;i++){
    	if(seats_id[i]!=0){
    		$(buttons[seats_id[i]+1]).css('background','grey');
    	}else{
    		break;
    	}
    }
}

    var buttons=document.querySelectorAll("button");
    var cnt=0;
    var id1=0;
     function chgcol(button){
       cnt++;  
         //원래대로 돌아오기
        if(cnt%2!=0){ 
        	id1=button.id;
        	$(button).css('background','grey');
           $("form[name=sub]").attr({action:"reservAction?movie_code="+movieCode+"&seats_id="+id1, method:"post"});
           $.ajax({
        	   type:"get",           		
        	   url:"${json}",
        	   data:{"movieCode":movieCode},
        	   dataType:"json",
        	   success:function(data){
        		   console.log(data);
        		   var jsonSeats=new Array();   
					$.each(data,function(key,value){
						jsonSeats=value.seats_id;
						if(id1==jsonSeats){
							alert("이미 예매된 좌석입니다.");
			                $(button).css('background','grey'); 
				            $("form[name=sub]").attr({action:"reservAction?movie_code="+movieCode});
				            cnt++;
						}
					})					
        	   }           
           })         
        }else{                       
            if(id1==button.id){
                $("form[name=sub]").attr({action:"reservAction?movie_code="+movieCode});
	        	$(button).css('background','rgb(1, 7, 59)');
                /* else{
                	여러명 예매 및 짝수번째 눌렀을때 오류 없앰
                	다시 여러번 눌러도 원래색으로 돌아갈수있도록 할수있음 지워질수있도록
                } */
            }
        }         
      }
        
     
</script>
</html> 