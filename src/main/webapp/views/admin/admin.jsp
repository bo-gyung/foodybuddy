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
    <a href="${pageContext.request.contextPath}/Notice/notices">공지사항 관리</a>

    <!-- 회원 목록 관리 -->
    <h2>회원 목록 관리</h2>
    <a href="${pageContext.request.contextPath}/user_manage/list">회원 목록 관리</a>
</body>
</html>
