<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodybuddy.qna_manage.vo.Qna" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/navbar.jsp" %>
    <title>QnA List</title>
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
            color: #003f7f;
            text-decoration: none;
        }
        a:hover {
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
        <h2>QnA 대기 리스트</h2>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>회원번호</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>작성일</th>
                    <th>상태</th>
                    <th>답변</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Qna> pendingQnaList = (List<Qna>) request.getAttribute("pendingQnaList");
                    for (Qna qna : pendingQnaList) {
                %>
                    <tr>
                        <td><%= qna.getQna_no() %></td>
                        <td><a href="<%= request.getContextPath() %>/qna_manage/detail?qna_no=<%= qna.getQna_no() %>"><%= qna.getQna_title() %></a></td>
                        <td><%= qna.getQna_content() %></td>
                        <td><%= qna.getReg_date() %></td>
                        <td><%= qna.getQna_status() %></td>
                        <td><%= qna.getQna_answer() %></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <h2>QnA 완료 리스트</h2>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>회원번호</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>작성일</th>
                    <th>상태</th>
                    <th>답변</th>
                    <th>완료일</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Qna> completeQnaList = (List<Qna>) request.getAttribute("completeQnaList");
                    for (Qna qna : completeQnaList) {
                %>
                    <tr>
                        <td><%= qna.getQna_no() %></td>
                        <td><a href="<%= request.getContextPath() %>/qna_manage/detail?qna_no=<%= qna.getQna_no() %>"><%= qna.getQna_title() %></a></td>
                        <td><%= qna.getQna_content() %></td>
                        <td><%= qna.getReg_date() %></td>
                        <td><%= qna.getQna_status() %></td>
                        <td><%= qna.getQna_answer() %></td>
                        <td><%= qna.getComplete_date() %></td>
                    </tr>
                <%
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
