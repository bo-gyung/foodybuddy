<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>FoodyBuddy-함께하는 맛집방문</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- 상단아이콘 : 우리는 아직 없음! -->
    <link href="img/favicon.ico" rel="icon">

    <!-- 구글 웹 폰트 : 일부 바꿔야함!(한글폰트 문제) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- 아이콘 폰트 스타일 시트 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- 라이브러리 스타일 시트 -->
    <link href="../resources/template/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../resources/template/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../resources/template/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet : 탬플릿에 맞게 커스텀된 부트스트랩 스타일 시트인듯! -->
    <link href="../resources/template/css/bootstrap.min.css" rel="stylesheet">

    <!-- 탬플릿 스타일 시트 -->
    <link href="../resources/template/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- 내비바 외부링크 -->
	<%@ include file="views/include/navbar.jsp" %>
	
		<!-- Hero Start -->
	    <div class="container-xxl py-5 bg-dark hero-header mb-5">
	        <div class="container my-5 py-5">
	            <div class="row align-items-center g-5">
	                <div class="col-lg-6 text-center text-lg-start">
	                    <h1 class="display-3 text-white animated slideInLeft">Eat<br>Together!</h1>
	                    <p class="text-white animated slideInLeft mb-4 pb-2">함께 가고싶은 맛집을 찾아보세요!</p>
	                        <!-- 검색창 설정 조정필요 -->
	                        <p class="mt-5">
		                        <div class="position-relative mx-auto" style="max-width: 400px;">
		                            <form id="searchForm" action="http://localhost:8089/board/foody" method="GET">
		                                <input type="hidden" name="searchOption" value="2">
		                                <input id="searchInput" name="searchbar" class="form-control border-primary w-100 py-3 ps-4 pe-5" type="text" placeholder="맛집을 검색하세요">
        								<button type="submit" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">검색</button>
		                            </form>
		                        </div>
	                        </p>
	                </div>
	                <div class="col-lg-6 text-center text-lg-end overflow-hidden">
	                    <img class="img-fluid" src="../resources/template/img/hero.png" alt="">
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- Hero End -->

    	<!-- Service Start -->
		<!-- 바로가기 정렬...! -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item rounded pt-3">
                            <a href="/views/notice/noticeList.jsp"><div class="p-4">
                                <i class="fa fa-3x fa-user-tie text-primary mb-4"></i>
                                <h5>NOTICE</h5>
                                <p>사이트 이용 규칙 및 주요 알림을 확인하세요.</p>
                            </div></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="service-item rounded pt-3">
                            <a href="/board/foody"><div class="p-4">
                                <i class="fa fa-3x fa-utensils text-primary mb-4"></i>
                                <h5>FOODY</h5>
                                <p>나만 알고있는 맛집을 모두에게 공유하세요.</p>
                            </div></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="service-item rounded pt-3">
                            <a href="/board/buddy"><div class="p-4">
                                <i class="fa fa-3x fa-cart-plus text-primary mb-4"></i>
                                <h5>BUDDY</h5>
                                <p>맛집에 함께 방문할 일행을 찾으세요.</p>
                            </div></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- Service End -->
		
	<!-- 푸터 외부링크 -->
	<%@ include file="views/include/footer.jsp" %>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/template/lib/wow/wow.min.js"></script>
    <script src="../resources/template/lib/easing/easing.min.js"></script>
    <script src="../resources/template/lib/waypoints/waypoints.min.js"></script>
    <script src="../resources/template/lib/counterup/counterup.min.js"></script>
    <script src="../resources/template/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="../resources/template/lib/tempusdominus/js/moment.min.js"></script>
    <script src="../resources/template/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="../resources/template/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="../resources/template/js/main.js"></script>
</body>

</html>