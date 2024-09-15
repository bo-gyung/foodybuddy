<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodybuddy.common.Paging" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/navbar.jsp" %>
    <title>User List</title>
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
        /* 기본적인 스타일 설정 */
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
        .main {
            flex: 1;
            padding: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .search-box {
            margin-bottom: 20px;
            text-align: center;
            
        }
        .search-box button {
            background-color: #ccc;
            color: #333;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
         .search-box button:hover {
            background-color: #bbb;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a, .pagination span {
            display: inline-block;
            margin: 0 5px;
            padding: 10px 15px;
            border: 1px solid #ccc;
            color: #003f7f;
            text-decoration: none;
        }
        .pagination span {
            background-color: #f2f2f2;
            border-color: #007bff;
            color: #333;
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
        <h2>회원 목록</h2>

        <div class="search-box">
            <form action="<%=request.getContextPath()%>/user/list" method="get">
                <label for="search">닉네임 검색:</label> 
                <input type="text" id="search" name="search" placeholder="닉네임 입력">
                <button type="submit">검색</button>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th>회원번호</th>
                    <th>등급번호</th>
                    <th>등급이름</th>
                    <th>아이디</th>
                    <th>닉네임</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>주소</th>
                    <th>상세주소</th>
                    <th>가입일</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<com.foodybuddy.user_manage.vo.User> userList = (List<com.foodybuddy.user_manage.vo.User>) request.getAttribute("userList");
                for (com.foodybuddy.user_manage.vo.User currentUser : userList) {
                %>
                <tr>
                    <td><%=currentUser.getUser_no()%></td>
                    <td><%=currentUser.getGrade_no()%></td>
                    <td><%=currentUser.getGrade_name()%></td>
                    <td><%=currentUser.getUser_id()%></td>
                    <td><a href="<%=request.getContextPath()%>/user/comments?user_no=<%=currentUser.getUser_no()%>"><%=currentUser.getUser_name()%></a></td>
                    <td><%=currentUser.getUser_phone()%></td>
                    <td><%=currentUser.getUser_email()%></td>
                    <td><%=currentUser.getUser_addr()%></td>
                    <td><%=currentUser.getUser_detailAddr()%></td>
                    <td><%=currentUser.getreg_date()%></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>

        <!-- Pagination Bar -->
        <div class="pagination">
            <%
            Paging paging = (Paging) request.getAttribute("paging");
            if (paging.isPrev()) {
            %>
            <a href="<%=request.getContextPath()%>/user/list?page=<%=paging.getPageBarStart() - 1%>">&laquo; Previous</a>
            <%
            }
            for (int i = paging.getPageBarStart(); i <= paging.getPageBarEnd(); i++) {
                if (i == paging.getNowPage()) {
            %>
            <span><%=i%></span>
            <%
                } else {
            %>
            <a href="<%=request.getContextPath()%>/user/list?page=<%=i%>"><%=i%></a>
            <%
                }
            }
            if (paging.isNext()) {
            %>
            <a href="<%=request.getContextPath()%>/user/list?page=<%=paging.getPageBarEnd() + 1%>">Next &raquo;</a>
            <%
            }
            %>
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