<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	int reserveno = Integer.parseInt(request.getParameter("reserveno"));
	RentcarDAO rdao = new RentcarDAO();
	//������� �޼ҵ� (�����ȣ�̿�)
	rdao.carRemoveReserve(reserveno);
	response.sendRedirect("RentcarMain.jsp");
	%>
</body>
</html>