<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodybuddy.buddy_manage.vo.BuddyPosts" %>
<!DOCTYPE html>
<html>
<head>
    <title>모임 게시판 리스트</title>
    <style>
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
    </style>
</head>
<body>
    <h2>모임 대기 리스트</h2>
    <table>
        <thead>
            <tr>
                <th>글번호</th>
                <th>작성자 닉네임</th>
                <th>글 제목</th>
                <th>작성일</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<BuddyPosts> pendingBuddyPosts = (List<BuddyPosts>) request.getAttribute("pendingBuddyPosts");
                for (BuddyPosts post : pendingBuddyPosts) {
            %>
                <tr>
                    <td><%= post.getBuddy_no() %></td>
                    <td><%= post.getUser_name() %></td>
                    <td><a href="<%=request.getContextPath()%>/buddy_detail?buddy_no=<%= post.getBuddy_no() %>"><%= post.getBuddy_title() %></a></td>
                    <td><%= post.getReg_date() %></td>
                    <td><%= post.getBuddy_approve() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <h2>모임 승인 리스트</h2>
    <table>
        <thead>
            <tr>
                <th>글번호</th>
                <th>작성자 닉네임</th>
                <th>글 제목</th>
                <th>작성일</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<BuddyPosts> approvedBuddyPosts = (List<BuddyPosts>) request.getAttribute("approvedBuddyPosts");
                for (BuddyPosts post : approvedBuddyPosts) {
            %>
                <tr>
                    <td><%= post.getBuddy_no() %></td>
                    <td><%= post.getUser_name() %></td>
                    <td><a href="<%=request.getContextPath()%>/buddy_detail?buddy_no=<%= post.getBuddy_no() %>"><%= post.getBuddy_title() %></a></td>
                    
                    <td><%= post.getReg_date() %></td>
                    <td><%= post.getBuddy_approve() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
