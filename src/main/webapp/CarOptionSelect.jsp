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
	int qty = Integer.parseInt(request.getParameter("qty")); // 수량
	// 이미지
	String img = request.getParameter("img");
	%>
	<div style="text-align: center">
		<form action="RentcarMain.jsp?section=CarReserveResult.jsp" method="post">
			<table width=“1000" >
				<tr height="100">
					<td align="center" colspan="3"><font size="6" color="gray">
							선택대여품목 </font></td>
				</tr>
				<tr>
					<td rowspan="7" width="500"><img src="img/<%=img%>" alt=""
						width="450" /></td>
					<td width="250" align="center">대여기간</td>
					<td width="250" align="center"><select name="pday">
							<option value="1">1일</option>
							<option value="2">2일</option>
							<option value="3">3일</option>
							<option value="4">4일</option>
							<option value="5">5일</option>
							<option value="6">6일</option>
							<option value="7">7일</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">대여일</td>
					<td width="250" align="center"><input type="date" name="rday"
						size="15"></td>
				</tr>
				<tr>
					<td width="250" align="center">보험적용</td>
					<td width="250" align="center"><select name="insurance">
							<option value="1">적용(1일 1만원)</option>
							<option value="2">비적용</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">자전거 대여</td>
					<td width="250" align="center"><select name="bicycle">
							<option value="1">적용(1일 1만원)</option>
							<option value="2">비적용</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">테이블 세트</td>
					<td width="250" align="center"><select name="tableset">
							<option value="1">적용(1일 2만원)</option>
							<option value="2">비적용</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">바베큐 화로세트</td>
					<td width="250" align="center"><select name="bbq">
							<option value="1">적용(1일 3만원)</option>
							<option value="2">비적용</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="hidden" name="no"
						value="<%=no%>" /> <input type="hidden" name="qty"
						value="<%=qty%>" /> <input type="submit" value="차량예약하기" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>