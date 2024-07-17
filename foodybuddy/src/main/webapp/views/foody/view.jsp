<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<%@ page import="com.foodybuddy.foody.vo.Foody" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.foodybuddy.common.sql.JDBCTemplate" %>
<%@page import="com.foodybuddy.foodycomment.vo.Comment, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸디 상세 정보</title>
</head>
<body>
    <%
        // foody_no 파라미터 확인
        int foody_no = 0;
        if(request.getParameter("foody_no") != null) {
            foody_no = Integer.parseInt(request.getParameter("foody_no"));
        }

        // foody_no가 0이면 유효하지 않은 게시물로 간주하여 처리
        if(foody_no == 0) {
            out.println("<script>");
            out.println("alert('유효하지 않은 글입니다.')");
            out.println("location.href= 'foodlist.jsp'");
            out.println("</script>");
        }

        // Foody 객체는 FoodyViewServlet에서 request에 설정한 이름과 동일하게 설정
        List<Foody> foodyList = (List<Foody>) request.getAttribute("foodyList");
        Foody foody = foodyList.get(0); // 리스트에서 첫 번째 Foody 객체 가져오기

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

            <%-- 작성자와 로그인한 사용자가 같은 경우 수정 및 삭제 링크 표시 --%>
            <% if(session.getAttribute("user_id") != null && session.getAttribute("user_id").equals(foody.getFoody_name())) { %>
                <a href="update.jsp?foody_no=<%= foody.getFoody_no() %>">수정</a>
                <a href="delete.jsp?foody_no=<%= foody.getFoody_no() %>">삭제</a>
            <% } %>

            <a href="/board/foody">메뉴</a>
        </div>
        
        <div class="comment_section">
            <h3>댓글</h3>
            <form action="<%= request.getContextPath() %>/comment" method="post">
                <input type="hidden" name="foody_no" value="<%= foody_no %>">
                <textarea name="comment_text" required></textarea><br>
                <input type="submit" value="댓글 작성">
            </form>
            
            <!-- 댓글 리스트 -->
            <div class="comment_list">
                <%
                    List<Comment> commentList = (List<Comment>) request.getAttribute("commentList");
                    if (commentList != null) {
                        for (Comment comment : commentList) {
                            String formattedCommentDate = comment.getReg_date().format(formatter);
                %>
                            <div class="comment">
                                <p><%= comment.getUser_name() %>:</p>
                                <p><%= comment.getComment_text() %></p>
                                <p><%= formattedCommentDate %></p>
                            </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </section>
</body>
</html>
