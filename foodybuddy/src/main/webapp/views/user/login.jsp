<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Login</title>
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
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Login</h1>
                </div>
            </div>
        </div>
        <!-- Hero End -->

        <!-- login Start -->
        <div class="container-xxl py-5 px-0 wow fadeInUp" data-wow-delay="0.1s">
            <div class="row g-0" >
                <div class="col-md-6 bg-dark d-flex align-items-center" style="margin: auto;">
                    <div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">FOODYBUDDY</h5>
                        <h3 class="text-white mb-4">아이디와 비밀번호를 입력하세요.</h3>
                        <!-- 로그인 폼 -->
                        <form action='/user/loginEnd' name="login_form" method="post">
                            <div class="row g-3" style="margin-left:20%">
                                <div class="col-md-9">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="user_id" name ="user_id" placeholder="Your ID">
                                        <label for="name">ID</label>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="Your Password" onkeyup="enterkey()">
                                        <label for="name">Password</label>
                                    </div>
                                </div>
                                <div class="col-9">
                                    <button class="btn btn-primary w-100 py-3" type="button" onclick="loginForm();">Login</button>
                                </div>
                            </div>
                        </form>
                        <!-- 로그인 폼 -->
                    </div>
                </div>
            </div>
        </div>
        <!-- login End -->
        

 	<!-- 푸터 외부링크 -->
	<%@ include file="../include/footer.jsp" %>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
	<script type="text/javascript">
		function loginForm() {
			let form = document.login_form;
			if (form.user_id.value == '') {
				alert('아이디를 입력하세요.');
				form.user_id.focus();	
			} else if (form.user_pw.value == '') {
				alert('비밀번호를 입력하세요.');
				form.user_pw.focus();
			} else {
				form.submit();
			}
		}
		
		function enterkey(){
			if (window.event.keyCode == 13) {
		    	// 엔터키가 눌렸을 때
		    	loginForm();
		    }
		}
	</script>
    
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