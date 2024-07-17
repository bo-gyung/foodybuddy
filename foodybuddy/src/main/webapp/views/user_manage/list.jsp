<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.foodybuddy.user_manage.vo.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <style>
        .form-control {
            display: inline-block;
            width: auto;
        }
        .btn {
            display: inline-block;
        }
    </style>
</head>
<body>
    <h1>회원목록 조회</h1>
    <form action="<%= request.getContextPath() %>/user_manage/list" method="get">
        <input type="text" name="findKeyword" placeholder="닉네임을 입력하세요" class="form-control mr-2">
        <button type="submit" class="btn btn-success">검색</button>
    </form>
    <%
        List<User> users = (List<User>) request.getAttribute("users");
        if (users != null && !users.isEmpty()) {
    %>
    <p>Number of users: <%= users.size() %></p>
    <table border="1">
        <thead>
            <tr>
                <th>회원번호</th>
                <th>등급번호</th>
                <th>아이디</th>
                <th>닉네임</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>우편번호</th>
                <th>주소</th>
                <th>상세주소</th>
                <th>추가주소</th>
                <th>질문</th>
                <th>답변</th>
                <th>경고횟수</th>
                <th>가입날짜</th>
                <th>등급</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (User user : users) {
            %>
            <tr>
                <td><%= user.getUser_no() %></td>
                <td><%= user.getGrade_no() %></td>
                <td><%= user.getUser_id() %></td>
                <td><%= user.getUser_name() %></td>
                <td><%= user.getUser_phone() %></td>
                <td><%= user.getUser_email() %></td>
                <td><%= user.getUser_postcode() %></td>
                <td><%= user.getUser_addr() %></td>
                <td><%= user.getUser_detailAddr() %></td>
                <td><%= user.getUser_extraAddr() %></td>
                <td><%= user.getUser_question() %></td>
                <td><%= user.getUser_answer() %></td>
                <td><%= user.getUser_warn() %></td>
                <td><%= user.getReg_date() %></td>
                <td><%= user.getGrade_name() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        } else {
    %>
    <p>No users available.</p>
    <%
        }
    %>
</body>
</html>
