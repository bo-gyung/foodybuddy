<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA작성</title>
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
<%@ include file="../../include/navbar.jsp" %>
	<!-- Hero Start -->
	<div class="container-xxl py-5 bg-dark hero-header mb-5">
		<div class="container text-center my-5 pt-5 pb-4">
			<h1 class="display-3 text-white mb-5 pb-5 animated slideInDown">
				<a href="/qna/list" class="text-white">QnA 글 작성</a>
			</h1>
		</div>
	</div>
	<section class="container-xxl py-5 bg-light">
    <div class="container">
        <div class="bg-white p-4 rounded shadow">
            <h2 class="text-primary mb-4">QnA 작성</h2>

            <form action="/qna/createEnd" name="qnacreate_form" method="post">
                <div class="mb-3">
                    <label for="qna_title" class="form-label fw-medium">제목</label>
                    <input type="text" id="qna_title" name="qna_title" class="form-control"border-primary w-100 py-3 ps-4 pe-5" style="max-width: 80%; margin-left : 0%"
                        placeholder="제목을 입력하세요." maxlength="50">
                </div>
                <div class="mb-3">
                    <label for="qna_content" class="form-label fw-medium">작성란</label>
                    <textarea id="qna_content" name="qna_content" class="form-control"maxlength="500" placeholder="내용을 입력하세요." rows="10" style="resize: none;"></textarea>
                </div>
                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-primary fw-semi-bold">보내기</button>
                    <button type="reset" class="btn btn-secondary fw-semi-bold">초기화</button>
                </div>
            </form>
        </div>
    </div>
</section>
	</body>
 	<!-- 푸터 외부링크 -->
	<%@ include file="../../include/footer.jsp" %>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
   
		
	<script>
		function qnacreateForm() {
			let form = document.qnacreate_form;
			if(!form.qna_title.value){
				alert("제목을 입력하세요");
				form.qna_title.focus();
			}else if(!form.qna_content.value){
				alert("내용을 입력하세요");
				form.qna_content.focus();
			} else {
				document.qnacreate_form.submit();
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
</html>