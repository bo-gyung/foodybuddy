<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
<!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../../resources/template/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../resources/template/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../resources/template/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"  />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../resources/template/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../resources/template/css/style.css" rel="stylesheet">
   	<link href="../resources/css/message/main.css" rel="stylesheet">
   	
    </head>
<body style="background-color: white;">
 
<%@ include file="../include/navbar.jsp" %>
<!-- Hero Start -->
<div class="container-xxl py-5 bg-dark hero-header" style="margin-bottom: 0%;">
</div>
<!-- Hero End -->

<div class="content-container">
    <ul class="sideBar">
    	<br><br>
        <li><button onclick="openNewWindow();">쪽지쓰기</button></li>
        <br>
        <li>
        	<div style="background-color: aliceblue ;">
        		<a href="/msgReceive" style="color: #FEA116; font-weight : bold;">받은쪽지</a>
        	</div>
        </li>
        <li onmouseover="handleMouseOver(this);" onmouseout="handleMouseOut(this);"><a href="/msgSent">보낸쪽지</a></li>
        <li onmouseover="handleMouseOver(this);" onmouseout="handleMouseOut(this);"><a href="#draft">임시쪽지</a></li>
        <li onmouseover="handleMouseOver(this);" onmouseout="handleMouseOut(this);"><a href="#draft">휴지통</a></li>
    </ul>

    <div class="main">
        <select>
            <option>전체쪽지</option>
            <option>받은쪽지</option>
            <option>보낸쪽지</option>
            <option>보관쪽지</option>
        </select>
        <select>
            <option>아이디</option>
            <option>닉네임</option>
        </select>
        <input type="text" placeholder="쪽지검색">
        <hr>
        <span style="font-weight: bold;">검색결과</span>
        <span>1건</span>
        <span style="color: blue;">(쪽지검색키워드)</span>
        <hr>
        <button class="delete">삭제</button>
        <button class="save">보관</button>
        <button class="reply">답장</button>
        <hr>
        <table class="message-table">
            <tr>
                <th></th>
                <th>글번호</th>
                <th>보낸사람</th>
                <th>제목</th>
                <th>날짜</th>
            </tr>
      <%@ page import="java.util.List, java.util.Map, java.time.LocalDateTime" %>
	  <%@ page import="com.foodybuddy.message.vo.Message" %>
 	  <% List<Map<String, Object>> messages = (List<Map<String, Object>>) request.getAttribute("messages"); %>
		 <% int index = 1; %>
            <% for (Map<String, Object> message : messages) { %>
                <tr>
                  <td>
                    <label class="checkbox-container">
                        <input type="checkbox" onchange="toggleRow(this)">
                        <span class="checkbox"></span> 
                    </label>
                </td>
                	<td><%= index %></td>
                    <td><%= message.get("senderName") %></td>
                    <td onclick="showMessage('<%= message.get("senderName") %>', '<%= message.get("message_title") %>', '<%= message.get("message_text") %>', '<%= ((LocalDateTime) message.get("sent_at")).toString() %>');" style="cursor: pointer;">
            			<%= message.get("message_title") %>
        			</td>
                    <td><%= ((LocalDateTime) message.get("sent_at")).toString() %></td>
                </tr>
                <% index++; %>
            <% } %>
        </table>
        <hr>
        
    </div>
</div>
    
    <script>
    
    function toggleRow(checkbox) {
        const row = checkbox.closest('tr'); // 체크박스가 포함된 행을 찾음
        if (checkbox.checked) {
            row.classList.add('selected'); // 선택된 경우 배경색 추가
        } else {
            row.classList.remove('selected'); // 선택 해제된 경우 배경색 제거
        }
    }
    
    function openNewWindow() {
        // 새 창을 열기
        var newWindow = window.open("about:blank", "_blank", "width=600,height=400");
        let temp = `<h1>쪽지 보내기</h1>
            <form action="/message/send" method="post">
           
            받는 사람: <input type="text" name="receiver"><br>
            제목: <input type="text" name="subject"><br>
            내용: <textarea name="message" rows="5" cols="50"></textarea><br>
            <input type="submit" value="쪽지 보내기">
        </form>`

    newWindow.document.write(temp);

}
    function showMessage(receiverName, messageTitle, messageText, sentAt) {
        var newWindow = window.open("about:blank", "_blank", "width=600,height=400");

        var styles = '<style>' +
            'body {' +
            '    font-family: Arial, sans-serif;' +
            '    line-height: 1.6;' +
            '    padding: 20px;' +
            '    background-color: #f4f4f4;' +
            '}' +
            'h1 {' +
            '    color: #333;' +
            '    border-bottom: 2px solid #FEA116;' +
            '    padding-bottom: 10px;' +
            '}' +
            '.message-container {' +
            '    background: #fff;' +
            '    padding: 20px;' +
            '    border-radius: 8px;' +
            '    box-shadow: 0 0 10px rgba(0,0,0,0.1);' +
            '    margin-top: 20px;' +
            '}' +
            '.message-container div {' +
            '    margin-bottom: 10px;' +
            '}' +
            '.message-title {' +
            '    font-weight: bold;' +
            '    font-size: 1.2em;' +
            '    color: #007bff;' +
            '}' +
            '.message-content {' +
            '    font-size: 1em;' +
            '    color: #555;' +
            '}' +
            '.message-info {' +
            '    color: #777;' +
            '}' +
            '</style>';

        var temp = styles +
            '<h1>받은 쪽지</h1>' +
            '<div class="message-container">' +
            '    <div class="message-info"><strong>보낸 사람:</strong> ' + receiverName + '</div>' +
            '    <div class="message-title"><strong>제목:</strong> ' + messageTitle + '</div>' +
            '    <div class="message-content"><strong>내용:</strong> ' + messageText + '</div>' +
            '    <div class="message-info"><strong>보낸 시간:</strong> ' + sentAt + '</div>' +
            '</div>';

        newWindow.document.write(temp);
    }

    
    function handleMouseOver(li) {
        li.style.backgroundColor = 'aliceblue';
        li.querySelector('a').style.color = '#FEA116';
        li.querySelector('a').style.fontWeight = 'bold';
    }

    function handleMouseOut(li) {
        li.style.backgroundColor = '#f8f9fa';
        li.querySelector('a').style.color = 'black';
        li.querySelector('a').style.fontWeight = 'normal';
    }
    </script>
         <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="../resources/template/lib/wow/wow.min.js"></script>
    <!-- Template Javascript -->
    <script src="../resources/template/js/main.js"></script>
</body>
</html>