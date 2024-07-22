<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOODY</title>

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
                    <h1 class="mb-5">맛집 글 작성</h1>
                </div>
                <div class="row g-4">
					<div style="display:flex; justify-content:center;">
	                    <div class="col-md-9">
	                     
	                        <div class="wow fadeInUp" data-wow-delay="0.2s">
	                        	<!-- 입력폼 시작 -->
	                            <form action='/board/createEnd' name="create_foody_form" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return createFoodyForm();">
	                                <div class="row g-3">
	                                	
	                                	<div class="col-12">
	                                        <div class="form-floating">
	                                            <input type="text" class="form-control" name="foody_title">
	                                            <label for="subject">제목(최대 20글자)</label>
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
	                                        <div class="form-floating pt-5">
	                                            <input type="text" class="form-control" name="foody_name">
	                                            <label>가게이름</label>
	                                        </div>
	                                    </div>
	                                    <div>
	                                        <div class="form-floating pt-5">
	                                            <input type="number" class="form-control" name="foody_taste" min="1" max="5">
	                                            <label>맛 평점 (5점 만점)</label>
	                                        </div>
	                                    </div>
	                                    <div>
	                                        <div class="form-floating pt-5">
	                                            <input type="number" class="form-control" name="foody_clean" min="1" max="5">
	                                            <label>청결 평점 (5점 만점)</label>
	                                        </div>
	                                    </div>
	                                    <div style="display: flex; justify-content: space-evenly;">
	                                        <div class="pt-5">
	                                            <label>주차 가능 여부</label><br>
	                                            <label>가능</label>
	                                            <input type="radio" name="foody_pariking" value="가능">
	                                            <label>불가능</label>
	                                            <input type="radio" name="foody_pariking" value="불가능">
	                                        </div>
	                                        <div class="pt-5">
	                                            <label>배달 가능 여부</label><br>
	                                            <label>가능</label>
	                                            <input type="radio" name="foody_delivery" value="가능">
	                                            <label>불가능</label>
	                                            <input type="radio" name="foody_delivery" value="불가능">
	                                        </div>
	                                    </div>
	                            	</div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" name="foody_main" placeholder="내용을 입력해주세요" style="height: 500px; resize: none;"></textarea>
                                            <label for="message">상세설명</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" name="foody_address" placeholder="주소을 입력해주세요" ></input>
                                            <label>주소 입력</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
											<div>
                                    		<label>대표이미지</label><br>
                                            <input type="file" name="foody_picture1" accept=".png,.jpg,.jpeg"><br>
											<label>추가 사진</label><br>
											<input type="file" name="foody_picture2" accept=".png,.jpg,.jpeg"><br>
											<input type="file" name="foody_picture3" accept=".png,.jpg,.jpeg"><br>
											<input type="file" name="foody_picture4" accept=".png,.jpg,.jpeg"><br>
											<input type="file" name="foody_picture5" accept=".png,.jpg,.jpeg">
                                        </div>
                                    </div>
	                                    
	                                    <div class="col-12">
	                                        <button class="btn btn-primary w-100 py-3" type="submit" onclick="createFoodyForm();">게시</button>
	                                    </div>
	                                </div>
	                            </form>
	                        </div>
	                    </div>
					</div>
                </div>
                
            </div>
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
    
	<script type="text/javascript">
		function createFoodyForm() {
			let form = document.create_foody_form;	
			
			if(!form.foody_title.value){
				alert("제목을 입력하세요.");
				form.foody_title.focus();
				
			} else if(!form.foody_name.value){
				alert("가게이름을 입력하세요.");
				form.foody_name.focus();
				return false;
			}else if(!form.foody_taste.value){
				alert("맛 평점을 입력해주세요.")
				form.foody_taste.focus();
				return false;
			}else if(form.foody_taste.value > 5 && form.foody_taste.value < 0){
				alert("맛 평점은 0 에서 5 사이 입력만 가능합니다.")
				form.foody_taste.focus();
				return false;
			}else if(!form.foody_clean.value){
				alert("청결 평점을 입력해주세요.")
				form.foody_clean.focus();
				return false;
			}else if(form.foody_clean.value > 5 && form.foody_clean.value < 0){
				alert("청결 평점은 0 에서 5 사이 입력만 가능합니다.")
				form.foody_clean.focus();
				return false;
			}else if(!form.foody_main.value){
				alert("상세 내용을 입력해주세요");
				form.foody_main.focus();
				return false;
			}else if(!form.foody_address.value){
				alert("주소를 입력해주세요");
				form.foody_address.focus();
				return false;
			}else if(!form.foody_picture1.value){
				alert("대표 사진을 입력해주세요");
				form.foody_address.focus();
				return false;
			}else {
				const validExtensions = ['jpg', 'jpeg', 'png'];
				for (let i = 1; i <= 5; i++) {
					const fileInput = form['foody_picture' + i];
					const file = fileInput.files[0];
					if (file) {
						const fileExtension = file.name.split('.').pop().toLowerCase();
						if (!validExtensions.includes(fileExtension)) {
							alert("이미지파일만 선택할 수 있습니다.");
							fileInput.value = '';
							return false;
						}
					}
				}
			}
			form.submit();
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