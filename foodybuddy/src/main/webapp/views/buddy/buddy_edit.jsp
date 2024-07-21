<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUDDY(같이가기)</title>
<!-- BUDDY(같이가기) 글쓰기 -->
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
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Buddy</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
			                <li class="breadcrumb-item"><a href="/">Home</a></li>
			                <li class="breadcrumb-item"><a href="/board/foody">Foody</a></li>
			                <li class="breadcrumb-item"><a href="/board/buddy" style="color:white;">Buddy</a></li>
			            </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- Contact Start -->
        	<%@page import="com.foodybuddy.buddy.vo.Buddy, java.util.*" %>
			<% 
				Map<String,Object> post = (Map<String,Object>)request.getAttribute("post"); 
			
			%>
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Buddy</h5>
                    <h1 class="mb-5">여기서 모이기</h1>
                </div>
                <div class="row g-4">
                    <div class="col-12">
                        <div class="row gy-4" style="text-align : center">
                        <% %>
                            <div class="col-md-4">
                                <h5 class="section-title ff-secondary fw-normal text-start text-primary">가게이름</h5>
                                <p><i class="fa fa-store text-primary me-2"></i><%=post.get("가게이름") %></p>
                            </div>
                            <div class="col-md-4">
                                <h5 class="section-title ff-secondary fw-normal text-start text-primary">가게주소</h5>
                                <p><i class="fa fa-map-marked text-primary me-2"></i><%=post.get("가게주소") %></p>
                            </div>
                            <div class="col-md-4">
                                <h5 class="section-title ff-secondary fw-normal text-start text-primary">주차여부</h5>
                                <p><i class="fa fa-car text-primary me-2"></i><%=post.get("주차여부") %></p>
                            </div>
                        </div>
                    </div>
					<div style="display:flex; justify-content:center;">
	                    <div class="col-md-9">
	                     
	                        <div class="wow fadeInUp" data-wow-delay="0.2s">
	                        	<!-- 입력폼 시작 -->
	                                
	                                <!-- Testimonial Start -->
							        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
							            <div class="container">
							                <div class="owl-carousel testimonial-carousel">
							                    <div class="testimonial-item bg-transparent border rounded p-4">
							                        <div class="d-flex align-items-center">
							                            <img class="img-fluid flex-shrink-0" src="../../resources/template/img/testimonial-1.jpg" style="width: 300px; height: 200px;">
						                            </div>
							                    </div>
							                    <div class="testimonial-item bg-transparent border rounded p-4">
							                        <div class="d-flex align-items-center">
							                            <img class="img-fluid flex-shrink-0" src="../../resources/template/img/testimonial-1.jpg" style="width: 300px; height: 200px;">
						                            </div>
							                    </div>
							                    <div class="testimonial-item bg-transparent border rounded p-4">
							                        <div class="d-flex align-items-center">
							                            <img class="img-fluid flex-shrink-0" src="../../resources/template/img/testimonial-1.jpg" style="width: 300px; height: 200px;">
						                            </div>
							                    </div>
							                    <div class="testimonial-item bg-transparent border rounded p-4">
							                        <div class="d-flex align-items-center">
							                            <img class="img-fluid flex-shrink-0" src="../../resources/template/img/testimonial-1.jpg" style="width: 300px; height: 200px;">
						                            </div>
							                    </div>
							                    <div class="testimonial-item bg-transparent border rounded p-4">
							                        <div class="d-flex align-items-center">
							                            <img class="img-fluid flex-shrink-0" src="../../resources/template/img/testimonial-1.jpg" style="width: 300px; height: 200px;">
						                            </div>
							                    </div>
							                </div>
							            </div>
							        </div>
							    	<!-- Testimonial End -->
	                            <form name="buddy_edit_form" action="/board/buddy/editEnd" method="post">
	                                <div class="row g-3">
	                                	<div class="col-12">
	                                        <div class="form-floating">
	                                            <input type="hidden" id="foody_no" name="foody_no" value="<%=post.get("원본글번호")%>">
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-floating">
	                                            <input type="hidden" id="buddy_no" name="buddy_no" value="<%=post.get("글번호")%>">
	                                        </div>
	                                    </div>
	                                	<div class="col-12">
	                                        <div class="form-floating">
	                                            <input type="text" class="form-control" id="title" name="buddy_title" 
	                                            placeholder="Subject" value="<%=post.get("글제목") %>">
	                                            <label for="subject">제목</label>
	                                        </div>
	                                    </div>
	                                    <div class="col-6">
						    				<div class="form-floating pt-5">
						        				<div id="map" class="form-control" style="height:380px;"></div>
						        				<label for="subject">지도</label>
						    				</div>
						   				</div>
	                                    <div class="col-6">
										<div>
											<%@page import="com.foodybuddy.user.vo.User, java.util.*" %>
											<% User u = (User)session.getAttribute("user"); %>
	                                        <div class="form-floating pt-5">
	                                            <input type="text" class="form-control" id="user_name" name="user_name"
	                                            disabled="disabled" style="background: white;" value="<%=u.getUser_name()%>">
	                                            <label for="user_name">작성자</label>
	                                        </div>
	                                    </div>
	                                    <div>
	                                        <div class="form-floating pt-5">
	                                            <input type="text" class="form-control" id="party_name" name="party_name"
	                                             value="<%=post.get("모임이름") %>">
	                                            <label for="party_name">모임이름</label>
	                                        </div>
	                                    </div>
	                                    <div>
	                                        <div class="form-floating pt-5">
	                                            <input type="datetime-local" class="form-control" id="meet_date" name="meet_date"
	                                            onblur="dateCheck(this);" value="<%=post.get("모임날짜") %>">
	                                            <label for="meet_date">모임날짜</label>
	                                        </div>
	                                    </div>
	                                    <div>
	                                        <div class="form-floating pt-5">
	                                            <input type="number" class="form-control" id="party_number" name="party_number"
	                                            min="2" max="10" onblur="numberCheck(this);" value="<%=post.get("모임인원") %>">
	                                            <label for="party_number">모임인원(작성자 포함 최소 2인 ~ 최대 10인까지 지정 가능)</label>
	                                        </div>
	                                    </div>
	                            	</div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" id="buddy_main" name="buddy_main" style="height: 500px;"><%=post.get("글내용")%></textarea>
                                            <label for="message">모집내용</label>
                                        </div>
                                    </div>
	                                    
	                                    <div class="col-12">
	                                        <button class="btn btn-primary w-100 py-3" type="button" onclick="editBuddyForm();">수정하기</button>
	                                    </div>
	                                </div>
	                            </form>
	                            <!-- 입력폼 종료 -->
	                        </div>
	                    </div>
					</div>
                </div>
                
	            <!-- 댓글창 시작 -->
	            
	            <!-- 댓글창 종료 -->
            </div>
        </div>  
        <!-- Contact End -->


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
    
    <!-- 지도 API 스크립트 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae96fe5b21048be0c855431d0416eea1"></script>
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표. 지도를 생성하는데 반드시 필요
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// center 에 할당할 값은 LatLng 클래스를 사용하여 생성합니다. 
		// 흔히 위경도 좌표라고 부르는 WGS84 좌표계의 좌표값을 넣어서 만드는데요, 
		// 생성인자는 위도(latitude), 경도(longitude) 순으로 넣어주세요.
	</script>
	
	<script type="text/javascript">
	
		/* 모임날짜 체크 */
		function dateCheck(userDate){
			let today = new Date();
			let meetDate = new Date(userDate.value);
				console.log(meetDate);
			if(today >= meetDate){
				alert("모임날짜는 현재보다 과거일 수 없습니다.")
			}
		}
	
		/* 모임인원 체크 */
		function numberCheck(party_number){
			let number = party_number.value;
			if(2>number||number>10){
				alert("모임인원은 최소 2인에서 최대 10인까지 지정할 수 있습니다.")
				party_number.value="2";
			}
		}
		
		/* 제출 전 필수사항 체크 */
		function editBuddyForm() {
			let form = document.buddy_edit_form;	
			if(!form.buddy_title.value){
				alert("제목을 입력하세요.");
				form.buddy_title.focus();
			} else if(form.buddy_title.value.length>20){
				alert("제목은 최대 20글자 이하로 작성해주세요.")
			} else if(!form.party_name.value){
				alert("모임이름을 입력하세요.");
				form.party_name.focus();
			} else if(!form.meet_date.value){
				alert("모임날짜를 입력하세요.");
				form.meet_date.focus();
				console.log(form.meet_date.value);
			} else if(!form.party_number.value){
				alert("모임인원을 입력하세요.");
				form.party_number.focus();
			} else if(!form.buddy_main.value){
				alert("내용을 입력하세요.");
				form.buddy_main.focus();
			} else if(form.buddy_main.value.length <= 20){
				alert("본문의 내용을 최소 20자 이상 작성해주세요.");
			} else {
				console.log(form.meet_date.value);
				form.submit();
			}
		}
	</script>
	

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