<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.foodybuddy.userpage.vo.QnA, java.util.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>QnA 목록</title>
</head>
<body>
			<!--목록 시작  -->
		<div>
			<form action ="/qna/list" name = "search_qna_form" method ="get">
			<!--제목을 기준으로 검색할거야.  -->
				<input type="text" name = "qna_title" placeholder="검색하려는 질문의 제목을 입력하세요.">
				<input type="submit" value="검색">
			</form>
		</div>
	<header>
		<a href = "/qna/create">QnA작성</a>
	</header>
	<section>
		<div>
			<div>
				<h2>QnA 목록</h2>
			</div><br>
		</div>
			<table>
				<colgroup>
					<col width = "15%">
					<col width = "50%">
					<col width = "25%">
					<col width = "25%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성날짜</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody>
					 <%
						List<QnA> list = (List<QnA>)request.getAttribute("resultList");
						for(int i = 0; i < list.size(); i++){
							// 처리상태 대기/완료
							QnA qna = list.get(i);
							String status = qna.getQna_status();
							String statusText = "대기";
							if("완료".equals(status)){
								statusText = "완료";
							}else {
								qna.getQna_status();
							}
						%>
							<tr>
								<td><%=list.get(i).getQna_no() %></td>
								<td><a href = "/qna/detail?qna_no=<%= list.get(i).getQna_no() %>"><%=list.get(i).getQna_title() %></a></td>
								<td><%=list.get(i).getReg_date() %></td>
								<td><%=statusText %></td> 
							</tr>
					<% }%> 
					
				</tbody>
				<!-- 페이징바 -->
					  <tfoot>
						<% QnA paging = (QnA)request.getAttribute("paging"); %>
						<%if (paging != null) {%>
							<div>
								<div>
								<!--첫번째 트루면 작동, false면 작동X  -->
								<%if(paging.isPrev()){ %>
										<a href = "/qna/list?noPage=<%=(paging.getPageBarStart()-1)%>">&laquo;</a>
									<%} %>
								<%for(int i = paging.getPageBarStart(); i <=paging.getPageBarEnd(); i++){ %>
									<a href = "/qna/list?nowPage=<%=i%>"
									<%=paging.getNowPage() == i ? "class='active'" : "" %>>
									<%=i%>
									</a>
									<%} %>
									<%if (paging.isNext()){ %>
										<a href = "/qna/list?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
										<%} %>
								</div>
							</div>
				<%} %>
					</tfoot> 
			</table>
	</section>

				 
</body>
</html>