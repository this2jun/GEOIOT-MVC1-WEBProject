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
	<%
	//ī�װ� �з���
	int category = Integer.parseInt(request.getParameter("category"));
	String temp = "";
	if (category == 1)
		temp = "AŬ����";
	else if (category == 2)
		temp = "BŬ����";
	else if (category == 3)
		temp = "CŬ����";
	else if (category == 4)
		temp = "ī���";
	else if (category == 5)
		temp = "Ʈ���Ϸ�";
	%>
	<div style="text-align: center">
		<table width="1000">
			<tr height="100">
				<td align="center" colspan="3"><font size="6" color="gray">
						<%=temp%> ķ��ī
				</font></td>
			</tr>
			<%
			RentcarDAO rdao = new RentcarDAO();
			Vector<CarListBean> v = rdao.getCategoryCar(category);

			//tr�� 3���� �����ְ� �ٽ� tr�� ������ �� �ֵ��� ���� ����
			int j = 0;
			for (int i = 0; i < v.size(); i++) {
				//���Ϳ� ����Ǿ� �ִ� �� Ŭ������ ����
				CarListBean bean = v.get(i);
				if (j % 3 == 0) {
			%>
			<tr height="220">
				<%
				}
				%>
				
				<td width="333" align="center"><a
					href="RentcarMain.jsp?section=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
						<img src="img/<%=bean.getImg()%>" alt="" width="300" height="200" />
				</a>
				<p>
						<font size="3" color="gray"> <b> ������ : <%=bean.getName()%></b></font></td>
				<%
				j = j + 1;
				} //for
				%>
			</tr>
		</table>
	</div>
</body>
</html>