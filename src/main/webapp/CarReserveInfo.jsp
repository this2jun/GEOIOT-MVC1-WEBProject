<%@page import="db.CarListBean"%>
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
	int no = Integer.parseInt(request.getParameter("no"));
	RentcarDAO rdao = new RentcarDAO();
	//한 캠핑카 대한 정보를 반환
	CarListBean bean = rdao.getOneCar(no);
	int category = bean.getCategory();
	String temp = "";
	if (category == 1)
		temp = "A클래스";
	else if (category == 2)
		temp = "B클래스";
	else if (category == 3)
		temp = "C클래스";
	else if (category == 4)
		temp = "카라반";
	else if (category == 5)
		temp = "트레일러";
	%>

	<div style="text-align: center">
		<form action="RentcarMain.jsp?section=CarOptionSelect.jsp" method = "post">
			<table>
				<tr height="100">
					<td align="center" colspan="3"><font size="6" color="gray">
							<%=bean.getName()%> 차량선택
					</font></td>
				</tr>
				<tr>
					<td rowspan="6" width="500"><img src="img/<%=bean.getImg()%>"
						alt="" width="450" /></td>
					<td width="250" align="center">캠핑카이름</td>
					<td width="250" align="center"><%=bean.getName()%></td>
				</tr>
				<tr>
					<td width="250" align="center">캠핑카수량</td>
					<td width="250" align="center"><select name="qty">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">캠핑카분류</td>
					<td width="250" align="center"><%=temp%></td>
				</tr>
				<tr>
					<td width="250" align="center">대여가격</td>
					<td width="250" align="center"><%=bean.getPrice()%></td>
				</tr>
				<tr>
					<td width="250" align="center">제조회사</td>
					<td width="250" align="center"><%=bean.getCompany()%></td>
				</tr>
				<tr>
					<td align="center" colspan=2><input type="hidden" name="no"
						value="<%=bean.getNo()%>" /> <input type="hidden" name="img"
						value="<%=bean.getImg()%>" /> <input type="submit" value="선택대여품목">
					</td>
				</tr>
			</table>
			<br>
			<br>
			<br> <font size="5" color="gray"> 차량정보보기</font>
			<p>
				<%=bean.getInfo()%>
		</form>
	</div>
</body>
</html>