<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.foodybuddy.userpage.vo.QnA, java.util.*" %>
<%
	Map<String,Object> resultM = (Map<String,Object>)request.getAttribute("detail"); 
    if (resultM != null) {
        String qnaNo = resultM.get("qna_no").toString();
        String title = (String) resultM.get("title");
        String content = (String) resultM.get("content");
%>
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
	<form action="/qna/update" method="post">
    
    <label for="title">제목</label>
    <input type="text" id="title" name="title" value="<%= title %>"><br>
    
    <label for="content">내용</label>
    <textarea id="content" name="content" ><%= content %></textarea>
    
    <button type="submit">수정완료</button>
</form>
			</div>
		</div>
	</section>	
</body>

</html>
<%
    } else {
        out.println("QnA 상세 정보를 불러올 수 없습니다.");
    }
%>