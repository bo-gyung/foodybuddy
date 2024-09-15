<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<%@ page import="com.foodybuddy.foody.vo.Foody" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.foodybuddy.common.sql.JDBCTemplate" %>
<%@page import="com.foodybuddy.foodycomment.vo.Comment, java.util.*" %>
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<%@page import="com.foodybuddy.foody.vo.Foody, java.util.*" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>FOODY(맛집정보)</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../../resources/template/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../../resources/template/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../../resources/template/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"  />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../resources/template/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../../resources/template/css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="../include/navbar.jsp" %>
<div class="container-xxl py-5 bg-dark hero-header mb-5">
    			<div class="container text-center my-5 pt-5 pb-4">
        			<h1 class="display-3 text-white mb-5 pb-5 animated slideInDown">FOODY</h1>
        			<div class="input-group mt-5">
      			  </div>
   				 </div>
			</div>
		<div class="container-xxl py-5">
    <div class="container text-center">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
            <h5 class="section-title ff-secondary text-center text-primary fw-normal">맛집 정보 찾아보기</h5>
            <h1 class="mb-5">여기 맛집입니다</h1>
            <% List<Foody> list = (List<Foody>) request.getAttribute("resultList");
                for(int i = 0 ; i < 3 ; i++){ %>
            <%
                LocalDateTime regTimeTime = list.get(i).getreg_date();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH시 mm분");
                String formattedDate = regTimeTime.format(formatter);
            %>
            <div class="col-lg-6 mx-auto">
                <div class="d-flex align-items-center">
                    <h1 class="mb-5">TOP <%=(i+1) %></h1>
                    <img class="flex-shrink-0 img-fluid rounded" src="" alt="" style="width: 80px;">
                    <div class="w-100 d-flex flex-column text-start ps-4">
                        <h5 class="d-flex justify-content-between border-bottom pb-2">
                            <span><a href="/foody/view?foody_no=<%= list.get(i).getFoody_no() %>"><%= list.get(i).getFoody_title() %></a></span>
                            <span class="text-primary">좋아요 : <%= list.get(i).getFoody_good() %></span>
                        </h5>
                        <small class="fst-italic">
                        <a style="color:black;" >작성자 : <%= list.get(i).getUser_name() %></a> / 작성 시간 :<%= formattedDate %> / 조회수 : <%= list.get(i).getFoody_click() %>
                        </small>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>

			
 	<!-- 푸터 외부링크 -->
	<%@ include file="../include/footer.jsp" %>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
	
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../resources/template/lib/wow/wow.min.js"></script>
    <script src="../../resources/template/lib/easing/easing.min.js"></script>
    <script src="../../resources/template/lib/waypoints/waypoints.min.js"></script>
    <script src="../../resources/template/lib/counterup/counterup.min.js"></script>
    <script src="../../resources/template/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="../../resources/template/lib/tempusdominus/js/moment.min.js"></script>
    <script src="../../resources/template/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="../../resources/template/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="../../resources/template/js/main.js"></script>
</body>
</html>