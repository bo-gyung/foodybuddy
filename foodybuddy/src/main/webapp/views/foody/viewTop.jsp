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
    <section>
    	<div>
			<table>
				<tbody>
					<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
						<%@page import="com.foodybuddy.foody.vo.Foody, java.util.*" %>
						<% List<Foody> list = (List<Foody>) request.getAttribute("resultList");


            for(int i = 0 ; i < 3 ; i++){ %>
            	<tr>
            	
            		<td>TOP <%=(i+1) %></td>
            	</tr>
            	
            	
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
</body>
</html>
