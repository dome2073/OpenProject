<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EMP 테이블 직원 리스트 출력</title>
<style>
	td {
		text-align: right;
		padding : 10px 20px;;
		border-bottom: 1px solid gray; 
	}
</style>
</head>
<body>
<% //세션이 있는경우  login=true
		String sessonId = (String)session.getAttribute("MEMBERID");
		boolean login = sessonId == null ? false : true;
		
		if(login==false){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 사용 가능합니다.')");
			script.println("location.href='Login.jsp'");
			script.println("</script>");
		
		 }else{%>
	<jsp:include page="index.jsp"></jsp:include>
	<h1>사원리스트</h1>
	<table border="1">
		<tr>
			<td>사원번호</td>
			<td>사원이름</td>
			<td>업무</td>
			<td>상관번호</td>
			<td>입사일</td>
			<td>급여</td>
			<td>커미션</td>
			<td>부서번호</td>
			<td>부서이름</td>
			<td>부서위치</td>
			<td colspan="2">관리</td>
		</tr>

		<%
			// 1. JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				/* String jdbcDriver = "jdbc:oracle:thin:localhost:1521:orcl";
				String dbUser = "student";
				String dbPass = "1234"; */
				//커넥션 풀 연결 URL
				String jdbcDriver = "jdbc:apache:commons:dbcp:pooltest2";
				
				String query = "select e.empno, e.ename, e.job, e.ename, e.hiredate, e.sal, nvl(e.comm, 0), e.deptno, d.dname, d.loc "
						     + " from emp e, emp ee, dept d "
				             + " where e.mgr=ee.empno and e.deptno=d.deptno "
						     + " order by e.ename ";
				// 2. 데이터베이스 커넥션 생성
				//conn = DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
				conn = DriverManager.getConnection(jdbcDriver);
				// 3. Statement 생성
				stmt = conn.createStatement();
				// 4. 쿼리 실행
				rs = stmt.executeQuery(query);
				// 5. 쿼리 실행 결과 출력
				while (rs.next()) {
		%>


		<tr>
			<td><%= rs.getInt(1)%></td>
			<td><%= rs.getString(2)%></td>
			<td><%= rs.getString(3)%></td>
			<td><%= rs.getString(4)%></td>
			<td><%= rs.getDate(5)%></td>
			<td><%= rs.getInt(6)%></td>
			<td><%= rs.getInt(7)%></td>
			<td><%= rs.getInt(8)%></td>
			<td><%= rs.getString(9)%></td>
			<td><%= rs.getString(10)%></td>
			<td> <a href="emp_UpdateForm2.jsp?empno=<%= rs.getInt(1)%>">수정</a> </td>
			<td> <a href="emp_delete.jsp?empno=<%= rs.getInt(1)%>">삭제</a> </td>
		</tr>
		<%
			}
			} catch (SQLException ex) {
				out.println(ex.getMessage());
				ex.printStackTrace();
			} finally {
				// 6. 사용한 Statement 종료
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
				if (stmt != null)
					try {
						stmt.close();
					} catch (SQLException ex) {
					}
				// 7. 커넥션 종료
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException ex) {
					}
			}
		%>

	</table>
<%}%>	
</body>
</html>