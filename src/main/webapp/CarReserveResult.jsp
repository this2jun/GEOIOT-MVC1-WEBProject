<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	request.setCharacterEncoding("euc-kr");
	%>
	<jsp:useBean id="rbean" class="db.CarReserveBean">
		<jsp:setProperty name="rbean" property="*" />
	</jsp:useBean>
	<%
	String id = (String) session.getAttribute("id");
	if (id == null) {
	%>
	<script>
		alert("로그인후 예약이 가능합니다.");
		location.href = 'RentcarMain.jsp?section=MemberLogin.jsp';
	</script>
	<%
	}
	//날짜 유효성 검사
	Date d1 = new Date();
	Date d2 = new Date();
	// 날짜 형식 클래스 선언: 2020-12-29
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	d1 = sdf.parse(rbean.getRday()); //사용자 선택날짜
	d2 = sdf.parse(sdf.format(d2)); //시스템 현재날짜
	//날짜비교 메소드
	int compare = d1.compareTo(d2);
	if (compare < 0) { // 오늘보다 작은 값 즉, 이전 날짜 선택 시 예약 불가
	%>
	<script>
		alert("현재보다 이전 날짜는 선택할 수 없습니다");
		history.go(-1);
	</script>
	<%
	}
	// 구매 내역 데이터 저장 후 결과 페이지 표시
	// 아이디값이 빈 클래스에 없으므로
	String id1 = (String) session.getAttribute("id");
	rbean.setId(id1);
	// 데이터베이스에 빈 클래스 저장
	RentcarDAO rdao = new RentcarDAO();
	rdao.setReserveCar(rbean);

	// 차량정보 얻어오기
	CarListBean cbean = rdao.getOneCar(rbean.getNo());
	// 차량 총 금액
	int totalcar = cbean.getPrice() * rbean.getQty() * rbean.getPday();
	// 선택구매 금액
	int insurance = 0;
	if (rbean.getInsurance() == 1)
	insurance = 10000;
	int bicycle = 0;
	if (rbean.getBicycle() == 1)
	bicycle = 10000;
	int tableset = 0;
	if (rbean.getTableset() == 1)
	tableset = 20000;
	int bbq = 0;
	if (rbean.getBbq() == 1)
	bbq = 30000;
	int totaloption = rbean.getQty() * rbean.getPday() * (insurance + bicycle + tableset + bbq);
	%>

	<div style="text-align: center">
		<table width=“1000" >
			<tr height="100">
				<td align="center"><font size="6" color="gray"> 캠핑카
						예약완료화면 </font></td>
			</tr>
			<tr>
				<td align="center"><img src="img/<%=cbean.getImg()%>"
					width="470" />
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red"> 캠핑카 총예약금액
						<%=totalcar%> 원
				</font></td>
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red"> 캠핑카
						선택구매금액 <%=totaloption%> 원
				</font></td>
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red"> 캠핑카 렌탈총
						금액 <%=totalcar + totaloption%> 원
				</font></td>
			</tr>
			</div>
</body>
</html>