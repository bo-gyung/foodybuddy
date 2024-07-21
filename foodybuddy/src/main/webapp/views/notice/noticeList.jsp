<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodybuddy.notice.vo.Notice" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        .create-button {
            display: block;
            width: 100px;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
            text-decoration: none;
            color: #333;
            cursor: pointer;
        }
        .create-button:hover {
            background-color: #e0e0e0;
        }
        table {
            width: 80%;
            margin: 20px auto;
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
    <h1>공지사항</h1>
    <a href="notices/create" class="create-button">글쓰기</a>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Date</th>
                <th>View Count</th>
            </tr>
        </thead>
        <tbody>
            <% List<Notice> notices = (List<Notice>) request.getAttribute("notices");
               if (notices != null) {
                   for (Notice notice : notices) {
            %>
            <tr>
                <td><%= notice.getNotice_no() %></td>
                <td><a href="/notices/detail?id=<%= notice.getNotice_no() %>"><%= notice.getNotice_title() %></a></td>
                <td><%= notice.getNotice_date() %></td>
                <td><%= notice.getNotice_view_count() %></td>
            </tr>
            <%     }
               }
            %>
        </tbody>
    </table>
</body>
</html>
