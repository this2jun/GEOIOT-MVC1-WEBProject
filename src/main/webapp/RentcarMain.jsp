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
	String section = request.getParameter("section");
	if (section == null) {
		section = "Section.jsp";
	}
	%>
	<table width="1000">
		<!-- header -->
		<tr height="140" align="center">
			<td align="center" width="1000"><jsp:include page="Header.jsp" />
			</td>
		</tr>
		<!-- section -->
		<tr align="center">
			<td align="center" width="1000"><jsp:include
					page="<%=section%>" /></td>
		</tr>
		<!-- Footer -->
		<tr height="100" align="center">
			<td align="center" width="1000"><jsp:include page="Footer.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>