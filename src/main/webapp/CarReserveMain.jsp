<%@page import="db.CarListBean"%>
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
	<div style="text-align: center">
		<!-- DB���� �ֽż� �ڵ��� 3�� ǥ��-->
		<%
		RentcarDAO rdao = new RentcarDAO();
		// ���͸� �̿��Ͽ� ���� ���� ����
		Vector<CarListBean> v = rdao.getSelectCar();
		%>

		<table width="1000">
			<tr height="100">
				<td align="center" colspan="3"><font size="6" color="gray">
						�ֽŻ� ���Ÿ� ķ��ī</font></td>
			</tr>
			<tr height="240">
				<%
				for (int i = 0; i < v.size(); i++) {
					CarListBean bean = v.get(i);
				%>
				<td width="333" align="center"><a
					href="RentcarMain.jsp?section=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
						<img src="img/<%=bean.getImg()%>" width="300" height="220">
				</a>
					<p>
						������:
						<%=bean.getName()%></td>
				<%
				}
				%>
			
		</table>
		<hr color="red" size="3">
		<p>
			<font size="4" color="gray"> �����˻��ϱ�</font> <br>
			<br>
			<br>
		<form action="RentcarMain.jsp?section=CarCategoryList.jsp"
			method="post">
			<font size="3" color="gray"> <b> �����˻��ϱ� </b></font> &nbsp;&nbsp; <select
				name="category">
				<option value="1">AŬ����</option>
				<option value="2">BŬ����</option>
				<option value="3">CŬ����</option>
				<option value="4">ī���</option>
				<option value="5">Ʈ���Ϸ�</option>
			</select> &nbsp;&nbsp; <input type="submit" value="�˻�" /> &nbsp;&nbsp; <input
				type="button" value="��ü�˻�"
				onclick="location.href='RentcarMain.jsp?section=CarAllList.jsp'" />
		</form>
	</div>
</body>
</html>