<%@page import="db.CarViewBean"%>
<%@page import="java.util.Vector"%>
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
	String id = (String) session.getAttribute("id");
	if (id == null) {
	%>
	<script>
		alert("�α����� ���� ���ּ���");
		location.href = 'RentcarMain.jsp?section=MemberLogin.jsp';
	</script>
	<%
	}
	//�α��� �Ǿ��ִ� �ش� ���̵�(����)�� ������Ȳ ��ȸ
	RentcarDAO rdao = new RentcarDAO();
	Vector<CarViewBean> v = rdao.getAllReserve(id);
	%>

	<div style="text-align: center">
		<table width=��1000">
			<tr height="100">
				<td align="center" colspan="1"><font size="6" color="gray">
						ķ��ī ����ȭ�� </font></td>
			</tr>
		</table>
		<table width=��1000 " border="1">
			<tr height="40">
				<td width="150" align="center">�̹���</td>
				<td width="150" align="center">�����̸�</td>
				<td width="150" align="center">�뿩�Ⱓ</td>
				<td width="60" align="center">�뿩��</td>
				<td width="100" align="center">��Ʈ�ݾ�</td>
				<td width="60" align="center">����</td>
				<td width="60" align="center">��������</td>
				<td width="60" align="center">������</td>
				<td width="60" align="center">���̺�Ʈ</td>
				<td width="60" align="center">�ٺ�ť��Ʈ</td>
				<td width="90" align="center">����</td>
			</tr>

			<%
			for (int i = 0; i < v.size(); i++) {
				CarViewBean bean = v.get(i);
			%>
			<tr height="60" bordercolor="black">
				<td width="150" align="center"><img
					src="img/<%=bean.getImg()%>" width="120" height="70" /></td>
				<td width="150" align="center"><%=bean.getName()%></td>
				<td width="150" align="center"><%=bean.getPday()%></td>
				<td width="60" align="center"><%=bean.getRday()%></td>
				<td width="100" align="center"><%=bean.getPrice()%></td>
				<td width="60" align="center"><%=bean.getQty()%></td>
				<td width="60" align="center"><%=bean.getInsurance()%></td>
				<td width="60" align="center"><%=bean.getBicycle()%></td>
				<td width="60" align="center"><%=bean.getTableset()%></td>
				<td width="60" align="center"><%=bean.getBbq()%></td>
				<td width="90" align="center">
					<button
						onclick="location.href='CarReserveDelete.jsp?reserveno=<%=bean.getReserveno()%>'">����</button>
				</td>
			</tr>
			<%
			}
			%>
		</table>
</body>
</html>