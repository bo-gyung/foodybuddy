<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<%@ page import="com.foodybuddy.foody.vo.Foody" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.foodybuddy.common.sql.JDBCTemplate" %>
<%@ page import="com.foodybuddy.user.vo.User" %>
<%@page import="com.foodybuddy.foodycomment.vo.Comment, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸디 상세 정보</title>
</head>
<body>
    <%
        
          int foody_no = Integer.parseInt(request.getParameter("foody_no"));

        // Foody 객체는 FoodyViewServlet에서 request에 설정한 이름과 동일하게 설정
        List<Foody> foodyList = (List<Foody>) request.getAttribute("foodyList");
        Foody foody = foodyList.get(0); // 리스트에서 첫 번째 Foody 객체 가져오기

        User loginUser = (User)session.getAttribute("user");
        
        // 날짜 포맷팅을 위한 준비
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String formattedRegDate = foody.getReg_date().format(formatter);
    %>

    <section>
        <div class="foody_detail">
            <h2><%= foody.getFoody_title() %></h2>
            
            <!-- 작성자에게 보이는 버튼 -->
            <% if(loginUser != null && loginUser.getUser_no() == foody.getUser_no()) { %>
                <button class="button" onclick="location.href='update.jsp?foody_no=<%= foody.getFoody_no() %>'">수정</button>
                <button class="button" onclick="location.href='delete.jsp?foody_no=<%= foody.getFoody_no() %>'">삭제</button>
            <% } %>
            
            <% if(loginUser != null) { %>
                <button class="button" onclick="likeFoody(<%= foody_no %>, <%= loginUser.getUser_no() %>)">좋아요</button>
            <% } %>
            
            <button class="button"> 모이기 </button>
            <span>작성일 : <%= formattedRegDate %></span>
            <div class="dropdown">
                <button class="button dropbtn"><%= foody.getUser_name() %></button>
                <div class="dropdown-content">
                    <a href="/board/foody?searchOption=1&searchBar=<%= foody.getUser_name() %>">작성자의 다른 글</a>
                    <a href="/report?foody_no=<%= foody.getFoody_no() %>">신고</a>
                </div>
            </div>
            <table>
            	<tr>
            		<td>가게 이름</td>
            		<td><%= foody.getFoody_name() %></td>
            	</tr>
            	<tr>
            		<td>가게 주소</td>
            		<td><%= foody.getFoody_address() %></td>
            	</tr>
            	<tr>
            		<td>맛 점수</td>
            		<td><%= foody.getFoody_taste() %> / 5 점</td>
            	</tr>
            	<tr>
            		<td>청결도 점수</td>
            		<td><%= foody.getFoody_clean() %> / 5 점</td>
            	</tr>
            	<tr>
            		<td>주차 가능 여부</td>
            		<td><%= foody.getFoody_parking() %></td>
            	</tr>
            	<tr>
            		<td>배달 가능 여부</td>
            		<td><%= foody.getFoody_delivery() %></td>
            	</tr>
            </table>
            <div>
            <%= foody.getFoody_main() %>
            </div>

            <button class="button" onclick="location.href='/board/foody'">메뉴로 돌아가기</button>
        </div>
        
        <div class="comment_section">
            <h3>댓글</h3>
            <form action="/comment" method="post">
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
    
    <script>
    function likeFoody(foody_no, user_no) {
                
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/foody/like", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                alert(xhr.responseText);
                location.reload();
            }
        };
        xhr.send("foody_no=" + foody_no + "&user_no=" + user_no);
    }
    </script>
</body>
</html>
