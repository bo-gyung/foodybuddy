<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodybuddy.user_manage.vo.Comment" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Comments</title>
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
   <h2>댓글 목록</h2>
    <form action="<%=request.getContextPath()%>/user/posts" method="get">
        <input type="hidden" name="user_no" value="<%=request.getParameter("user_no")%>"/>
        <button type="submit">게시글 목록</button>
    </form>
    <h2>Foody 댓글 목록</h2>
    <table>
        <thead>
            <tr>
                <th>게시글 번호</th>
                <th>게시글 제목</th>
                <th>댓글 내용</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Comment> foodyCommentList = (List<Comment>) request.getAttribute("foodyCommentList");
                for (Comment comment : foodyCommentList) {
            %>
                <tr>
                    <td><%= comment.getFoody_no() %></td>
                    <td><%= comment.getFoody_title() %></td>
                    <td><%= comment.getComment_main() %></td>
                    <td><%= comment.getReg_date() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <h2>Buddy 댓글 목록</h2>
    <table>
        <thead>
            <tr>
                <th>게시글 번호</th>
                <th>게시글 제목</th>
                <th>댓글 내용</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Comment> buddyCommentList = (List<Comment>) request.getAttribute("buddyCommentList");
                for (Comment comment : buddyCommentList) {
            %>
                <tr>
                    <td><%= comment.getFoody_no() %></td>
                    <td><%= comment.getFoody_title() %></td>
                    <td><%= comment.getComment_main() %></td>
                    <td><%= comment.getReg_date() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="<%= request.getContextPath() %>/user/list">이전</a>
</body>
</html>
