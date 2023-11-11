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
		<!-- DB연결 최신순 자동차 3대 표시-->
		<%
		RentcarDAO rdao = new RentcarDAO();
		// 벡터를 이용하여 차량 정보 저장
		Vector<CarListBean> v = rdao.getSelectCar();
		%>

		<table width="1000">
			<tr height="100">
				<td align="center" colspan="3"><font size="6" color="gray">
						최신상 럭셔리 캠핑카</font></td>
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
						차량명:
						<%=bean.getName()%></td>
				<%
				}
				%>
			
		</table>
		<hr color="red" size="3">
		<p>
			<font size="4" color="gray"> 차량검색하기</font> <br>
			<br>
			<br>
		<form action="RentcarMain.jsp?section=CarCategoryList.jsp"
			method="post">
			<font size="3" color="gray"> <b> 차량검색하기 </b></font> &nbsp;&nbsp; <select
				name="category">
				<option value="1">A클래스</option>
				<option value="2">B클래스</option>
				<option value="3">C클래스</option>
				<option value="4">카라반</option>
				<option value="5">트레일러</option>
			</select> &nbsp;&nbsp; <input type="submit" value="검색" /> &nbsp;&nbsp; <input
				type="button" value="전체검색"
				onclick="location.href='RentcarMain.jsp?section=CarAllList.jsp'" />
		</form>
	</div>
</body>
</html>