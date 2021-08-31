<%@page import="com.sungil.database.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	StringBuffer sb = new StringBuffer();
	sb.append("select mbr.custno, mbr.custname,");
	sb.append(" case mbr.grade when 'A' then 'VIP' when 'B' then '일반' else '직원' end grade,");
	sb.append(" sum(mon.price) price");
	sb.append(" from member_tbl_02 mbr, money_tbl_02 mon");
	sb.append(" where mbr.custno = mon.custno");
	sb.append(" group by mbr.custno, mbr.custname, mbr.grade");
	sb.append(" order by price desc");
	
	String sql =  sb.toString();
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css?ver=1">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>회원목록조회/수정</h2>
		
		<table>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>
				</tr>
			</thead>
			<tbody>
			<%
				while(rs.next()) {
			%>
				<tr>
					<td><%= rs.getString("custno") %></td>
					<td><%= rs.getString("custname") %></td>
					<td><%= rs.getString("grade") %></td>
					<td><%= rs.getString("price") %></td>																			
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</section>

	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>