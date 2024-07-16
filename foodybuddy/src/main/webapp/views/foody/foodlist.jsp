<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="css/theme.css">
<title>맛집</title>
</head>
<body>
	<h1>맛집</h1>
	<div style="flex-direction: row; display: flex;">
		<div>조회수 순</div>&nbsp;&nbsp;&nbsp;<div>최신 순</div>&nbsp;&nbsp;&nbsp;<div>좋아요 순</div>
	</div>
	<div>
	<select>
		<option value="">선택하세요</option>
		<option value="작성자">작성자</option>
		<option value="제목">제목</option>
		<option value="위치">위치</option>
	</select>
	<input type="text" name="searchbar"><button onclick="result();">검색</button>
	</div>
	<a href="/foody/create">작성</a>
	<div id="best" onclick="best();">testing</div>
	<div id="list">testing</div>
	
	
	
<%-- 	<%@page import="com.fb.foody.vo.Foody, java.util.*" %>

						<%
							List<Foody> list = (List<Foody>)request.getAttribute("resultList");
							for(int i = 0 ; i < list.size(); i++){ %>
								<tr>
									<td><%=list.get(i).getUser_no()%></td>
									<td><%=list.get(i).getFoody_name()%></td>
									<td><%=list.get(i).getReg_date()%></td>
									<td><%=list.get(i).getFoody_good()%></td>
									<td><%=list.get(i).getFoody_click()%></td>
								</tr>
						<%}%>
					</tbody>
				</table>
			</div>
		</div>
	</section>
		<% Foody paging = (Foody)request.getAttribute("paging"); %>
		<% if(paging != null){ %>
			<div class="center">
				<div class="pagination">
					<% if(paging.isPrev()){ %>
					<a href="/foody/list?nowPage=<%=(paging.getPageBarStart()-1)%>">
					&laquo;
					</a>
					<%} %>
					<% for(int i = paging.getPageBarStart() ; i <= paging.getPageBarEnd() ; i++){ %>
					<a href="/foody/list?nowPage=<%=i%>"
						<%=paging.getNowPage() == i ? "class='active'" : "" %>>
						<%=i %>
					</a>
					<%} %>
					<% if(paging.isNext()){ %>
						<a href="/board/list?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
					<%} %>
				</div>
			</div>
		<% } %> 
	<script src="js/theme.js"></script> --%>
</body>
</html>