<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA상세보기</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../../resources/template/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="../../resources/template/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="../../resources/template/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="../../resources/template/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../../resources/template/css/style.css" rel="stylesheet">

</head>
<body>
	<!-- Hero Start -->
	<div class="container-xxl py-5 bg-dark hero-header mb-5">
		<div class="container text-center my-5 pt-5 pb-4">
			<h1 class="display-3 text-white mb-5 pb-5 animated slideInDown">
				<a href="/qna/list" class="text-white">QnA 상세확인</a>
			</h1>
		</div>
	</div>

	<%@page import="com.foodybuddy.userpage.vo.QnA, java.util.*"%>
	<%
	Map<String, Object> resultM = (Map<String, Object>) request.getAttribute("detail");
	%>

	<div class="container-xxl py-5 bg-light">
		<div class="container bg-light p-4 rounded shadow">
			<h2 class="text-primary mb-4">QnA 상세 보기</h2>

			<!-- 제목 및 내용 -->
			<div class="mb-4">
				<label for="qna_title" class="form-label fw-medium">제목</label> <input
					type="text" id="qna_title" class="form-control" maxlength="50"  style= " max-width: 80%; margin-left : 12%"
					value="<%=resultM.get("title")%>" readonly>
			</div>

			<div class="mb-4">
				<label for="qna_content" class="form-label fw-medium">작성란</label>
				<textarea id="qna_content" class="form-control" maxlength="500"
					cols="40" rows="15" style="resize: none;" readonly>
                <%=resultM.get("content")%>
            </textarea>
			</div>

			<!-- 수정 및 삭제 버튼 -->
			<div class="d-flex justify-content-between mb-4">
				<a href="/qna/update?qna_no=<%=resultM.get("qnaNo")%>"
					class="btn btn-warning fw-semi-bold">수정</a>
				<button type="button" class="btn btn-danger fw-semi-bold"
					onclick="deleteQnA('<%=resultM.get("qnaNo")%>');">삭제</button>
			</div>

			<hr class="my-4">

			<!-- 관리자 답변 -->
			<div class="mb-4">
				<label for="qna_answer" class="form-label fw-medium">관리자 답변</label>
				<form action="/qna/createEnd" name="qnacreate_form" method="post">
					<%
					String answerContent = "";
					// 값이 null이 아니라면
					if (resultM != null && resultM.get("ansContent") != null) {
						answerContent = (String) resultM.get("ansContent");
					%>
					<textarea id="qna_answer" class="form-control" maxlength="500"
						cols="40" rows="15" style="resize: none;" readonly>
                    <%=answerContent%>
                </textarea>
					<%
					}
					%>
				</form>
			</div>
		</div>
	</div>
	<!-- Footer Start -->
	<div
		class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="row g-5">
				<div class="col-lg-3 col-md-6">
					<h4
						class="section-title ff-secondary text-start text-primary fw-normal mb-4">Company</h4>
					<a class="btn btn-link" href="">About Us</a> <a
						class="btn btn-link" href="">Contact Us</a> <a
						class="btn btn-link" href="">Reservation</a> <a
						class="btn btn-link" href="">Privacy Policy</a> <a
						class="btn btn-link" href="">Terms & Condition</a>
				</div>
				<div class="col-lg-3 col-md-6">
					<h4
						class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
					<p class="mb-2">
						<i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA
					</p>
					<p class="mb-2">
						<i class="fa fa-phone-alt me-3"></i>+012 345 67890
					</p>
					<p class="mb-2">
						<i class="fa fa-envelope me-3"></i>info@example.com
					</p>
					<div class="d-flex pt-2">
						<a class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-twitter"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-facebook-f"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-youtube"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h4
						class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
					<h5 class="text-light fw-normal">Monday - Saturday</h5>
					<p>09AM - 09PM</p>
					<h5 class="text-light fw-normal">Sunday</h5>
					<p>10AM - 08PM</p>
				</div>
				<div class="col-lg-3 col-md-6">
					<h4
						class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
					<p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
					<div class="position-relative mx-auto" style="max-width: 400px;">
						<input class="form-control border-primary w-100 py-3 ps-4 pe-5"
							type="text" placeholder="Your email">
						<button type="button"
							class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Your Site Name</a>, All
						Right Reserved.

						<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML
							Codex</a><br>
						<br> Distributed By <a class="border-bottom"
							href="https://themewagon.com" target="_blank">ThemeWagon</a>
					</div>
					<div class="col-md-6 text-center text-md-end">
						<div class="footer-menu">
							<a href="">Home</a> <a href="">Cookies</a> <a href="">Help</a> <a
								href="">FQAs</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>
	</div>

	<script>
 	/* 내용 500자 초과 알림 */
 	 
 	function content(){
 		let content = document.getElementById('qna_content').value;
 		if(content.length > 500) {
 			alert('500글자 초과되었습니다.');
 			/* 초과된 글자 제거 */
 			document.getElementById('qna_content').value = content.substring(0, 500);
 		}
 	}
 	function answer(){
 		let answer = document.getElementById('qna_answer').value;
 		if(answer.length > 500){
 			alert("500글자 초과되었습니다");
 			/* 초과된 글자 제거 */
 			document.getElementById('qna_answer').value = answer.substring(0, 500);
 			
 		}
 	}
 	
 	
 	//삭제버튼
 	function deleteQnA(qnaNo) {
        console.log(qnaNo); //보내준 부분에서 값이 안들어왔다. 받은데서 확인하고, 보는데서 확인하고
        if (confirm("정말로 이 QnA를 삭제하시겠습니까?")) {
            fetch('/qna/delete', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'qna_no=' + qnaNo,
            })
            .then(response => {
                if (response.ok) {
                    // 삭제 성공 시 처리할 코드
                    alert('QnA가 성공적으로 삭제되었습니다.');
                    window.location.href = '/qna/list'; // 삭제 후 목록 페이지로 이동
                } else {
                    // 삭제 실패 시 처리할 코드
                    alert('QnA 삭제 중 오류가 발생했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('QnA 삭제 중 오류가 발생했습니다.');
            });
        }
    }
 	
 </script>
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../../resources/template/lib/wow/wow.min.js"></script>
	<script src="../../resources/template/lib/easing/easing.min.js"></script>
	<script src="../../resources/template/lib/waypoints/waypoints.min.js"></script>
	<script src="../../resources/template/lib/counterup/counterup.min.js"></script>
	<script
		src="../../resources/template/lib/owlcarousel/owl.carousel.min.js"></script>
	<script
		src="../../resources/template/lib/tempusdominus/js/moment.min.js"></script>
	<script
		src="../../resources/template/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="../../resources/template/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="../../resources/template/js/main.js"></script>


</body>
</html>