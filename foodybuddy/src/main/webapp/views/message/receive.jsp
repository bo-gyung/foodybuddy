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
 <style>
        /* 모달 스타일 */
        .modal {
            display: none; /* 초기에는 보이지 않도록 설정 */
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 60%;
            max-width: 400px;
            border-radius: 10px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
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
        <li onmouseover="handleMouseOver(this);" onmouseout="handleMouseOut(this);"><a href="/msgTemp">임시쪽지</a></li>
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
        <button class="reply"  onclick="openReplyModal()">답장</button>
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
<%
    List<Map<String, Object>> messages2 = (List<Map<String, Object>>) request.getAttribute("messages2");
    if (messages2 != null && !messages2.isEmpty()) {
        int index = 1;
        for (Map<String, Object> message : messages2) {
%>
            <tr>
                <td>
                    <label class="checkbox-container">
                        <input type="checkbox" name="messageCheckbox" data-sendername="<%= message.get("senderName") %>" data-messagetitle="<%= message.get("message_title") %>" onchange="toggleRow(this)">
                        <span class="checkbox"></span>
                    </label>
                </td>
                <td><%= index %></td>
                <td><%= message.get("senderName") %></td>
                <td onclick="showMessage('<%= message.get("senderName") %>','<%= message.get("message_title") %>', '<%= message.get("message_text") %>', '<%= ((LocalDateTime) message.get("sent_at")).toString() %>');" style="cursor: pointer;">
                    <%= message.get("message_title") %>
                </td>
                <td><%= ((LocalDateTime) message.get("sent_at")).toString() %></td>
            </tr>
            <% index++; %>
        <% }
    } else { %>
        <tr>
            <td colspan="5">메시지가 없습니다.</td>
        </tr>
    <% } %>
        </table>
        <hr>
        
    </div>
</div>
 <!-- The Modal -->
    <div id="replyModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeReplyModal()">&times;</span>
            <h2>쪽지 답장</h2>
            <form id="replyForm" action="/message/send" method="POST">
                
                <label>받는 사람:</label>
                <input type="text" id="replyReceiverName" name="receiver" readonly><br>
                <label>제목:</label>
                <input type="text" id="replyMessageTitle" name="subject"><br>
                <label>내용:</label>
                <textarea name="message" rows="10" cols="30"></textarea><br>
                <button type="button" onclick="sendReply()">보내기</button>
            </form>
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
        var newWindow = window.open("about:blank", "_blank", "width=600,height=500");

        // CSS 스타일
        var styles = '<style>' +
            'body {' +
            '    font-family: Arial, sans-serif;' +
            '    background-color: #f9f9f9;' +
            '    margin: 0;' +
            '    padding: 20px;' +
            '}' +
            'h1 {' +
            '    text-align: center;' +
            '    color: #333;' +
            '}' +
            'form {' +
            '    max-width: 500px;' +
            '    margin: auto;' +
            '    background: #fff;' +
            '    padding: 20px;' +
            '    border-radius: 10px;' +
            '    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);' +
            '}' +
            'label {' +
            '    display: block;' +
            '    margin-bottom: 10px;' +
            '    color: #333;' +
            '    font-weight: bold;' +
            '}' +
            'input[type="text"], textarea {' +
            '    width: calc(100% - 20px);' +
            '    padding: 10px;' +
            '    margin-bottom: 10px;' +
            '    border: 1px solid #ccc;' +
            '    border-radius: 5px;' +
            '    font-size: 16px;' +
            '}' +
            'input[type="submit"] {' +
            '    background-color: #FEA116;' +
            '    color: white;' +
            '    padding: 10px 20px;' +
            '    border: none;' +
            '    border-radius: 5px;' +
            '    cursor: pointer;' +
            '    font-size: 16px;' +
            '}' +
            'input[type="submit"]:hover {' +
            '    background-color:darkorange;' +
            '}' +
            '</style>';

        // HTML 내용
        var temp = styles +
            '<h1>쪽지 보내기</h1>' +
            '<form action="/message/send" method="post">' +
            '    <label for="receiver">받는 사람:</label>' +
            '    <input type="text" id="receiver" name="receiver" required><br>' +
            '    <label for="subject">제목:</label>' +
            '    <input type="text" id="subject" name="subject" required><br>' +
            '    <label for="message">내용:</label>' +
            '    <textarea id="message" name="message" rows="5" cols="50" required></textarea><br>' +
            '    <input type="submit" value="쪽지 보내기">' +
            '</form>';

        newWindow.document.write(temp);
    }
    function showMessage(senderName,messageTitle, messageText, sentAt) {
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
            '    <div class="message-info"><strong>보낸 사람: '+senderName+' </strong></div>' +
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
    
    function openReplyModal() {
        const modal = document.getElementById("replyModal");
        modal.style.display = "block";

        const selectedCheckbox = document.querySelector('input[name="messageCheckbox"]:checked');
        if (selectedCheckbox) {
            const receiverName = selectedCheckbox.dataset.sendername;
            const messageTitle = selectedCheckbox.dataset.messagetitle;
            document.getElementById('replyReceiverName').value = receiverName;
            document.getElementById('replyMessageTitle').value = "Re: " + messageTitle;
        }
    }

    function closeReplyModal() {
        const modal = document.getElementById("replyModal");
        modal.style.display = "none";
    }

    function sendReply() {
        document.getElementById('replyForm').submit();
    }

    // 모달 창 외부 클릭 시 닫기
    window.onclick = function(event) {
        const modal = document.getElementById("replyModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    </script>
         <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="../resources/template/lib/wow/wow.min.js"></script>
    <!-- Template Javascript -->
    <script src="../resources/template/js/main.js"></script>
</body>
</html>