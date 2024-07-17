<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 쪽지함</title>
</head>
<body>
    <h1>보낸 쪽지함</h1>
    
    <table border="1">
        <tr>
            <th>받는 사람</th>
            <th>제목</th>
            <th>내용</th>
            <th>보낸 시간</th>
        </tr>
        
        <%@ page import="java.util.List" %>
        <%@ page import="your.package.Message" %>
        <% List<Message> sentMessages = (List<Message>) request.getAttribute("sentMessages"); %>
        <% for (Message message : sentMessages) { %>
            <tr>
                <td><%= message.getReceiverNickname() %></td>
                <td><%= message.getSubject() %></td>
                <td><%= message.getMessageContent() %></td>
                <td><%= message.getSentAt() %></td>
            </tr>
        <% } %>
    </table>
    
</body>
</html>
