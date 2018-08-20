<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--
------------------------------------------------------------
 일별 박스오피스 REST 호출 - 서버측에서 호출하는 방식 예제
------------------------------------------------------------
-->
    <%
    // 파라메터 설정
	String targetDt = request.getParameter("targetDt")==null?"20180813":request.getParameter("targetDt");			//조회일자
	String itemPerPage = request.getParameter("itemPerPage")==null?"7":request.getParameter("itemPerPage");		//결과row수
	String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");		//“Y” : 다양성 영화 “N” : 상업영화 (default : 전체)
	String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");			//“K: : 한국영화 “F” : 외국영화 (default : 전체)
	String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");				//“0105000000” 로서 조회된 지역코드

	// 발급키
	String key = "b5b210981bae3978236982b181c85bfb";
	// KOBIS 오픈 API Rest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

	// 일일 박스오피스 서비스 호출 (boolean isJson, String targetDt, String itemPerPage,String multiMovieYn, String repNationCd, String wideAreaCd)
    String dailyResponse = service.getDailyBoxOffice(true,targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd);

	// Json 라이브러리를 통해 Handling
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String,Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);

	request.setAttribute("dailyResult",dailyResult);

	// KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson, String comCode )
	String codeResponse = service.getComCodeList(true,"0105000000");
	HashMap<String,Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
	request.setAttribute("codeResult",codeResult);
    %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js">	
</script>
<c:url var="reservate" value="/reserve/getReserve"/>
<script type="text/javascript">
/* 	document.getElementById("yesterday3").value = 'ee';
	document.getElementById("yesterday").val = new Date();
	document.getElementById("yesterday2").value = 'ee'; */
	$(document).ready(function() {
		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 
		if(month.length == 1){ 
			  month = "0" + month; 
			} 
			if(day.length == 1){ 
			  day = "0" + day; 
			} 
		var today = year+month+day;
		today*=1;	//String->int
		$('#yesterday').val(today-1);
		
	
	});
	
	function toReserve() {
		//moveCode = this.moviecode;
		return location.href="${reservate}";
	}
	
</script>
<style type="text/css">
table{
			
            display: inline-block;
            width: 300px; 
            height: auto;
            text-align: center;
        }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/header.jsp" />
<div style="width: auto;" >
<div style="height: 60px;"></div>
	<form action="">
		일자:<input type="text" id="yesterday" name="targetDt" value="<%=targetDt %>">
		최대 출력갯수:<input type="text" name="itemPerPage" value="<%=itemPerPage %>">
		영화구분:<select name="multiMovieYn">
			<option value="">-전체-</option>
			<option value="Y"<c:if test="${param.multiMovieYn eq 'Y'}"> selected="seleted"</c:if>>다양성영화</option>
			<option value="N"<c:if test="${param.multiMovieYn eq 'N'}"> selected="seleted"</c:if>>상업영화</option>
		</select>
		국적:<select name="repNationCd">
			<option value="">-전체-</option>
			<option value="K"<c:if test="${param.repNationCd eq 'K'}"> selected="seleted"</c:if>>한국</option>
			<option value="F"<c:if test="${param.repNationCd eq 'F'}"> selected="seleted"</c:if>>외국</option>
			</select>
		지역:<select name="wideAreaCd">
			<option value="">-전체-</option>
			<c:forEach items="${codeResult.codes}" var="code">
			<option value="<c:out value="${code.fullCd}"/>"<c:if test="${param.wideAreaCd eq code.fullCd}"> selected="seleted"</c:if>><c:out value="${code.korNm}"/></option>
			</c:forEach>
			</select>
			<input type="submit" name="" value="조회" >
	</form>
	
	
	<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}">
	<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice">
    <table border="1">
    <tr >
		<td style="width: 300px"><c:out value="${boxoffice.rank }"/>위___<c:out value="${boxoffice.movieCd }"/></td>
    </tr>
    <tr>
			<td  >
				 <img src="<c:url value="/img/${boxoffice.movieCd}.jpg"/>" width="175" height="250"/>
			</td>
    </tr>
    <tr>
			<td>영화<c:out value="${boxoffice.movieNm }"/></td>
    </tr>
    <tr>
			<td>개봉일<c:out value="${boxoffice.openDt }"/></td>
    </tr>
    <tr>
			<td>누적관객수<c:out value="${boxoffice.scrnCnt }"/></td>
    </tr>
    <tr>
			<td>
			<form action="${reservate}" style="display: inline-block;">
				<input type="hidden" id="movieCode" name="movieCode" value="${boxoffice.movieCd }">
				<input type="submit" value="예매" >
			</form>
				
			<form action="../review" style="display: inline-block;">
				<input type="hidden" id="movieCode" name="movie_code" value="${boxoffice.movieCd }">
				<input type="hidden" id="movieName" name="movieName" value="${boxoffice.movieNm }">
				<input type="submit" value="리뷰" >
			</form>
			</td>
    </tr>
    
    </table>
    	</c:forEach>
	</c:if>
</div>

<jsp:include page="/WEB-INF/views/commons/footer.jsp" />
</body>
</html>