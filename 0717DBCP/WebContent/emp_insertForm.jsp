<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
    
    //1. JDBC 드라이버 로딩
    Class.forName("oracle.jdbc.driver.OracleDriver");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs= null;
 
    String jdbcDriver = "jdbc:oracle:thin:localhost:1521:orcl";
    String dbUser = "userinfo";
    String dbPass = "1234";
    String sql = "select empno, ename from emp where job = 'MANAGER' or job='PRESIDENT' order by ename";
    String sql2 = "select deptno, dname from dept order by deptno";
    
    //insert는  입력처리 페이지인 emp_edit4.jsp에서 
    
 
    try {
        // 2. 데이터베이스 커넥션 생성
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        // 3. Statement 생성
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();    
        
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emp 테이블의 사원 정보 입력</title>
<style>
</style>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>
    <h1>사원 정보 입력</h1>
    <hr>
    
    <form action="emp_insertAction.jsp">
        <table>
            <tr>
                <td>사원번호</td>
                <td>        
                    <input type="number" name="empno">            
                </td>
            </tr>
            <tr>
                <td>사원이름</td>
                <td><input type="text" name="ename"></td>
            </tr>
            <tr>
                <td>직급</td>
                <td><select name="job">
                    <option value="CLERK">CLERK</option>
                    <option value="SALESMAN">SALESMAN</option>
                    <option value="ANALYST">ANALYST</option>
                    <option value="MANAGER">MANAGER</option>
                    <option value="PRESIDENT">PRESIDENT</option>
                </select></td> <!-- name은 mgr -->
            </tr>
            <tr>
                <td>매니저</td>
                <td><select name="mgr">
                    <%
                        while (rs.next()){
                    %>
                    <option value="<%=rs.getInt("empno")%>">
                        <%=rs.getString("ename")%>                
                    </option>
                        <%
                        }%>
                </select></td> <!-- name은 mgr -->
            </tr>
            <tr>
                <td>입사일</td>
                <td><input type="date" name="hiredate"></td>
            </tr>
            <tr>
                <td>급여</td>
                <td><input type="number" name="sal"></td>
            </tr>
            <tr>
                <td>커미션</td>
                <td><input type="number" name="comm"></td>
            </tr>
            <tr>
                <td>부서명</td>
                <td><select name="mgr">
                    <%
                        rs = pstmt.executeQuery(sql2);    
                        while (rs.next()){
                    %>
                    <option value="<%=rs.getInt("deptno")%>">
                        <%=rs.getString("dname")%>                
                    </option>
                        <%
                        }%>
                </select></td> <!-- name은 mgr -->
            </tr>
 
            <tr>
                <td colspan="2"><input type="submit" value="입력"></td>
            </tr>
        </table>
    </form>
    <% 
        } catch (SQLException ex) {
            out.println(ex.getMessage());
            ex.printStackTrace();
        } finally {
            // 6. 사용한 Statement 종료
            if (rs!= null)
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            if (pstmt != null)
                try {
                    pstmt.close();
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
 
 <%} %>
</body>
</html>
