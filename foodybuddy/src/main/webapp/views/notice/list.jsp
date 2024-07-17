<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodybuddy.notice.vo.Notice, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notice List</title>
</head>
<body>
    <h1>Notice List</h1>
    <a href="${pageContext.request.contextPath}/Notice/notices?action=create">Create New Notice</a>
    <table border="1">
        <thead>
            <tr>
                <th>No</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성날짜</th>
                <th>조회수</th>
                <th>상세</th>
            </tr>
        </thead>
        <tbody>    
            <%
                List<Notice> notices = (List<Notice>) request.getAttribute("notices");
                if (notices != null) {
                    for (Notice notice : notices) {
            %>
            <tr>
                <td><%= notice.getNotice_no() %></td>
                <td><%= notice.getNotice_title() %></td>
                <td><%= notice.getNotice_content() %></td>
                <td><%= notice.getNotice_date() %></td>
                <td><%= notice.getNotice_view_count() %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/Notice/notices?action=edit&id=<%= notice.getNotice_no() %>">수정</a>
                    <a href="<%= request.getContextPath() %>/Notice/notices?action=delete&id=<%= notice.getNotice_no() %>" onclick="return confirm('Are you sure?')">삭제</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6">No notices available.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
