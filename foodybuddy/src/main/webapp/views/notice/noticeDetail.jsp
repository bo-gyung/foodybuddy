<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodybuddy.notice.vo.Notice" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/navbar.jsp" %>
    <title>공지사항 상세</title>
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
        #noticeContent, #editForm {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        #noticeContent h2 {
            margin-top: 0;
        }
        #noticeContent p, #editForm p {
            margin: 10px 0;
        }
        #editForm label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        #editForm input[type="text"], #editForm textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        #editForm textarea {
            height: 150px;
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
            color: #333;
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
    <div class="main-content">
        <h1>NOTICE</h1>

        <div id="noticeContent">
            <h2>제목: <%= ((Notice)request.getAttribute("notice")).getNotice_title() %></h2>
            <div class="info">
                <p>조회수: <%= ((Notice)request.getAttribute("notice")).getNotice_view_count() %></p>
                <p>작성일: <%= ((Notice)request.getAttribute("notice")).getNotice_date() %></p>
            </div>
            <p>내용: <%= ((Notice)request.getAttribute("notice")).getNotice_content() %></p>
        </div>

        <div id="editForm" style="display: none;">
            <form id="editNoticeForm" action="/notices/update" method="post">
                <input type="hidden" name="notice_id" value="<%= ((Notice)request.getAttribute("notice")).getNotice_no() %>">
                <p>
                    <label for="editTitle">제목:</label>
                    <input type="text" id="editTitle" name="notice_title" value="<%= ((Notice)request.getAttribute("notice")).getNotice_title() %>" required/>
                </p>
                <p>
                    <label for="editContent">내용:</label>
                    <textarea id="editContent" name="notice_content" required><%= ((Notice)request.getAttribute("notice")).getNotice_content() %></textarea>
                </p>
                <div class="action-buttons">
                    <input type="submit" value="수정">
                    <button type="button" onclick="cancelEdit()">취소</button>
                </div>
            </form>
        </div>

        <div class="action-buttons">
            <button id="editButton" onclick="toggleEditForm()">수정</button>
            <form action="/notices/delete" method="post" style="display: inline;">
                <input type="hidden" name="notice_id" value="<%= ((Notice)request.getAttribute("notice")).getNotice_no() %>">
                <input type="submit" value="삭제">
            </form>
        </div>

        <a href="/notices" class="back-link">이전</a>
    </div>
</div>

<script>
    function toggleEditForm() {
        var editForm = document.getElementById("editForm");
        var editButton = document.getElementById("editButton");
        var noticeContent = document.getElementById("noticeContent");

        if (editForm.style.display === "none") {
            // 수정 폼을 보이게 하고, 제목과 내용을 숨김
            editForm.style.display = "block";
            editButton.style.display = "none"; // 수정 버튼 숨기기
            noticeContent.style.display = "none";
        } else {
            // 수정 취소 시 제목과 내용을 보이게 하고, 수정 폼을 숨김
            editForm.style.display = "none";
            editButton.style.display = "block"; // 수정 버튼 보이기
            noticeContent.style.display = "block";
        }
    }

    function cancelEdit() {
        // 수정 폼을 숨기고 제목과 내용을 다시 보이게 함
        var editForm = document.getElementById("editForm");
        var editButton = document.getElementById("editButton");
        var noticeContent = document.getElementById("noticeContent");

        editForm.style.display = "none";
        editButton.style.display = "block"; // 수정 버튼 보이기
        noticeContent.style.display = "block";
    }
</script>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/lib/wow/wow.min.js"></script>
<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/resources/template/js/main.js"></script>
</body>
</html>
