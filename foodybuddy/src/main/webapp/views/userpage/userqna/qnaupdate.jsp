<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.foodybuddy.userpage.vo.QnA, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정</title>
</head>
<body>
<section>
		<div>
			<div>
				<div>
				<h3>QnA수정</h3>
				</div>
				  <form action="${pageContext.request.contextPath}/qna/updateForm" method="post" name="qna_updateForm">
           			 <input type="hidden" name="qna_no" value=" ${detail.qna_no}">
           			 <label for="title">제목</label>
           			 <input type="text" id="title" name="title" value="${detail.title}"><br>
            
            			<label for="content">내용</label>
           			 <textarea id="content" name="content">${detail.content}</textarea>
            
            			<button type="submit">수정완료</button>
            			</form>
				<%--  <%
                    // Java 코드로 데이터 가져오기
                    Map<String, Object> resultM = (Map<String, Object>) request.getAttribute("detail");
                    if (resultM != null) {
                        String qnaNo = resultM.get("qna_no").toString();
                        String title = (String) resultM.get("title");
                        String content = (String) resultM.get("content");
                %>
                <form action="/qna/update" method="post" name="qna_updateForm">
                    <input type="hidden" name="qna_no" value="<%= qnaNo %>">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" value="<%= title %>"><br>
                    <label for="content">내용</label>
                    <textarea id="content" name="content"><%= content %></textarea><br>
                    <button type="submit">수정완료</button>
                </form>
                <%
                    } else {
                        out.println("QnA 상세 정보를 불러올 수 없습니다.");
                    }
                %>
 --%>
			</div>
		</div>
	</section>	
</body>


</html>