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
	int no = Integer.parseInt(request.getParameter("no"));
	int qty = Integer.parseInt(request.getParameter("qty")); // ����
	// �̹���
	String img = request.getParameter("img");
	%>
	<div style="text-align: center">
		<form action="RentcarMain.jsp?section=CarReserveResult.jsp" method="post">
			<table width=��1000" >
				<tr height="100">
					<td align="center" colspan="3"><font size="6" color="gray">
							���ô뿩ǰ�� </font></td>
				</tr>
				<tr>
					<td rowspan="7" width="500"><img src="img/<%=img%>" alt=""
						width="450" /></td>
					<td width="250" align="center">�뿩�Ⱓ</td>
					<td width="250" align="center"><select name="pday">
							<option value="1">1��</option>
							<option value="2">2��</option>
							<option value="3">3��</option>
							<option value="4">4��</option>
							<option value="5">5��</option>
							<option value="6">6��</option>
							<option value="7">7��</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">�뿩��</td>
					<td width="250" align="center"><input type="date" name="rday"
						size="15"></td>
				</tr>
				<tr>
					<td width="250" align="center">��������</td>
					<td width="250" align="center"><select name="insurance">
							<option value="1">����(1�� 1����)</option>
							<option value="2">������</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">������ �뿩</td>
					<td width="250" align="center"><select name="bicycle">
							<option value="1">����(1�� 1����)</option>
							<option value="2">������</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">���̺� ��Ʈ</td>
					<td width="250" align="center"><select name="tableset">
							<option value="1">����(1�� 2����)</option>
							<option value="2">������</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">�ٺ�ť ȭ�μ�Ʈ</td>
					<td width="250" align="center"><select name="bbq">
							<option value="1">����(1�� 3����)</option>
							<option value="2">������</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="hidden" name="no"
						value="<%=no%>" /> <input type="hidden" name="qty"
						value="<%=qty%>" /> <input type="submit" value="���������ϱ�" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>