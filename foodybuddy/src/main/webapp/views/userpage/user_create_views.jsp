<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page-내 작성글 조회</title>
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
    <link href="../../resources/template/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../resources/template/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../../resources/template/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- Navbar Link -->
	<%@ include file="../include/navbar.jsp" %>
    <!-- Hero Start -->
    <div class="container-xxl py-5 bg-dark hero-header mb-5">
        <div class="container text-center my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">MyPage</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center text-uppercase">
                    <li class="breadcrumb-item" ><a href="/userpage/userpagemain">내 정보 조회/변경</a></li>
                    <li class="breadcrumb-item"><a href="/user/pageList?menu=user_create_views" style="color:white;">내 작성글 조회</a></li>
                    <li class="breadcrumb-item"><a href="../views/error404.jsp">내 좋아요 조회</a></li>
                    <li class="breadcrumb-item"><a href="../views/error500.jsp">내 모임 조회</a></li>
                    <li class="breadcrumb-item"><a href="/qna/list">Q&A</a></li>
                </ol>
            </nav>
        </div>
    </div>
	<!-- Hero End -->

        <!-- Menu Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">FoodyBuddy</h5>
                    <h1 class="mb-5">내 작성글 조회</h1>
                </div>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
                                <i class="fa fa-coffee fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Foody</small>
                                    <h6 class="mt-n1 mb-0">맛집정보</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
                                <i class="fa fa-hamburger fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Buddy</small>
                                    <h6 class="mt-n1 mb-0">여기서 모이기</h6>
                                </div>
                            </a>
                        </li>
                        
                    </ul>
                    
                    <%@page import="com.foodybuddy.buddy.vo.Buddy, com.foodybuddy.foody.vo.Foody, java.util.*" %>
                    <%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
                    <% 
                    List<Foody> foody_list = (List<Foody>)request.getAttribute("foody_list"); 
                    List<Buddy> buddy_list = (List<Buddy>)request.getAttribute("buddy_list");
                    %>
                    <div class="tab-content">
                    
                    	<!-- 맛집정보 게시판 -->
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                             <%for(int i = 0 ; i < foody_list.size() ; i++){ %>
			                    <%
							    LocalDateTime regDateTime = foody_list.get(i).getReg_date();
							    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH시 mm분");
							    String formattedDate = regDateTime.format(formatter);
								%>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="img/menu-1.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span><a href="/foody/view?foody_no=<%=foody_list.get(i).getFoody_no()%>"><%=foody_list.get(i).getFoody_title() %></a></span>
                                                <span class="text-primary">좋아요 : <%= foody_list.get(i).getFoody_good() %></span>
                                            </h5>
                                            <small class="fst-italic">
                                            작성자 : <%= foody_list.get(i).getUser_name() %> / 
                                            작성 시간 :<%= formattedDate %> / 
                                            조회수 : <%= foody_list.get(i).getFoody_click() %>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            <%} %> 
                            </div>
                        </div> 
                        
                        <!-- 모임게시판 -->
                        
                        <div id="tab-2" class="tab-pane fade show p-0">
                            <div class="row g-4">
                            
                            <% for(int i = 0 ; i < buddy_list.size() ; i++){ %>
	                                <div class="col-lg-6">
	                                    <div class="d-flex align-items-center">
	                                        <img class="flex-shrink-0 img-fluid rounded" src="img/menu-1.jpg" alt="" style="width: 80px;">
	                                        <div class="w-100 d-flex flex-column text-start ps-4">
	                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                                <span><a href="/board/buddy/post?buddy_no=<%=buddy_list.get(i).getBuddy_no()%>"><%=buddy_list.get(i).getBuddy_title() %></a></span>
	                                                <span class="text-primary">$115</span>
	                                            </h5>
	                                            <small class="fst-italic">
	                                            작성자 : <%=buddy_list.get(i).getUser_name() %> / 
	                                            모임일 : <%=buddy_list.get(i).getMeet_date() %> / 
	                                            댓글 : 댓글수 / 
	                                            조회수 : <%=buddy_list.get(i).getBuddy_view() %>
	                                            </small>
	                                        </div>
	                                    </div>
	                                </div>
	                            <%} %>	
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Menu End -->
        

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