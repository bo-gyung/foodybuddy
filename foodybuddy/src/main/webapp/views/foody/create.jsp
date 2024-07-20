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
				<form action='/board/createEnd' name="create_foody_form" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return createFoodyForm();">		
					<!-- 필수 입력항목 -->
					
					<label>제목작성</label>
					<input type="text" name="foody_title">
					
					<input type="submit" value="게시" onclick="createFoodyForm();"><br>
					
					<label>가게이름</label>
					<input type="text" name="foody_name"><br>
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
					<input type="text" name="foody_main" placeholder="내용을 입력하세요."><br>
					<label>주소검색</label>
					<input type="text" name="foody_address"><br>
					
					<!-- 사진첨부 -->
					<label>대표 이미지</label>
					<input type="file" name="foody_picture1" accept=".png,.jpg,.jpeg"><br>
					<label>추가 사진</label>
					<input type="file" name="foody_picture2" accept=".png,.jpg,.jpeg"><br>
					<label>추가 사진</label>
					<input type="file" name="foody_picture3" accept=".png,.jpg,.jpeg"><br>
					<label>추가 사진</label>
					<input type="file" name="foody_picture4" accept=".png,.jpg,.jpeg"><br>
					<label>추가 사진</label>
					<input type="file" name="foody_picture5" accept=".png,.jpg,.jpeg"><br>
					
					
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
	<script src="js/theme.js"></script>
</body>
</html>
