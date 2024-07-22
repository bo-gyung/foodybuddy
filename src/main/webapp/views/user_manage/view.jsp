<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.foodybuddy.user_manage.vo.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Detail</title>
</head>
<body>
    <h1>User Detail</h1>
    <%
        User user = (User) request.getAttribute("user");
        if (user != null) {
    %>
    <p>User No: <%= user.getUser_no() %></p>
    <p>Grade No: <%= user.getGrade_no() %></p>
    <p>User ID: <%= user.getUser_id() %></p>
    <p>User Name: <%= user.getUser_name() %></p>
    <p>User Phone: <%= user.getUser_phone() %></p>
    <p>User Email: <%= user.getUser_email() %></p>
    <p>User Postcode: <%= user.getUser_postcode() %></p>
    <p>User Addr: <%= user.getUser_addr() %></p>
    <p>User Detail Addr: <%= user.getUser_detailAddr() %></p>
    <p>User Extra Addr: <%= user.getUser_extraAddr() %></p>
    <p>User Question: <%= user.getUser_question() %></p>
    <p>User Answer: <%= user.getUser_answer() %></p>
    <p>User Warn: <%= user.getUser_warn() %></p>
    <p>Join Date: <%= user.getReg_date() %></p>
    <p>Grade: <%= user.getGrade_name() %></p>
    <%
        } else {
    %>
    <p>No user details available.</p>
    <%
        }
    %>
    <a href="<%= request.getContextPath() %>/users">Back to list</a>
</body>
</html>
