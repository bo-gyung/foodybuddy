<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="css/theme.css">
<title>맛집</title>
</head>
<style type="text/css">
	a, a:hover {
		color : #000000;
		text-decoration: none;
	}
</style>
<body>
	<section>
	<h1>맛집</h1>
	<div style="flex-direction: row; display: flex;">
		<form action="/board/foody" method="get">
			<input type="hidden" name="sort" value="reg_date">
			<button type="submit">최신 순</button>
		</form>
		<form action="/board/foody" method="get">
			<input type="hidden" name="sort" value="foody_good">
			<button type="submit">좋아요 순</button>
		</form>
	</div>
	<div>
	<form action="/board/foody" method="get">
	<select name="searchOption">
		<option value="">선택하세요</option>
		<option value="1">작성자</option>
		<option value="2">제목</option>
		<option value="3">위치</option>
	</select>
	
	<input type="text" name="searchbar" placeholder="검색어 입력">
	<button type="submit">검색</button>
	</form>
	</div>
	<a href="/foody/create">작성</a>
	<br>
	<br>
	<div class="high_list">
	<table>
		<colgroup>
			<col width="10%">
			<col width="80%">
			<col width="10%">
		</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>[이달의 좋아요 TOP 3]</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td><a href="/foody/viewTops">보러가기</a></td>
					<td></td>
				</tr>
			</tbody>
	</table>
	
	</div>
	<br>
	<br>
	<div class="foody_list">
				<table>
					<colgroup>
						<col width="10%">
						<col width="70%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<tbody>
						<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
						<%@ page import="com.foodybuddy.foody.vo.Foody, java.util.*" %>
						<%@ page import = "com.foodybuddy.user.vo.User" %>
						<% List<Foody> list = (List<Foody>) request.getAttribute("resultList");
							
							User user = (User) session.getAttribute("loginUser");
							
						
						
            for(int i = 0 ; i < list.size(); i++){ %>
            	<tr>
						<%
						    LocalDateTime regDateTime = list.get(i).getReg_date();
						    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH시 mm분");
						    String formattedDate = regDateTime.format(formatter);
						%>
            		
					<td><%= list.get(i).getFoody_no() %></td>            		
            		<td><a href="/foody/view?foody_no=<%= list.get(i).getFoody_no() %>"><%= list.get(i).getFoody_title() %></a><br>
            						작성자 : <%= list.get(i).getUser_name() %> 조회수 : <%= list.get(i).getFoody_click() %> 작성 시간 :<%= formattedDate %></td>
            		<td><%= list.get(i).getFoody_good() %></td>
                    
           		</tr>
                    
            <% } %>
						
						
					</tbody>
				</table>
			</div>
	
	</section>
		<%@page import="com.foodybuddy.common.sql.Paging, java.util.List" %>
		<% Foody paging = (Foody)request.getAttribute("paging"); %>
		<% if(paging != null){ %>
			<div class="center">
				<div class="pagination">
					<% if(paging.isPrev()){ %>
					<a href="/board/foody?nowPage=<%=(paging.getPageBarStart()-1)%>">
					&laquo;
					</a>
					<%} %>
					<% for(int i = paging.getPageBarStart() ; i <= paging.getPageBarEnd() ; i++){ %>
					<a href="/board/foody?nowPage=<%=i%>"
						<%=paging.getNowPage() == i ? "class='active'" : "" %>>
						<%=i %>
					</a>
					<%} %>
					<% if(paging.isNext()){ %>
						<a href="/board/foody?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
					<%} %>
				</div>
			</div>
		<% } %> 
	<script src="js/theme.js"></script>
</body>
</html>