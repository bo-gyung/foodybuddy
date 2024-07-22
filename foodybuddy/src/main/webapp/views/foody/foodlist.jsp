<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- Navbar Link -->
	<%@ include file="../include/navbar.jsp" %>
	
				<%
			    String searchOption = request.getParameter("searchOption");
			    if (searchOption == null) {
			        searchOption = "2"; 
			    }
			
			    String searchbar = request.getParameter("searchbar");
			    if (searchbar == null) {
			        searchbar = ""; 
			    }
			
			    String sort = request.getParameter("sort");
			    if (sort == null) {
			        sort = "reg_date"; 
			    }
			
			    String nowPage = request.getParameter("nowPage");
			    if (nowPage == null) {
			        nowPage = "1"; 
			    }
			%>
	
        <!-- Hero Start -->
            <div class="container-xxl py-5 bg-dark hero-header mb-5">
    			<div class="container text-center my-5 pt-5 pb-4">
        			<h1 class="display-3 text-white mb-5 pb-5 animated slideInDown">FOODY</h1>
        			<!-- 검색창 -->
        			<div class="input-group mt-5">
						<form action="/board/foody" method="get" class="d-flex w-100 align-items-center">
	                    	<select name="searchOption" class="form-control border-primary py-3 ps-4 pe-5" style="flex: 0 0 10%; margin-right: 5%;">
	                        	<option value="2" <%= "2".equals(searchOption) ? "selected" : "" %>>제목</option>
	                        	<option value="1" <%= "1".equals(searchOption) ? "selected" : "" %>>작성자</option>
	                        	<option value="3" <%= "3".equals(searchOption) ? "selected" : "" %>>위치</option>
	                    	</select>
	                    	<input type="text" name="searchbar" placeholder="검색어 입력" value="<%= searchbar %>" class="form-control border-primary py-3 ps-4 pe-5" style="flex: 0 0 70%; margin-right: 5%;">
	                    <button type="submit" class="btn btn-primary py-2 btn-lg" style="flex: 0 0 10%;">검색</button>
	                </form>
      			  </div>
   				 </div>
			</div>
        <!-- Hero End -->


        <!-- Menu Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">맛집 정보 찾아보기</h5>
                    <h1 class="mb-5">FOODY BOARD</h1>
                </div>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
							    <form action="/board/foody" method="get" class="d-flex align-items-center text-start mx-3 me-0 pb-3">
							        <input type="hidden" name="sort" value="reg_date">
							        <button type="submit" class="btn btn-link p-0 d-flex align-items-center">
							            <i class="fa fa-coffee fa-2x text-primary"></i>
							            <div class="ps-3">
							                <small class="text-body">등록일자</small>
							                <h6 class="mt-n1 mb-0">최신 순</h6>
							            </div>
							        </button>
							    </form>
							</li>
                        <li class="nav-item">
							    <form action="/board/foody" method="get" class="d-flex align-items-center text-start mx-3 me-0 pb-3">
							        <input type="hidden" name="sort" value="foody_good">
							        <button type="submit" class="btn btn-link p-0 d-flex align-items-center">
							            <i class="fa fa-hamburger fa-2x text-primary"></i>
							            <div class="ps-3">
							                <small class="text-body">인기</small>
							                <h6 class="mt-n1 mb-0">좋아요 순</h6>
							            </div>
							        </button>
							    </form>
							</li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" href="/foody/viewTops">
                                <i class="fa fa-utensils fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">지난달</small>
                                    <h6 class="mt-n1 mb-0">TOP3</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                        <% User user1 = (User) session.getAttribute("user");
                        	if(user1 != null){
                        %>
                            <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" href="/foody/create">
                                <i class="fa fa-star fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">맛집</small>
                                    <h6 class="mt-n1 mb-0">글작성</h6>
                                </div>
                            </a>
                        <% 	}else{ %>
                        	<a class="d-flex align-items-center text-start mx-3 me-0 pb-3" href="/user/login">
                                <i class="fa fa-star fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">로그인</small>
                                    <h6 class="mt-n1 mb-0">하러가기</h6>
                                </div>
                            </a>
                        <% 	} %>
                        </li>
                    </ul>
                    <div class="tab-content">
                    	<!-- 기본, 최신순 -->
                    	<div id="tab-1" class="tab-pane fade show p-0 active">
                    	
                            <div class="row g-4">
                            <%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
						<%@ page import="com.foodybuddy.foody.vo.Foody, java.util.*" %>
						<%@ page import = "com.foodybuddy.user.vo.User" %>
						<% List<Foody> list = (List<Foody>) request.getAttribute("resultList"); 
							User user11 = (User) session.getAttribute("loginUser");
            			for(int i = 0 ; i < list.size(); i++){ %>
            			<%
						    LocalDateTime regDateTime = list.get(i).getReg_date();
						    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH시 mm분");
						    String formattedDate = regDateTime.format(formatter);
						%>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span><a href="/foody/view?foody_no=<%= list.get(i).getFoody_no() %>"><%= list.get(i).getFoody_title() %></a></span>
                                                <span class="text-primary">좋아요 : <%= list.get(i).getFoody_good() %></span>
                                            </h5>
                                            <small class="fst-italic">
                                            <a style="color:black;" >작성자 : <%= list.get(i).getUser_name() %></a> / 
                                            작성 시간 :<%= formattedDate %> / 
                                            조회수 : <%= list.get(i).getFoody_click() %>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            	<%} %>
                            	
	                        <!-- 페이징바 구성 -->
							<%@page import="com.foodybuddy.common.sql.Paging, java.util.List" %>
							<% Foody paging = (Foody)request.getAttribute("paging"); %>
							
							<% if(paging != null){ %>
									<div class="center col-9 pt-5" style="margin:auto;">
									    <div class="pagination" style="display: flex; justify-content: center">
									        <% if(paging.isPrev()) { %>
									            <a href="/board/foody?nowPage=<%=(paging.getPageBarStart()-1)%>&searchOption=<%= searchOption %>&searchbar=<%= searchbar %>&sort=<%= sort %>">&laquo;</a>
									        <% } %>
									        <% for(int i = paging.getPageBarStart(); i <= paging.getPageBarEnd(); i++) { %>
									            <a href="/board/foody?nowPage=<%= i %>&searchOption=<%= searchOption %>&searchbar=<%= searchbar %>&sort=<%= sort %>" <%= paging.getNowPage() == i ? "class='active'" : "" %>><%= i %>&nbsp;&nbsp;&nbsp;</a>
									        <% } %> 
									        <% if(paging.isNext()) { %>
									            <a href="/board/foody?nowPage=<%=(paging.getPageBarEnd()+1)%>&searchOption=<%= searchOption %>&searchbar=<%= searchbar %>&sort=<%= sort %>">&raquo;</a>
									        <% } %>
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
        

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Company</h4>
                        <a class="btn btn-link" href="">About Us</a>
                        <a class="btn btn-link" href="">Contact Us</a>
                        <a class="btn btn-link" href="">Reservation</a>
                        <a class="btn btn-link" href="">Privacy Policy</a>
                        <a class="btn btn-link" href="">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
                        <h5 class="text-light fw-normal">Monday - Saturday</h5>
                        <p>09AM - 09PM</p>
                        <h5 class="text-light fw-normal">Sunday</h5>
                        <p>10AM - 08PM</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
                        <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control border-primary w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved. 
							
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a><br><br>
                            Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


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