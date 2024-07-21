<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
</head>
<body>
    <h1>관리자 페이지</h1>
    <p>Welcome to the admin page!</p>
    
    <!-- 공지사항 관리 -->
    <h2>공지사항 관리</h2>
    <a href="${pageContext.request.contextPath}/notices">공지사항 관리</a>

    <!-- 회원 목록 관리 -->
    <h2>회원 목록 관리</h2>
    <a href="${pageContext.request.contextPath}/user/list">회원 목록 관리</a>

    <!-- 큐앤에이 관리 -->
    <h2>큐앤에이 관리</h2>
    <a href="${pageContext.request.contextPath}/qna/list">큐앤에이 관리</a>
    
    <h2>모임게시판 관리</h2>
    <a href="${pageContext.request.contextPath}/buddy_list">모임게시판 관리</a>
</body>
</html>
