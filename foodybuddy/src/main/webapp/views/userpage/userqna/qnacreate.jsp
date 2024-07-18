<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA작성</title>
</head>
<body>
	<section>
		<div>
			<div>
			<div>
				<h3>QnA작성</h3>
			</div>
			<form action ="/qna/createEnd" name = qnacreate_form method = "post">
			<label>제목</label>
				<input type = "text" name = "qna_title" placeholder = "제목을 입력하세요." maxlength = "50"><br>
				<label>작성란</label>
				<textarea onkeypress = "content();" name = "qna_content"maxlength = "500" placeholder = "내용을 입력하세요." cols = "70" rows = "30"></textarea>
				<button onclick = "qnacreateForm();">보내기</button>
				<input type = "reset" value ="초기화">
			</form>
			</div>
		</div>
	</section>	
	<script>
		function qnacreateForm() {
			let form = document.qnacreate_form;
			if(!form.qna_title.value){
				alert("제목을 입력하세요");
				form.qna_title.focus();
			}else if(!form.qna_content.value){
				alert("내용을 입력하세요");
				form.qna_content.focus();
			}
			let text = document.getElementsByName('qna_content')[0].value;
		    if (text.length > 500) {
		        alert("500자를 초과하였습니다.");
		    } else {
		        document.qnacreate_form.submit();
		    }
			
		}
		
	</script>
</body>
</html>