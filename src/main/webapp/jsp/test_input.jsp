<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script type="text/javascript">
	function checkValue2() {
		  if(!document.data1.in_custno.value) {
			  alert("회원번호를 입력하세요.");
			  document.data.custname.focus();
			  return false;
		  	}
		  }
</script>
<title>쇼핑몰 회원관리</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/nav.jsp"></jsp:include>
	<div class="section">
		<h3 class="title">회원조회</h3>
		<form name="data1" action="test_search_list.jsp" method="post"
			onsubmit="return checkValue2()">
			<table class="table_line">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="in_custno" size="10"></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="button" value="취소"
						onclick="location.href='member_list.jsp'"> <input
						type="submit" value="조회"
						onclick="location.href='member_serch_list.jsp'">
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
