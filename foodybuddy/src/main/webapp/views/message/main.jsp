<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    

    <!-- Libraries Stylesheet -->
   
    
    <link href="../resources/template/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"  />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../resources/template/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../resources/template/css/style.css" rel="stylesheet">
    
     <style>
       
        
   
        .content {
            flex: 1; /* 남은 공간을 모두 차지하도록 설정 */
            padding: 20px;
            height: 100vh; /* 화면 전체 높이로 설정 */
            display: flex; /* Flexbox 레이아웃 사용 */
            flex-direction: column; /* 세로 방향으로 정렬 */
            justify-content: space-around; /* 수직 중앙 정렬 */
            align-items: flex-start; /* 왼쪽 정렬 */
        }
        
            body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex; /* 전체를 Flexbox로 설정 */
        }
        .sidebar {
            width: 200px; /* 메뉴바의 너비 */
            background-color: #333; /* 배경색 */
            color: white; /* 글자색 */
            padding: 20px; /* 안쪽 여백 */
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
        }
        .sidebar a {
            color: white; /* 링크 글자색 */
            text-decoration: none; /* 링크 밑줄 제거 */
            margin-bottom: 10px; /* 링크 사이 여백 */
        }
        .sidebar a:hover {
            text-decoration: underline; /* 호버시 밑줄 추가 */
        }
    </style>
</head>
<body>
    <%@ include file="../include/navbar.jsp" %>
               <!-- Hero Start -->
            <div class="container-xxl py-5 bg-dark hero-header mb-5">
               
        </div>
        <!-- Hero End -->

	
    <div class="content">
    <div class="sidebar">
        <a href="#">메뉴 1</a>
        <a href="#">메뉴 2</a>
        <a href="#">메뉴 3</a>
        <a href="#">메뉴 4</a>
    </div>
        <!-- 내용 영역 -->
        <h1>왼쪽에 시작하는 sidebar 예시</h1>
        <p>이곳에 sidebar를 왼쪽에서 시작하도록 배치하는 예시입니다.</p>
    </div>
    
        
        
        
        
        
        
        
        
        
        
        
    
    
    
    
    
   
    
    

         <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="../resources/template/lib/wow/wow.min.js"></script>
    <!-- Template Javascript -->
    <script src="../resources/template/js/main.js"></script>
</body>
</html>