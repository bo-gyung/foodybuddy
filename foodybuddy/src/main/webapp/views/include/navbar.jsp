<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-xxl bg-white p-0">
	    <!-- Spinner Start -->
	    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
	        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
	            <span class="sr-only">Loading...</span>
	        </div>
	    </div>
	    <!-- Spinner End -->
	
	
	    <!-- Navbar Start -->
	    <div class="container-xxl position-relative p-0">
	        <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
	            <a href="/" class="navbar-brand p-0">
	                <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>FOODYBUDDY</h1>
	                <!-- <img src="img/logo.png" alt="Logo"> -->
	            </a>
	            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
	                <span class="fa fa-bars"></span>
	            </button>
	            <%@ page import="com.foodybuddy.user.vo.User" %>
			    <%
				    User user = (User)session.getAttribute("user");
					if(user == null){    
					// 비회원 메뉴바
			    %>
	            <div class="collapse navbar-collapse" id="navbarCollapse">
	                <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="/" class="nav-item nav-link">HOME</a>
                        <a href="/user/create" class="nav-item nav-link">SINGUP</a>
                        <a href="/user/login" class="nav-item nav-link">LOGIN</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">MENU</a>
                            <div class="dropdown-menu m-0">
                                <a href="/board/notice" class="dropdown-item">NOTICE</a>
                                <a href="/board/foody" class="dropdown-item">FOODY</a>
                                <a href="/board/buddy" class="dropdown-item">BUDDY</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
					}else if(user.getGrade_no()==4){
					// 관리자 메뉴바
                %>
                <div class="collapse navbar-collapse" id="navbarCollapse">
	                <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="/" class="nav-item nav-link">HOME</a>
                        <a href="/user/adminpage" class="nav-item nav-link">ADMIN PAGE</a>
                        <a href="/user/logout" class="nav-item nav-link">LOGOUT</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">MENU</a>
                            <div class="dropdown-menu m-0">
                                <a href="/board/notice" class="dropdown-item">NOTICE</a>
                                <a href="/board/foody" class="dropdown-item">FOODY</a>
                                <a href="/board/buddy" class="dropdown-item">BUDDY</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
					}else{
					// 회원 메뉴바
                %>
                <div class="collapse navbar-collapse" id="navbarCollapse">
	                <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="/" class="nav-item nav-link">HOME</a>
                        <a href="/userpage/userpagemain" class="nav-item nav-link">MY PAGE</a>
                        <a href="/message/main" class="nav-item nav-link">MESSAGE</a>
                        <a href="/user/logout" class="nav-item nav-link">LOGOUT</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">MENU</a>
                            <div class="dropdown-menu m-0">
                                <a href="/board/notice" class="dropdown-item">NOTICE</a>
                                <a href="/board/foody" class="dropdown-item">FOODY</a>
                                <a href="/board/buddy" class="dropdown-item">BUDDY</a>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </nav>
        </div>
	    <!-- Navbar End -->
    </div>
</body>
</html>