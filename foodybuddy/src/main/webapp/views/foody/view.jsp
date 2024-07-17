<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<%@ page import="com.foodybuddy.foody.vo.Foody" %>
<%@ page import="com.foodybuddy.foody.dao.FoodyDao" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.foodybuddy.common.sql.JDBCTemplate" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸디 상세 정보</title>
</head>
<body>
    <%
        // 세션에서 사용자 ID 가져오기
        String userId = (String) session.getAttribute("user_id");

        // foody_no 파라미터 확인
        int foody_no = 0;
        if(request.getParameter("foody_no") != null) {
            foody_no = Integer.parseInt(request.getParameter("foody_no"));
        }

        // foody_no가 0이면 유효하지 않은 게시물로 간주하여 처리
        if(foody_no == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.')");
            script.println("location.href= 'foodlist.jsp'");
            script.println("</script>");
        }

        // JDBCTemplate을 사용하여 Connection 가져오기
        Connection conn = JDBCTemplate.getConnection();

        // FoodyDao를 사용하여 foody_no에 해당하는 게시물 정보 조회
        Foody foody = new FoodyDao().getFoody(foody_no, conn);

        // 날짜 포맷팅을 위한 준비
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String formattedRegDate = foody.getReg_date().format(formatter);
    %>

    <section>
        <div class="foody_detail">
            <h2><%= foody.getFoody_title() %></h2>
            <p>작성자: <%= foody.getFoody_name() %></p>
            <p>작성일자: <%= formattedRegDate %></p>
            <p>내용: <%= foody.getFoody_main() %></p>

            
           <% if(userId != null && userId.equals(foody.getFoody_name())){ %>
                <a href="update.jsp?foody_no=<%= foody_no %>">수정</a>
                <a href="delete.jsp?foody_no=<%= foody_no %>">삭제</a>
            <% } %>

            <a href="foodlist.jsp">메뉴</a>
        </div>
    </section>
</body>
</html>
