<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.foodybuddy.userpage.vo.QnA, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 목록</title>
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

	<!-- Hero Start -->
            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-5 pb-5 animated slideInDown">
                     <a href="/qna/list" class="text-white">QnA게시판</a>
                    </h1>
                       
                       <!-- 검색창 -->
                    <div class="input-group mt-5">
						<button class="btn btn-outline-secondary dropdown-toggle py-2 position-absolute mt-2 me-2"style="min-width : 5%; background-color : Lightgray;" type="button" data-bs-toggle="dropdown" aria-expanded="false">제목</button>
						
							<!-- 제목을 기준으로 검색 -->
						<input type="text" class="form-control border-primary w-100 py-3 ps-4 pe-5" style="max-width: 70%; margin-left : 15%;" id = "qna_title" >
						<button onclick="submitSearch()" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2 btn-lg" >검색</button>
						
					</div>
                </div>
            </div>
            
            <!--ajax 검색  -->
            <script>
            function submitSearch() {
                let title = $('#qna_title').val();
                
                if (!title) {
                    alert("검색어를 입력하세요");
                    $('#qna_title').focus();
                    return;
                }
                
                $.ajax({
                    url: '/qna/list',
                    type: 'GET',
                    data: {
                        qna_title: title
                    },
                    success: function(response) {
                        // 서버에서 성공적인 응답을 받은 후의 처리
                        alert("검색이 완료되었습니다.");
                        // 검색 결과를 처리하거나 페이지를 리다이렉트할 수 있습니다.
                        window.location.href = '/qna/list?qna_title=' + encodeURIComponent(title);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        // 서버에서 에러 응답을 받은 후의 처리
                        alert("검색에 실패했습니다.");
                    }
                });
            }
            </script>
            <!-- heroEnd -->
			<!--목록 시작  -->
			<!-- Menu Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    
                    <h1 class="mb-5">QnA목록</h1>
                </div>
         
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active"  href= "/qna/create">
                                <i class="fa fa-coffee fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">QnA</small>
                                    <h6 class="mt-n1 mb-0">글작성</h6>
                                </div>
                            </a>
                        </li>
                        
                    </ul>
        </div>
        </div>            
	<section>
		<!-- css 추가 -->
		<!-- 조회수순 -->
                        <div id="tab-2" class="tab-pane fade show p-0">
    <div class="row g-4">
        <% 
        List<QnA> list = (List<QnA>)request.getAttribute("resultList");
        for(int i = 0; i < list.size(); i++){
            QnA qna = list.get(i);
            String status = qna.getQna_status();
            String statusText = "대기";
            if("완료".equals(status)){
                statusText = "완료";
            }
        %>
            <div class="col-lg-6">
                <div class="d-flex align-items-center border p-3 rounded bg-light">
                    
                    <div class="w-100 d-flex flex-column text-start ps-4">
                        <h5 class="d-flex justify-content-between border-bottom pb-2">
                            <span><a href="/qna/detail?qna_no=<%= qna.getQna_no() %>"><%= qna.getQna_title() %></a></span>
                            <span class="text-primary">작성날짜 : <%= qna.getReg_date() %></span>
                        </h5>
                        <small class="fst-italic">글번호 : <%= qna.getQna_no() %> / 처리상태 : <%= statusText %></small>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>
			
				<!-- 페이징바 -->
					  
						<% QnA paging = (QnA)request.getAttribute("paging"); %>
						<%if (paging != null) {%>
							<div class="center col-9 pt-5" style="margin:auto;">
								<div class="pagination" style="display: flex; justify-content: center">
								<!--첫번째 트루면 작동, false면 작동X  -->
								<%if(paging.isPrev()){ %>
										<a href = "/qna/list?noPage=<%=(paging.getPageBarStart()-1)%>">&laquo;</a>
									<%} %>
								<%for(int i = paging.getPageBarStart(); i <=paging.getPageBarEnd(); i++){ %>
									<a href = "/qna/list?nowPage=<%=i%>"
									<%=paging.getNowPage() == i ? "class='active'" : "" %>>
									<%=i%>
									</a>
									<%} %>
									<%if (paging.isNext()){ %>
										<a href = "/qna/list?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
										<%} %>
								</div>
							</div>
				<%} %>
					 

	</section>
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
				 
</body>
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
</html>