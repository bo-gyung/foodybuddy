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
            <th>받은 사람</th>
            <th>제목</th>
            <th>내용</th>
            <th>받은 시간</th>
        </tr>
        
      <%@ page import="java.util.List, java.util.Map, java.time.LocalDateTime" %>
	  <%@ page import="com.foodybuddy.message.vo.Message" %>
 	  <% List<Map<String, Object>> messages = (List<Map<String, Object>>) request.getAttribute("messages"); %>
		
            <% for (Map<String, Object> message : messages) { %>
                <tr>
                    <td><%= message.get("senderName") %></td>
                    <td><%= message.get("message_title") %></td>
                    <td><%= message.get("message_text") %></td>
                    <td><%= ((LocalDateTime) message.get("sent_at")).toString() %></td>
                </tr>
            <% } %>
    </table>
    
</body>
</html>