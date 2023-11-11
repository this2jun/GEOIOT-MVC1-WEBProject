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
		alert("로그인을 먼저 해주세요");
		location.href = 'RentcarMain.jsp?section=MemberLogin.jsp';
	</script>
	<%
	}
	//로그인 되어있는 해당 아이디(세션)로 예약현황 조회
	RentcarDAO rdao = new RentcarDAO();
	Vector<CarViewBean> v = rdao.getAllReserve(id);
	%>

	<div style="text-align: center">
		<table width=“1000">
			<tr height="100">
				<td align="center" colspan="1"><font size="6" color="gray">
						캠핑카 예약화면 </font></td>
			</tr>
		</table>
		<table width=“1000 " border="1">
			<tr height="40">
				<td width="150" align="center">이미지</td>
				<td width="150" align="center">차량이름</td>
				<td width="150" align="center">대여기간</td>
				<td width="60" align="center">대여일</td>
				<td width="100" align="center">렌트금액</td>
				<td width="60" align="center">수량</td>
				<td width="60" align="center">보험유무</td>
				<td width="60" align="center">자전거</td>
				<td width="60" align="center">테이블세트</td>
				<td width="60" align="center">바베큐세트</td>
				<td width="90" align="center">삭제</td>
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
						onclick="location.href='CarReserveDelete.jsp?reserveno=<%=bean.getReserveno()%>'">삭제</button>
				</td>
			</tr>
			<%
			}
			%>
		</table>
</body>
</html>