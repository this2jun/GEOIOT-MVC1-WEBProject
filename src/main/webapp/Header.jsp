<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- ������ �̿��� �α��� ó�� -->
	<%
	//�α׾ƿ� Ŭ���� �Ķ���͸� ���� �α׾ƿ� ���� Ȯ��
	String logout = request.getParameter("logout");
	if (logout != null) { // �α׾ƿ� ���� ���� �ƴѰ��(�α׾ƿ���ư Ŭ�� ��)
		session.setAttribute("id", null); // id null����
		session.setMaxInactiveInterval(0); // ���������ð����� 
	}
	String id = (String) session.getAttribute("id");
	//�α����� �Ǿ� ���� �ʴٸ�
	if (id == null) {
		id = "Guest";
	}
	%>
	<table width="1000" bordercolor="white">
		<tr height="70">
			<td colspan="4"><a href="RentcarMain.jsp"
				style="text-decoration: none"> <img src="img/logo.jpg"
					height="100" />
			</a></td>
			<td align="center" width="200"><%=id%> �� <%
			if (id.equals("Guest")) {
			%>
				<button
					onclick="location.href='RentcarMain.jsp?section=MemberLogin.jsp'">�α���</button>
				<%
				} else {
				%>
				<button onclick="location.href='RentcarMain.jsp?logout=1'">�α׾ƿ�</button>
				<%
				}
				%></td>
		</tr>
		<tr height="50">
			<td align="center" width="200" bgcolor="black"><a
				href="RentcarMain.jsp?section=CarReserveMain.jsp"
				style="text-decoration: none"><font color="white" size="4">
						�����ϱ�</font> </a></td>
			<td align="center" width="200" bgcolor="black"><a
				href="RentcarMain.jsp?section=CarReserveView.jsp"
				style="text-decoration: none"> <font color="white" size="4">
						����Ȯ��</font>
			</a></td>
			<td align="center" width="200" bgcolor="black"><a href="#"
				style="text-decoration: none"><font color="white" size="4">
						�����Խ���</font> </a></td>
			<td align="center" width="200" bgcolor="black"><a href="#"
				style="text-decoration: none"><font color="white" size="4">
						�̺�Ʈ</font> </a></td>
			<td align="center" width="200" bgcolor="black"><a href="#"
				style="text-decoration: none"><font color="white" size="4">
						������</font> </a></td>
		</tr>
	</table>
</body>
</html>