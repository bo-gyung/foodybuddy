<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodybuddy.notice.vo.Notice" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodybuddy.user.vo.User" %>
<%@ include file="../include/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항</title>
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
            font-family: Arial, sans-serif;
            background-color: white;
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
        .main-content {
            flex: 1;
            padding: 20px;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        .create-button {
            display: inline-block;
            width: 100px;
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
            text-decoration: none;
            color: #333;
            cursor: pointer;
            margin-bottom: 10px;
        }
        .create-button:hover {
            background-color: #e0e0e0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
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
            color: #003f7f;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
         .table{
        	width: 79%;
        } 
    </style>
</head>
<body>
<!-- Hero Start -->
<div class="container-xxl py-5 bg-dark hero-header" style="margin-bottom: 0%;">
</div>
<div class="content-container">
    <% 
        User currentUser = (User) session.getAttribute("user");
        if (currentUser != null && currentUser.getGrade_no() == 4) { 
    %>
    <div class="sideBar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/user/list">회원 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/notices">공지사항 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/buddy_list">모임게시판 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/qna/list">QnA 관리</a></li>
        </ul>
    </div>
    <% } %>
    <div class="main-content">
        <h1>NOTICE</h1>
        <% if (currentUser != null && currentUser.getGrade_no() == 4) { %>
        <a href="notices/create" class="create-button">글쓰기</a>
        <% } %>
        
        
        <table class="table">
            <thead>
                <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
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
    </div>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/lib/wow/wow.min.js"></script>
<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/resources/template/js/main.js"></script>
</body>
</html>
