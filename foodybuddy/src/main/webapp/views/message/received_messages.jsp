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
        
        <%@ page import="java.util.List" %>
        <%@ page import="your.package.Message" %>
        <% List<Message> receivedMessages = (List<Message>) request.getAttribute("receivedMessages"); %>
        <% for (Message message : receivedMessages) { %>
            <tr>
                <td><%= message.getSenderNickname() %></td>
                <td><%= message.getSubject() %></td>
                <td><%= message.getMessageContent() %></td>
                <td><%= message.getSentAt() %></td>
            </tr>
        <% } %>
    </table>
    
</body>
</html>
