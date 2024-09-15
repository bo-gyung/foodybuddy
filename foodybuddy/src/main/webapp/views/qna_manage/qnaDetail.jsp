<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodybuddy.qna_manage.vo.Qna" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/navbar.jsp" %>
    <title>QnA Detail</title>
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
        .qna-detail {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .qna-detail h2 {
            text-align: center;
        }
        .qna-detail p {
            margin: 10px 0;
        }
        .qna-detail .label {
            font-weight: bold;
        }
        .qna-detail .date {
            text-align: right;
            color: #666;
        }
        .qna-detail .answer-form {
            margin-top: 20px;
        }
        .qna-detail .answer-form textarea {
            width: 100%;
            height: 100px;
        }
        .action-buttons {
            display: flex;
            justify-content: space-between;
        }
        .action-buttons button {
            padding: 10px 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
            background-color: #f9f9f9;
            color: black;
        }
        .action-buttons button:hover {
            background-color: #e0e0e0;
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
        <div class="qna-detail">
            <h2>QnA</h2>
            <%
                Qna qna = (Qna) request.getAttribute("qna");
            %>
            <p class="label">제목:</p>
            <p><%= qna.getQna_title() %></p>
            <p class="label">내용:</p>
            <p><%= qna.getQna_content() %></p>
            <p class="date">작성일: <%= qna.getreg_date() %></p>
            
            <div class="answer-form">
                <form action="<%= request.getContextPath() %>/qna/answer" method="post">
                    <input type="hidden" name="qna_no" value="<%= qna.getQna_no() %>">
                    <p class="label">답변:</p>
                    <textarea name="answer" placeholder="답변을 입력해주세요" required><%= qna.getQna_answer() == null ? "" : qna.getQna_answer() %></textarea>
                    <div class="action-buttons">
                        <button type="submit">저장</button>
                        <button type="button" onclick="window.location.href='<%= request.getContextPath() %>/admin/qna/list'">이전</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/lib/wow/wow.min.js"></script>
<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/resources/template/js/main.js"></script>
</body>
</html>
