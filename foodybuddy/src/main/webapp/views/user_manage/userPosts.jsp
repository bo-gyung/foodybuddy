<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodybuddy.user_manage.vo.FoodyPost" %>
<%@ page import="com.foodybuddy.user_manage.vo.BuddyPost" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Posts</title>
    <style>
        /* 기본적인 스타일 설정 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
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
        .post-content {
            white-space: pre-wrap;
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
    <h2>Foody 게시글 목록</h2>
    <table>
        <thead>
            <tr>
                <th>게시글 번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>좋아요 수</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<FoodyPost> foodyPosts = (List<FoodyPost>) request.getAttribute("foodyPosts");
                for (FoodyPost post : foodyPosts) {
            %>
            <tr>
                <td><%= post.getFoody_no() %></td>
                <td><%= post.getFoody_title() %></td>
                <td class="post-content"><%= post.getFoody_main() %></td>
                <td><%= post.getReg_date() %></td>
                <td><%= post.getFoody_click() %></td>
                <td><%= post.getFoody_good() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <h2>Buddy 게시글 목록</h2>
    <table>
        <thead>
            <tr>
                <th>게시글 번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<BuddyPost> buddyPosts = (List<BuddyPost>) request.getAttribute("buddyPosts");
                for (BuddyPost post : buddyPosts) {
            %>
            <tr>
                <td><%= post.getBuddy_no() %></td>
                <td><%= post.getBuddy_title() %></td>
                <td><%= post.getBuddy_main() %></td>
                <td><%= post.getReg_date() %></td>
                <td><%= post.getBuddy_view() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <a href="<%= request.getContextPath() %>/user/list">이전</a>
</body>
</html>
