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
		alert("�α����� ������ �����մϴ�.");
		location.href = 'RentcarMain.jsp?section=MemberLogin.jsp';
	</script>
	<%
	}
	//��¥ ��ȿ�� �˻�
	Date d1 = new Date();
	Date d2 = new Date();
	// ��¥ ���� Ŭ���� ����: 2020-12-29
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	d1 = sdf.parse(rbean.getRday()); //����� ���ó�¥
	d2 = sdf.parse(sdf.format(d2)); //�ý��� ���糯¥
	//��¥�� �޼ҵ�
	int compare = d1.compareTo(d2);
	if (compare < 0) { // ���ú��� ���� �� ��, ���� ��¥ ���� �� ���� �Ұ�
	%>
	<script>
		alert("���纸�� ���� ��¥�� ������ �� �����ϴ�");
		history.go(-1);
	</script>
	<%
	}
	// ���� ���� ������ ���� �� ��� ������ ǥ��
	// ���̵��� �� Ŭ������ �����Ƿ�
	String id1 = (String) session.getAttribute("id");
	rbean.setId(id1);
	// �����ͺ��̽��� �� Ŭ���� ����
	RentcarDAO rdao = new RentcarDAO();
	rdao.setReserveCar(rbean);

	// �������� ������
	CarListBean cbean = rdao.getOneCar(rbean.getNo());
	// ���� �� �ݾ�
	int totalcar = cbean.getPrice() * rbean.getQty() * rbean.getPday();
	// ���ñ��� �ݾ�
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
		<table width=��1000" >
			<tr height="100">
				<td align="center"><font size="6" color="gray"> ķ��ī
						����Ϸ�ȭ�� </font></td>
			</tr>
			<tr>
				<td align="center"><img src="img/<%=cbean.getImg()%>"
					width="470" />
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red"> ķ��ī �ѿ���ݾ�
						<%=totalcar%> ��
				</font></td>
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red"> ķ��ī
						���ñ��űݾ� <%=totaloption%> ��
				</font></td>
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red"> ķ��ī ��Ż��
						�ݾ� <%=totalcar + totaloption%> ��
				</font></td>
			</tr>
			</div>
</body>
</html>