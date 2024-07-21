<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodybuddy.buddy_manage.vo.BuddyPosts" %>
<!DOCTYPE html>
<html>
<head>
    <title>모임 게시글 상세</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        #buddyContent {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        #buddyContent h2 {
            margin-top: 0;
        }
        #buddyContent p {
            margin: 10px 0;
        }
        .action-buttons {
            text-align: center;
            margin-top: 20px;
        }
        .action-buttons button, .action-buttons input[type="submit"] {
            padding: 10px 20px;
            margin: 0 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
            background-color: #f9f9f9;
        }
        .action-buttons button:hover, .action-buttons input[type="submit"]:hover {
            background-color: #e0e0e0;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #333;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>모임 게시글 상세</h1>
    
    <div id="buddyContent">
        <h2>제목: <%= ((BuddyPosts)request.getAttribute("buddyPost")).getBuddy_title() %></h2>
        <p>작성일: <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(((BuddyPosts)request.getAttribute("buddyPost")).getReg_date()) %></p>
        <p>내용: <%= ((BuddyPosts)request.getAttribute("buddyPost")).getBuddy_main() %></p>
    </div>
    
    <div class="action-buttons">
        <form action="<%=request.getContextPath()%>/buddy_approve" method="post" style="display: inline;">
            <input type="hidden" name="buddy_no" value="<%= ((BuddyPosts)request.getAttribute("buddyPost")).getBuddy_no() %>">
            <input type="submit" value="승인">
        </form>
        <form action="<%=request.getContextPath()%>/buddy_reject" method="post" style="display: inline;">
            <input type="hidden" name="buddy_no" value="<%= ((BuddyPosts)request.getAttribute("buddyPost")).getBuddy_no() %>">
            <input type="submit" value="반려">
        </form>
    </div>
    
    <a href="<%=request.getContextPath()%>/buddy_list" class="back-link">이전</a>
</body>
</html>
