<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="css/theme.css">
<title>맛집글 작성</title>
</head>
<body>

	<section>
		<div id="section_wrap">
			<div class="word">
				<h3>맛집 등록</h3>
			</div><br>
			<div class="register_book_form">
				<form action='/board/createEnd' name="create_foody_form" method="post" enctype="multipart/form-data" accept-charset="UTF-8">	
					<!-- 필수 입력항목 -->
					
					<label>제목작성</label>
					<input type="text" name="foody_title">
					<input type="submit" value="게시" onclick="createFoodyForm();"><br>
					<label>가게이름</label>
					<input type="text" name="foody_store"><br>
					<label>맛 평점</label>
					<input type="number" name="foody_taste" min="1" max="5"><br>
					<label>청결 평점</label>
					<input type="number" name="foody_clean" min="1" max="5"><br>
					
					<!-- 선택사항 -->
					<label>주차가능여부</label>
					<label>가능</label>
					<input type="radio" name="foody_parking" value="가능">
					<label>불가능</label>
					<input type="radio" name="foody_parking" value="불가능"><br>
					<label>배달가능여부</label>
					<label>가능</label>
					<input type="radio" name="foody_delivery" value="가능">
					<label>불가능</label>
					<input type="radio" name="foody_delivery" value="불가능"><br>
					
					
					<!-- 상세설명 -->
					<label>맛집 상세설명</label>
					<input type="text" name="foody_content" placeholder="내용을 입력하세요."><br>
					<label>주소검색</label>
					<input type="text" name="foody_address"><br>
					<label>사진첨부</label>
					<input type="file" name="foody_picture" accept=".png,.jpg,.jpeg"><br>
					
					
				</form>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		function createFoodyForm() {
			let form = document.create_foody_form;	
			
			if(!form.foody_title.value){
				alert("제목을 입력하세요.");
				form.foody_title.focus();
			} else if(!form.foody_store.value){
				alert("가게이름을 입력하세요.");
				form.foody_store.focus();
			}else if(!form.foody_taste.value){
				alert("맛 평점을 입력해주세요.")
				form.foody_taste.focus();
			}else if(!form.foody_clean.value){
				alert("청결 평점을 입력해주세요.")
				form.foody_clean.focus();	
			}else if(!form.foody_content.value){
				alert("상세 내용을 입력해주세요");
				form.foody_content.focus();
			}else if(!form.foody_address.value){
				alert("주소를 입력해주세요");
			} else if (!form.foody_picture.value) {
				alert('이미지 파일을 선택하세요.');
				form.foody_picture.focus();
			}else if(form.foody_picture.value){
				const val = form.foody_picture.value;
				const idx = val.lastIndexOf('.');
				const type = val.substring(idx+1,val.length);
				if(type == 'jpg' || type == 'jpeg' || type == 'png'){
					form.submit();
				}else{
					alert("이미지파일만 선택할 수 있습니다.");
					form.foody_picture.value='';
				}
			} 
		}
	</script>
	<script src="js/theme.js"></script>
</body>
</html>