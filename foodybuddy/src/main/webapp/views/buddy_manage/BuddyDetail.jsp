<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodybuddy.buddy_manage.vo.BuddyPosts" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/navbar.jsp" %>
    <title>모임 게시글 상세</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resources/template/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/main.css" rel="stylesheet">

    <style>
        body {
            background-color: white;
            font-family: Arial, sans-serif;
        }
        .content-container {
            display: flex;
        }
        .sideBar {
            flex: 0 0 200px;
            padding: 20px;
            background-color: #f8f9fa;
            height: 100vh;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        .sideBar ul {
            list-style-type: none;
            padding: 0;
        }
        .sideBar ul li {
            margin-bottom: 10px;
        }
        .sideBar ul li a {
            text-decoration: none;
            color: #333;
            display: block;
            padding: 10px;
            border-radius: 4px;
        }
        .sideBar ul li a:hover {
            background-color: #e0e0e0;
        }
        .main {
            flex: 1;
            padding: 20px;
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
<!-- Hero Start -->
<div class="container-xxl py-5 bg-dark hero-header" style="margin-bottom: 0%;">
</div>
<!-- Hero End -->

<div class="content-container">
    <div class="sideBar">
        <ul>
            <br><br>
            <li><a href="${pageContext.request.contextPath}/user/list">회원 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/notices">공지사항 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/buddy_list">모임게시판 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/qna/list">QnA 관리</a></li>
        </ul>
    </div>

    <div class="main">
        <h1>모임 게시글 상세</h1>
        
        <div id="buddyContent">
            <h2>제목: <%= ((BuddyPosts)request.getAttribute("buddyPost")).getBuddy_title() %></h2>
            <p>작성일: <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(((BuddyPosts)request.getAttribute("buddyPost")).getreg_date()) %></p>
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
    </div>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/lib/wow/wow.min.js"></script>
<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/resources/template/js/main.js"></script>
</body>
</html>
