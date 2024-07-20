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
	<div>
		<h3>QnA수정</h3>
		<div>
			<section>
				<%
				// Java 코드로 데이터 가져오기 이전에 상세내용 값
				Map<String, Object> resultM = (Map<String, Object>) request.getAttribute("detail");
				//만약 resultM의 값이 null이아니라면
				System.out.println("JSP위치 : "  + resultM); //얘가비었어 얘가비었으면 안나오는거지 당연히
				if (resultM != null) {
					String qnaNo = resultM.get("qnaNo").toString();
					String title = (String) resultM.get("title");
					String content = (String) resultM.get("content");
				%>
				<form action="<%= request.getContextPath() %>/qna/update"
					method="post" name="qnaupdate_form">
					<input type="hidden" name="qna_no" value="<%= qnaNo %>">
					
					<label>제목</label> 
						<input type= "text" name = "qna_title" maxlength="50" value="<%=resultM.get("title")%>" readonly> <br> 
					<label>작성란</label>
						<textarea name = "qna_content" maxlength="500" cols="40" rows="15" style="resize: none;"><%=resultM.get("content")%></textarea>
					<input type = "button" onclick = "updateBtn();" value = "수정완료" >
				</form>
			<%
			} else {
			out.println("<p>데이터를 불러오는 데 실패했습니다.</p>");
			}
			%>
			</section>

		</div>
	</div>
</body>
<script>
	// 수정완료 눌렀을때 이벤트 발생 작성시 완료
	function updateBtn(){
		let form = document.qnaupdate_form;
		if(!form.qna_title.value){
			alert("제목을 입력하세요");
			form.qna_title.focus();
		}else if(!form.qna_content.value){
			alert("내용을 입력하세요");
			form.qna_content.focus();
		}else{
			alert("수정완료");
			document.qnaupdate_form.submit();
		}
		
		
	}
	
	function content() {
		let content = document.getElementsByName('qna_content').value;
		if (content.length > 500) {
			alert('500글자 초과되었습니다.');
			/* 초과된 글자 제거 */
			document.getElementsByName('qna_content').value = content.substring(0,
					500);
		}
	}
	function answer() {
		let answer = document.getElementsByName('qna_answer').value;
		if (answer.length > 500) {
			alert("500글자 초과되었습니다");
			/* 초과된 글자 제거 */
			document.getElementsByName('qna_answer').value = answer.substring(0,
					500);

		}
	} 
</script>

</html>