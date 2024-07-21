<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.foodybuddy.user_manage.vo.User"%>
<!DOCTYPE html>
<html>
<head>
<title>User List</title>
<style>
/* 기본적인 스타일 설정 */
table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #ccc;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

a {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.search-box {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<h2>회원 목록</h2>

	<div class="search-box">
		<form action="<%=request.getContextPath()%>/user/list" method="get">
			<label for="search">닉네임 검색:</label> <input type="text" id="search"
				name="search" placeholder="닉네임 입력">
			<button type="submit">검색</button>
		</form>
	</div>

	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>등급번호</th>
				<th>등급이름</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>주소</th>
				<th>상세주소</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<User> userList = (List<User>) request.getAttribute("userList");
			for (User user : userList) {
			%>
			<tr>
				<td><%=user.getUser_no()%></td>
				<td><%=user.getGrade_no()%></td>
				<td><%=user.getGrade_name()%></td>
				<td><%=user.getUser_id()%></td>
				<td><a
					href="<%=request.getContextPath()%>/user/comments?user_no=<%=user.getUser_no()%>"><%=user.getUser_name()%></a></td>
				<td><%=user.getUser_phone()%></td>
				<td><%=user.getUser_email()%></td>
				<td><%=user.getUser_addr()%></td>
				<td><%=user.getUser_detailAddr()%></td>
				<td><%=user.getReg_date()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>
