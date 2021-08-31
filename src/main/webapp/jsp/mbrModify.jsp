<%@page import="com.sungil.database.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	StringBuffer sb = new StringBuffer();
	sb.append("select custno, custname, phone, address, to_char(joindate,'yyyymmdd') joindate, grade,");
	sb.append(" city from member_tbl_02 where custno="+request.getParameter("custno"));

	String sql =  sb.toString();

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css?ver=1">
<script type="text/javascript">
	function chkVal() {
		
		var form = document.mbrData;
		
		if(!form.custname.value) {
			alert("회원성명을 입력하세요.");
			form.custname.focus();
			return false;
		} else if(!form.phone.value) {
			alert("전화번호를 입력하세요.");
			form.phone.focus();
			return false;
		} else if(!form.address.value) {
			alert("주소를 입력하세요.");
			form.address.focus();
			return false;
		} else if(!form.joindate.value) {
			alert("가입일자를 입력하세요.");
			form.joindate.focus();
			return false;
		} else if(form.grade.value=="none") {
			alert("고객등급을 선택하세요.");
			form.grade.focus();
			return false;
		} else if(!form.city.value) {
			alert("도시코드를 입력하세요.");
			form.city.focus();
			return false;
		}
	}
	
	function chkDel(custno) {
		msg="정말 삭제하시겠습니까?";
		if(confirm(msg)!=0) {
			alert("삭제합니다.");
			location.href="mbrDelete.jsp?custno="+custno;
		} else {
			alert("취소");
		}
	}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>홈쇼핑 회원 수정</h2>
		<form name="mbrData" action="mbrUpdate.jsp" method="post" onsubmit="return chkVal()">
			<table class="joinTable">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%= rs.getString("custno") %>" size="10" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="<%= rs.getString("custname") %>" size="10"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="<%= rs.getString("phone") %>" size="15"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="<%= rs.getString("address") %>" size="20"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%= rs.getString("joindate") %>" size="10"></td>
				</tr>
				<tr>
					<!-- 연습차원에서 변경하여 사용 -->
					<th>고객등급</th>
					<td>
						<select name="grade">
							<option value="none">===== 선택 =====</option>
							<% if(rs.getString("grade").equals("A")) { %>
								<option value="A" selected>VIP</option>
								<option value="B">일반</option>
								<option value="C">직원</option>
							<% } %>
							<% if(rs.getString("grade").equals("B")) { %>
								<option value="A">VIP</option>
								<option value="B" selected>일반</option>
								<option value="C">직원</option>
							<% } %>
							<% if(rs.getString("grade").equals("C")) { %>
								<option value="A">VIP</option>
								<option value="B">일반</option>
								<option value="C" selected>직원</option>
							<% } %>
						</select>
					</td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%= rs.getString("city") %>" size="10"></td>
				</tr>
				<tr>
					<td class="td_center" colspan="2">
						<input type="submit" value="수정">
						<input type="button" value="조회" onclick="location.href='mbrList.jsp'">
						<!-- 연습차원에서 삭제 추가 -->
						<input type="button" value="삭제" onclick="chkDel(<%=rs.getString("custno") %>)">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>