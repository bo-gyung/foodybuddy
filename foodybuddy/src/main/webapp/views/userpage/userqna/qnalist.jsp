<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 목록</title>
</head>
<body>
	<section>
		<div>
			<div>
				<h2>QnA보낸 목록</h2>
			</div><br>
		</div>
			<table>
				<colgroup>
					<col width = "10%">
					<col width="50%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<%-- <%@page import = "com.foodybuddy.userpage.vo.QnA, java.util.*" %>
					<%
						List<QnA> list = (List<QnA>)request.getAtrribute("resultList");
						for(int i = 0; i < list.size(); i++){ %>
							<tr>
								<td><%=list.get(i).getQna_no() %></td>
								<td><%=list.get(i).getQna_title() %></td>
								<td><%=list.get(i).getQna_writer() %></td>
								<td><%=list.get(i).getReg_date() %></td> 
							</tr>
					<% }%> --%>
				</tbody>
					<%-- <tfoot>
						<%QnA paging = (QnA)request.getAtrribute("paging"); %>
						<%if (paging != null) {%>
							<div>
								<div>
									<%if(paging.isPrev()){ %>
									<a href = "/ =<%=(paging.getPageBarStart()-1)%>">&laquo;</a>
									<%} %>
									<%for(int i = paging.getPageBarStart(); i <=paging.getPageBarEnd(); i++){ %>
									<a href = "=<%=i%>">
									<%=paging.getNowPage() == i ? "class = 'active'" : "" %>>
									<%=i %>
									</a>
									<%} %>
									<%if (paging.isNext()){ %>
										<a href = "/">&raquo;</a>
										<%} %>
								</div>
							</div>
							<%} %>
					</tfoot> --%>
			</table>
	</section>
</body>
</html>