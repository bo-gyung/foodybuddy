<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.foodybuddy.userpage.vo.QnA, java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정</title>
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
				<a href="#" class="text-white">QnA 글 수정</a>
			</h1>
		</div>
	</div>
	<div class="container-xxl py-5 bg-light">
		
	</div>
	<%@page import="com.foodybuddy.userpage.vo.QnA, java.util.*"%>
	<%
	Map<String, Object> resultM = (Map<String, Object>) request.getAttribute("detail");
	%>

	<div class="container-xxl py-5 bg-light">
		<div class="container bg-white p-4 rounded shadow">
			<h2 class="text-primary mb-4">QnA 수정</h2>

			<section>
				<%
				// Java 코드로 데이터 가져오기 이전에 상세내용 값
				if (resultM != null) {
					String qnaNo = resultM.get("qnaNo").toString();
					String title = (String) resultM.get("title");
					String content = (String) resultM.get("content");
				%>
				<form action="<%=request.getContextPath()%>/qna/update"
					method="post" name="qnaupdate_form">
					<input type="hidden" name="qna_no" value="<%=qnaNo%>">

					<div class="mb-4">
						<label for="qna_title_update" class="form-label fw-medium">제목</label>
						<input type="text" id="qna_title_update" name="qna_title"
							class="form-control" maxlength="50" value="<%=title%>"
							style="max-width: 80%; margin-left: auto; margin-right: auto;">
					</div>

					<div class="mb-4">
						<label for="qna_content_update" class="form-label fw-medium">작성란</label>
						<textarea id="qna_content_update" name="qna_content"
							class="form-control" maxlength="500" rows="10"
							style="resize: none;">
                        <%=content%>
                    </textarea>
					</div>

					<div class="d-flex justify-content-between">
						<button type="submit" class="btn btn-primary fw-semi-bold" onclick = "updateBtn();">수정 완료</button>
					</div>
				</form>
				<%
				} else {
				out.println("<p class='text-danger'>데이터를 불러오는 데 실패했습니다.</p>");
				}
				%>
			</section>
		</div>
	</div>
	<script>
		// 수정완료 눌렀을때 이벤트 발생 작성시 완료
		function updateBtn() {
			let form = document.qnaupdate_form;
			if (!form.qna_title.value) {
				alert("제목을 입력하세요");
				form.qna_title.focus();
			} else if (!form.qna_content.value) {
				alert("내용을 입력하세요");
				form.qna_content.focus();
			} else {
				alert("수정완료");
				document.qnaupdate_form.submit();
			}

		}

		function content() {
			let content = document.getElementsByName('qna_content').value;
			if (content.length > 500) {
				alert('500글자 초과되었습니다.');
				/* 초과된 글자 제거 */
				document.getElementsByName('qna_content').value = content
						.substring(0, 500);
			}
		}
		function answer() {
			let answer = document.getElementsByName('qna_answer').value;
			if (answer.length > 500) {
				alert("500글자 초과되었습니다");
				/* 초과된 글자 제거 */
				document.getElementsByName('qna_answer').value = answer
						.substring(0, 500);

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