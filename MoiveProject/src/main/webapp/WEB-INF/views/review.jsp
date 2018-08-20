<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 목록</title>
<!-- <link rel="stylesheet" href="../../../resources/bootstrap/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/dist/css/AdminLTE.min.css'/>">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="../../../resources/bootstrap/js/bootstrap.js"></script>
<script>
	$(document).ready(function(){
		var movie_code = '${movie_code}';
		var movie_name = '${movieName}';
		var replyPage = 1;
		getPage("review/" + movie_code + "/" + replyPage);
		var formObj = $("form[role='form']");
		
		
		$(".goListBtn").on("click", function(){
			formObj.attr("method", "get");
			formObj.attr("action", "/movie/movie");
			formObj.submit();
		});
		
		$("#reviewDiv").on("click", function(){
			if($(".timeline li").size() > 1){
				return;
			}
			getPage("review/" + movie_code + "/1");
		});
		
		$(".pagination").on("click", "li a", function(event){
			event.preventDefault();
			replyPage = $(this).attr("href");
			getPage("review/" + movie_code + "/" + replyPage);
		});
		
		$("#replyAddBtn").on("click", function(){
			var user_idObj = $("#newReplyWriter");
			var replytextObj = $("#newReplyText");
			var user_id = user_idObj.val();
			var replytext = replytextObj.val();
			$.ajax({
				type: 'post',
				url: 'review/review',
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
					
				},
				dataType : 'text',
				 data : JSON.stringify({movie_code:movie_code, user_id:user_id, replytext:replytext}), 
				success : function(result){
					if(result == 'success'){
						alert('등록 되었습니다.');
						replyPage = 1;
						getPage("review/" + movie_code + "/" + replyPage);
						user_idObj.val("");
						replytextObj.val("");
					}
				}
			});
		});
		
		$(".timeline").on("click", ".replyLi", function(event){
			var reply = $(this);
			$("#replytext").val($.trim(reply.find('.timeline-body').text()));
			$(".modal-title").html(reply.attr("data-rno"));
		});
		
		$("#replyModBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type : 'put',
				url : 'review/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({replytext:replytext}),
				dataType : 'text',
				success : function(result){
					if(result == 'success'){
						alert("수정 되었습니다.");
						getPage("review/" + movie_code + "/" + replyPage);
					}
				}
			});
		});
		
		$("#replyDelBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			$.ajax({
				type : 'delete',
				url : 'review/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result){
					if(result == 'success'){
						alert('삭제 되었습니다.');
						getPage("review/" + movie_code + "/" + replyPage);
					}
				}
			});
		});
		
		Handlebars.registerHelper("prettifyDate", function(timeValue){
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		});
		
		Handlebars.registerHelper("eqUser_id", function(user_id, block){
			var accum = '';
			if(user_id == '${user_id}'){
				accum += block.fn();
			}
			return accum;
		});
		
		var printData = function(replyArr, target, templateObject){
			var template = Handlebars.compile(templateObject.html());
			var html = template(replyArr);
			$(".replyLi").remove();
			target.after(html);
		}
		
	function getPage(pageInfo){
		$.getJSON(pageInfo, function(data){
			printData(data.list, $("#reviewDiv"), $("#template"));
			printPaging(data.pageMaker, $(".pagination"));
			$("#modifyModal").modal("hide");
			$("#replycntSmall").html("[" + data.pageMaker.totalCount + "]");
		});
	}
	
	var printPaging = function(pageMaker, target){
		var str = "";
		if(pageMaker.prev){
			str += "<li><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
		}
		for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
		}
		if(pageMaker.next){
			str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
		}
		target.html(str);
	};
	
	});
	
</script>

<script id="template" type="text/x-handlebars-template">
	{{#each .}}
	<li class="replyLi" data-rno={{rno}}>
	<i class="fa fa-comments bg-blue"></i>
	<div class="timeline-item">
		<span class="time">
			<i class="fa fa-clock-o"></i>
			{{prettifyDate regdate}}
		</span>
		<h3 class="timeline-header">
			<strong>{{rno}}</strong>-{{user_id}}
		</h3>
		<div class="timeline-body">
		{{replytext}}
		</div>
		
		<div class="timeline-footer">
			{{#eqUser_id user_id}}
				<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
			{{/eqUser_id}}
		</div>
		
	</div>
	</li>
	{{/each}}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/header.jsp" />

<section class="content">
<div style="margin-top:100px">
</div>
<div>


</div>
<div class="row">
	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="bno" value="${movie_code}"/>
	</form>
		
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label>
			<input type="text" name="title" class="form-control" value="${movieName}" readonly="readonly"/>
		</div>
	</div>
	
	<div class="box-footer">
		<button type="submit" class="btn btn-primary goListBtn">LIST ALL</button>
	</div>
	
	<div class="col-md-12">
		<div class="box box-success">
			<h3 class="box-title">ADD NEW REPLY</h3>
		</div>
		<div class="box-body">
			<label for="newReplyWriter">Writer</label>
			<input class="form-control" type="text" id="newReplyWriter" value="${user_id}" readonly/>
			<label for="newReplyText">ReplyText</label>
			<input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText"/>
		</div>
		
		<div class="box-footer">
			<button type="submit" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
		</div>
		<ul class="timeline">
			<li class="time-label" id="reviewDiv">
				<span class="bg-green">
				review List
				</span>
			</li>
		</ul>
	</div>
	
	
	<div class="text-center">
		<ul id="pagination" class="pagination pagination-sm no-margin">
		</ul> 
	</div>
	
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p><input type="text" id="replytext" class="form-control"/></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
</div>
</section>
</body>
</html>