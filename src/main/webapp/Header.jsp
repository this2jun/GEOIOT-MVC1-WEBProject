<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 세션을 이용한 로그인 처리 -->
	<%
	//로그아웃 클릭시 파라미터를 통해 로그아웃 여부 확인
	String logout = request.getParameter("logout");
	if (logout != null) { // 로그아웃 값이 널이 아닌경우(로그아웃버튼 클릭 시)
		session.setAttribute("id", null); // id null설정
		session.setMaxInactiveInterval(0); // 세션유지시간종료 
	}
	String id = (String) session.getAttribute("id");
	//로그인이 되어 있지 않다면
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
			<td align="center" width="200"><%=id%> 님 <%
			if (id.equals("Guest")) {
			%>
				<button
					onclick="location.href='RentcarMain.jsp?section=MemberLogin.jsp'">로그인</button>
				<%
				} else {
				%>
				<button onclick="location.href='RentcarMain.jsp?logout=1'">로그아웃</button>
				<%
				}
				%></td>
		</tr>
		<tr height="50">
			<td align="center" width="200" bgcolor="black"><a
				href="RentcarMain.jsp?section=CarReserveMain.jsp"
				style="text-decoration: none"><font color="white" size="4">
						예약하기</font> </a></td>
			<td align="center" width="200" bgcolor="black"><a
				href="RentcarMain.jsp?section=CarReserveView.jsp"
				style="text-decoration: none"> <font color="white" size="4">
						예약확인</font>
			</a></td>
			<td align="center" width="200" bgcolor="black"><a href="#"
				style="text-decoration: none"><font color="white" size="4">
						자유게시판</font> </a></td>
			<td align="center" width="200" bgcolor="black"><a href="#"
				style="text-decoration: none"><font color="white" size="4">
						이벤트</font> </a></td>
			<td align="center" width="200" bgcolor="black"><a href="#"
				style="text-decoration: none"><font color="white" size="4">
						고객센터</font> </a></td>
		</tr>
	</table>
</body>
</html>