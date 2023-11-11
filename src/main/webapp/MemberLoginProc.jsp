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
	//회원아이디와 패스워드가 일치여부 비교
	RentcarDAO rdao = new RentcarDAO();
	//해당회원이 존재 여부 표현
	int result = rdao.getMember(id, pass);


	if(result == 0){ %>
	<script>
		alert("회원 아이디 또는 패스워드가 다릅니다.");
		location.href = 'RentcarMain.jsp?section=MemberLogin.jsp';
	</script>
	<%
	}else{
	//로그인 처리가 된경우 : 세션 저장
	session.setAttribute("id", id);
	response.sendRedirect("RentcarMain.jsp");
	}
	%>
</body>
</html>