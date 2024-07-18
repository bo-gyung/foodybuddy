<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 쪽지함</title>
</head>
<body>
    <h1>받은 쪽지함</h1>
    
    <table border="1">
        <tr>
            <th>보낸 사람</th>
            <th>제목</th>
            <th>내용</th>
            <th>보낸 시간</th>
        </tr>
        
        <c:forEach var="message" items="${messages}">
            <tr>
                <td>${message.senderName}</td> <!-- 보낸 사람의 닉네임 출력 -->
                <td>${message.message_title}</td> <!-- 메시지 제목 출력 -->
                <td>${message.message_text}</td> <!-- 메시지 내용 출력 -->
                <td>${message.sent_at}</td> <!-- 보낸 시간 출력 -->
            </tr>
        </c:forEach>
    </table>
    
</body>
</html>
