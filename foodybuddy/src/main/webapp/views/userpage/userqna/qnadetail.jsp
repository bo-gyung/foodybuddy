<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA상세보기</title>

 
</head>
<body>



<%@page import="com.foodybuddy.userpage.vo.QnA, java.util.*" %>
 <% Map<String,Object> resultM = (Map<String,Object>)request.getAttribute("detail"); %>
 <h3> QnA 상세확인</h3>
 <label> 작성자 </label> 
 </div>
			<form action ="/qna/createEnd" name = qnacreate_form method = "post">
			<label>제목</label>
				<input type = "text" id = "qna_title" maxlength = "50" value = "<%= resultM.get("title") %>"><br>
				<label>작성란</label>
				<textarea onkeyup = "content();" id = "qna_content"maxlength = "500"  cols = "40" rows = "15">
				<%= resultM.get("content") %>
				</textarea>
				  <!--작성자 기준 수정/ 삭제  -->
				<a href = "/qna/update">수정</a><br>
				<a href = "/qna/delete">삭제</a>
				<input type = "reset" value ="초기화">
			</form>
			</div>
			<hr>
 <label> 관리자답변 </label> 
 </div>
			
			<form action ="/qna/createEnd" name = qnacreate_form method = "post">
				
			<% String answerContent = "";
        	//값이 null이 아니라면
        	// if문 자바 / 답변 
        	if (resultM != null && resultM.get("ansContent") != null) {
            	answerContent = (String) resultM.get("ansContent");%>
				 <textarea onkeyup = "answer();" id = "qna_answer"maxlength = "500" cols = "40" rows = "15">
					<%=answerContent %>
				</textarea>
           <%} %>
				  <!--작성자 기준 수정/ 삭제  -->
				<a href = "/qna/update">수정</a><br>
				<a href = "/qna/delete">삭제</a>
				
			</form>
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
 </script>
  
					
</body>
</html>