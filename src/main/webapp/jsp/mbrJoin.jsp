<%@page import="com.sungil.database.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql = "select max(custno)+1 from member_tbl_02";

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
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>홈쇼핑 회원등록</h2>
		<form name="mbrData" action="mbrInsert.jsp" method="post" onsubmit="return chkVal()">
			<table class="joinTable">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%= rs.getString(1) %>" size="10" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" size="10"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" size="15"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" size="20"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" size="10"></td>
				</tr>
				<tr>
					<!-- 연습차원에서 변경하여 사용 -->
					<th>고객등급</th>
					<td>
						<select name="grade">
							<option value="none">===== 선택 =====</option>
							<option value="A">VIP</option>
							<option value="B">일반</option>
							<option value="C">직원</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" size="10"></td>
				</tr>
				<tr>
					<td class="td_center" colspan="2">
						<input type="submit" value="등록">
						<input type="button" value="조회" onclick="location.href='mbrList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>