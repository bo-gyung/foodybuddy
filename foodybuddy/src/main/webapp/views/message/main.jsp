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
<body>
 
    <%@ include file="../include/navbar.jsp" %>
               <!-- Hero Start -->
            <div class="container-xxl py-5 bg-dark hero-header" style="margin-bottom: 0%;">
        	</div>
               
        <!-- Hero End -->
        <div class="container" style="padding-left: 0%; height:90%;">
        <div class="sendMsg" style=" height:100%; width:200px;">
        <ul class="sideBar">
           
            <li><button onclick="openNewWindow();" >쪽지쓰기</button></li>
            <br><br>
            <li onmouseover="handleMouseOver(this);" onmouseout="handleMouseOut(this);"><a href="/msgReceive">받은쪽지</a></li>
            <li onmouseover="handleMouseOver(this);" onmouseout="handleMouseOut(this);"><a href="/msgSent">보낸쪽지</a></li>
            <li onmouseover="handleMouseOver(this);" onmouseout="handleMouseOut(this);"><a href="#draft">임시쪽지</a></li>
            <li onmouseover="handleMouseOver(this);" onmouseout="handleMouseOut(this);"><a href="#draft">휴지통</a></li>
        </ul>
    </div>
    <main>
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
        <button>삭제</button>
        <button>보관</button>
        <button>답장</button>
        <hr>
        <table>
        	<tr>
        <td><label class="checkbox-container">
            <input type="checkbox">
            <span class="checkbox"></span> 
        </label><td>
        		<th>글번호</th>
        		<th>보낸사람/받는사람</th>
        		<th>제목</th>
        		<th>날짜</th>
        	</tr>
        </table>
        <hr>
        <label class="checkbox-container">
            <input type="checkbox">
            <span class="checkbox"></span> 
        </label>
    </main>
    </div>
    <script>
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
    
    function handleMouseOver(li) {
        li.style.backgroundColor = 'aliceblue';
        li.querySelector('a').style.color = 'black';
        li.querySelector('a').style.fontWeight = 'bold';
    }

    function handleMouseOut(li) {
        li.style.backgroundColor = '#444';
        li.querySelector('a').style.color = 'white';
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
        
        
        
        
        
        
        
        
        
        
        
    
    
    
    
    
   
    
    
