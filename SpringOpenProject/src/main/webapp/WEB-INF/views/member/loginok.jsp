<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>�α��� ����</h1>
<h3>���1</h3>
request.getParameter�� ������ ���̵� �� : ${requestID} <br>
request.getParameter�� ������ ��й�ȣ  �� : ${requestPW} <br>
<h3>���2</h3>
@RequestParam���� ������ ���̵� �� : ${RequestParamID}<br> 
@RequestParam���� ������ ��й�ȣ �� : ${RequestParamPW}<br>
<h3>���3</h3>
�ڹ� �� ��ü�� ������ ���̵� �� : ${BeanId} <br>
�ڹ� �� ��ü�� ������ ��й�ȣ �� : ${BeanPw} <br>
�ڹ� �� ��ü : ${Logininfo} <br>

</body>
</html>