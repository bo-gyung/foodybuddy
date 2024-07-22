<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<%@ page import="com.foodybuddy.foody.vo.Foody" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.foodybuddy.common.sql.JDBCTemplate" %>
<%@ page import="com.foodybuddy.user.vo.User" %>
<%@page import="com.foodybuddy.foodycomment.vo.Comment, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOODY</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1330c1e595053f9256580cf7b68a8cf4&libraries=services"></script>

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

	<%
          int foody_no = Integer.parseInt(request.getParameter("foody_no"));

        List<Foody> foodyList = (List<Foody>) request.getAttribute("foodyList");
        Foody foody = foodyList.get(0); 

        User loginUser = (User)session.getAttribute("user");
        Integer userGrade = (loginUser != null) ? loginUser.getGrade_no() : null;
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String formattedRegDate = foody.getReg_date().format(formatter);
    %>

	<!-- Navbar Link -->
	<%@ include file="../include/navbar.jsp" %>
	
        <!-- Hero Start -->
            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">FOODY</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
			                <li class="breadcrumb-item"><a href="/">Home</a></li>
			                <li class="breadcrumb-item"><a href="/board/foody" style="color:white;">FOODY</a></li>
			                <li class="breadcrumb-item"><a href="/board/buddy">BUDDY</a></li>
			            </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">FOODY</h5>
                    <h1 class="mb-5">맛집 글</h1>
                </div>
                <div class="row g-4">
					<div style="display:flex; justify-content:center;">
	                    <div class="col-md-9">
	                     
	                        <div class="wow fadeInUp" data-wow-delay="0.2s">
	                        	<!-- 입력폼 시작 -->
	                        	
	                                	<% if(loginUser != null && loginUser.getUser_no() == foody.getUser_no()) { %>
                                        <div style="display: flex; justify-content: space-evenly; text-align : center;">
                                            <div class="col-5"><button class="btn btn-primary w-100 py-3" onclick="location.href='update?foody_no=<%= foody.getFoody_no() %>'">수정</button></div>
                                            <div class="col-5"><button class="btn btn-primary w-100 py-3" onclick="checkDel(<%= foody.getFoody_no() %>)">삭제</button></div>
                                        </div>
                                        <% } %>
                                        
                                        <div style="display: flex; justify-content: space-evenly; text-align : center;">
                                        <% if(userGrade != null && userGrade >= 1) { %>
                                            
                                            <div class="col-5"><button class="btn btn-primary w-100 py-3" onclick="likeFoody(<%= foody_no %>, <%= loginUser.getUser_no() %>)">좋아요</button></div>
                                        <% }else { %>
                                            <div class="col-5"><button class="btn btn-primary w-100 py-3" onclick="alert('회원만 가능한 기능입니다.')">좋아요</button></div>        
                                        <% } %>
                                        
                                        <% if(userGrade != null && userGrade >= 2) { %>
                                            <div class="col-5"><button class="btn btn-primary w-100 py-3" onclick="buddyCreate(<%= foody.getFoody_no() %>, <%= loginUser.getUser_no() %>)">모이기</button></div>
                                        <% } else { %>
                                            <div class="col-5"><button class="btn btn-primary w-100 py-3" onclick="alert('정회원 이상만 모이기 버튼을 사용할 수 있습니다.')">모이기</button></div>
                                        <% } %>
							    		</div>
							    		
	                            <form action='/board/createEnd' name="create_foody_form" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return createFoodyForm();">
	                                <div class="row g-3">
	                                    
							            
							            
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
							            
							            
							            <div class="col-6">
					        				<div id="map" class="form-control" style="height:380px;"></div>
						   				</div>
						   				
						   				 
	                                    <div class="col-6">
	                                    <div style="display: flex; justify-content: space-evenly; text-align : center;">
	                                        <div>
	                                            <h4>제목 </h4><br>
	                                            <label><%= foody.getFoody_title() %></label>
	                                        </div>
	                                        <div>
	                                        	<h4>가게 이름</h4><br>
	                                            <label><%= foody.getFoody_name() %></label>
	                                        </div>
	                                    </div><br><br>
	                                    <div style="display: flex; justify-content: space-evenly; text-align : center;">
	                                        <div>
	                                            <h4>맛</h4><br>
	                                            <label><%= foody.getFoody_taste() %> / 5 점</label>
	                                        </div>
	                                        <div>
	                                        	<h4>청결</h4><br>
	                                            <label><%= foody.getFoody_clean() %> / 5 점</label>
	                                        </div>
	                                    </div><br><br>
	                                    <div style="display: flex; justify-content: space-evenly; text-align : center;">
	                                        <div>
	                                            <h4>주차 가능 여부</h4><br>
	                                            <label><%= foody.getFoody_parking() %></label>
	                                            
	                                        </div>
	                                        <div>
	                                            <h4>배달 가능 여부</h4><br>
	                                            <label><%= foody.getFoody_delivery() %></label>
	                                        </div>
	                                    </div>
	                            	</div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" name="foody_main" style="height : 500px; resize: none;" readonly></textarea>
                                            <label><%= foody.getFoody_main() %></label>
                                        </div>
                                    </div>
                                    
	                                    
	                                    <div class="col-12">
	                                        <button class="btn btn-primary w-100 py-3" onclick="location.href='/board/foody'">메뉴로 돌아가기</button>
	                                    </div>
	                                </div>
	                            </form>
	                        </div>
	                    </div>
					</div>
            <form action="/comment" method="post">
            	<div class="row g-3">
	            	<div class="col-12">
    	                 <div class="form-floating">
	                		<input type="hidden" name="foody_no" value="<%= foody_no %>">
                           	<input type="text" class="form-control" name="comment_text" required></input>
                              <label>댓글 입력</label>
	    		            <input class="btn btn-primary w-100 py-3" type="submit" value="작성">
                         </div>
                    </div>
            	</div>
            </form>
                </div>
                
            </div>
        </div> 
        
            <!-- 댓글 리스트 -->
            <div class="comment_list">
                <%
                    List<Comment> commentList = (List<Comment>) request.getAttribute("commentList");
                    if (commentList != null) {
                        for (Comment comment : commentList) {
                            String CommentDate = comment.getReg_date().format(formatter);
                %>
		            <div class="col-lg-6 mx-auto">
		                <div class="d-flex align-items-center">
		                    <div class="w-100 d-flex flex-column text-start ps-4">
		                        <h5 class="d-flex justify-content-between border-bottom pb-2">
		                            <span><%= comment.getUser_name() %></span>
		                        </h5>
		                        <small class="fst-italic">
		                        <span><%= comment.getComment_text() %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= CommentDate %>
		                        </small>
		                    </div>
		                </div>
		            </div>
		            <br><br>
                            
                <%
                        }
                    }
                %>
            </div>

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
    
	<script>
		    function likeFoody(foody_no, user_no) {
		        var xhr = new XMLHttpRequest();
		        xhr.open("POST", "/foody/like", true);
		        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		        xhr.onreadystatechange = function() {
		            if (xhr.readyState == 4 && xhr.status == 200) {
		                alert(xhr.responseText);
		                location.reload();
		            }
		        };
		        xhr.send("foody_no=" + foody_no + "&user_no=" + user_no);
		    }
		    function checkDel(foody_no){
		    	if(confirm("정말로 삭제하시겠습니까 ?")){
		    		location.href = "/foody/delete?foody_no=" + foody_no;
		    	}
		    }
		    
		    
		    function buddyCreate(foody_no, user_no) {
		        location.href = "/buddy/create?foody_no=" + foody_no;
		    }
		    
    </script>
    
    
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
					
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch('<%= foody.getFoody_address() %>', function(result, status) {
					
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
					
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
					
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%= foody.getFoody_address() %></div>'
					        });
					        infowindow.open(map, marker);
					
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});    
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