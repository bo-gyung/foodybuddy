<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.foodybuddy.foody.vo.Foody" %>
<%@ page import="com.foodybuddy.foodyPic.vo.Foody_Pic" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
    <%
        Foody foody = (Foody) request.getAttribute("foody");
    	List<Foody_Pic> picFiles = (List<Foody_Pic>) request.getAttribute("picFiles");
    %>
    <h1>게시글 수정</h1>
    <form action="/foody/updateEnd" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return createFoodyForm();">
        <input type="hidden" name="foody_no" value="<%= foody.getFoody_no() %>">
        <p>제목: <input type="text" name="foody_title" value="<%= foody.getFoody_title() %>"></p>
        <p>가게 이름: <input type="text" name="foody_name" value="<%= foody.getFoody_name() %>"></p>
        <p>맛 점수: <input type="number" name="foody_taste" value="<%= foody.getFoody_taste() %>"></p>
        <p>청결도 점수: <input type="number" name="foody_clean" value="<%= foody.getFoody_clean() %>"></p>
        <p>주차 가능 여부: <input type="text" name="foody_parking" value="<%= foody.getFoody_parking() %>"></p>
        <p>배달 가능 여부: <input type="text" name="foody_delivery" value="<%= foody.getFoody_delivery() %>"></p>
        <p>내용: <textarea name="foody_main"><%= foody.getFoody_main() %></textarea></p>
        <p>가게 주소: <input type="text" name="foody_address" value="<%= foody.getFoody_address() %>"></p>
        
        
        <input type="submit" value="수정" onclick="updateFoodyForm();">
        
    </form>
    <button onclick="location.href='/foody/view?foody_no=<%= foody.getFoody_no() %>'">취소</button>
    
    <script type="text/javascript">
		function updateFoodyForm() {
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
			}
			form.submit();
		}
	</script>
</body>
</html>
