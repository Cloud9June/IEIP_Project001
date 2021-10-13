<%@page import="com.sungil.database.DBConnect"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    int in_custno = Integer.parseInt(request.getParameter("in_custno"));
	String sql="select custno, custname, phone, address, to_char(joindate,'yyyy-mm-dd') joindate, case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end grade, city from member_tbl_02 where custno =" + in_custno;

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css">

<script type="text/javascript">
	
</script>

<title>쇼핑몰 회원관리</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/nav.jsp"></jsp:include>

	<div class="section">



		<h3 class="title">회원정보</h3>

		<table class="table_line">

			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>회원전화</th>
				<th>회원주소</th>
				<th>가입일자</th>
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<th>도시코드</th>

			</tr>
			<%if(rs.next()){ %>
			<tr>
				<td><%= rs.getString("custno") %></td>
				<td><%= rs.getString("custname") %></td>
				<td><%= rs.getString("phone") %></td>
				<td><%= rs.getString("address") %></td>
				<td><%= rs.getString("joindate") %></td>
				<td><%= rs.getString("grade") %></td>
				<td><%= rs.getString("city") %></td>
			</tr>

			<tr>
				<td colspan="7" align="center"><input type="button" value="홈으로"
					onclick="location.href='index.jsp'">
			</tr>
			<%}else{ %>
			<p align="center">정보없음</p>
			<% } %>
		</table>



	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>