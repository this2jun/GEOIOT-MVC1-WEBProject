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
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	//ȸ�����̵�� �н����尡 ��ġ���� ��
	RentcarDAO rdao = new RentcarDAO();
	//�ش�ȸ���� ���� ���� ǥ��
	int result = rdao.getMember(id, pass);


	if(result == 0){ %>
	<script>
		alert("ȸ�� ���̵� �Ǵ� �н����尡 �ٸ��ϴ�.");
		location.href = 'RentcarMain.jsp?section=MemberLogin.jsp';
	</script>
	<%
	}else{
	//�α��� ó���� �Ȱ�� : ���� ����
	session.setAttribute("id", id);
	response.sendRedirect("RentcarMain.jsp");
	}
	%>
</body>
</html>