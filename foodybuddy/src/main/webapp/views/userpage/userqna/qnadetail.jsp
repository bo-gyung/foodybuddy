<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA상세보기</title>


</head>
<body>
	<div>
		<div>

	<%@page import="com.foodybuddy.userpage.vo.QnA, java.util.*"%>
	<%
	Map<String, Object> resultM = (Map<String, Object>) request.getAttribute("detail");
	%>
	<h3>QnA 상세확인</h3>
	<form action="/qna/updateEnd" name=qnacreate_form method="post">
		<label>제목</label> <input type="text" id="qna_title" maxlength="50"
			value="<%=resultM.get("title")%>"><br> <label>작성란</label>
		<textarea onkeyup="content();" id="qna_content" maxlength="500"
			cols="40" rows="15">
		<%=resultM.get("content")%>
		</textarea>
		<br>
		<!--작성자 기준 수정/ 삭제  -->
		<a href="/qna/update">수정</a> 
		<input type="button" value="삭제" onclick="deleteQnA('<%= resultM.get("qnaNo")%>');">
		<button >폼 제출버튼</button>
	</form>

	</div>
	<hr>
	<label> 관리자답변 </label>
	</div>

	<form action="/qna/createEnd" name=qnacreate_form method="post">

		<%
		String answerContent = "";
		//값이 null이 아니라면
		// if문 자바 / 답변 
		if (resultM != null && resultM.get("ansContent") != null) {
			answerContent = (String) resultM.get("ansContent");
		%>
		<textarea onkeyup="answer();" id="qna_answer" maxlength="500"
			cols="40" rows="15">
					<%=answerContent%>
				</textarea>
		<%
		}
		%>


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
 	//수정버튼
 	function submitForm(){
 		
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


</body>
</html>