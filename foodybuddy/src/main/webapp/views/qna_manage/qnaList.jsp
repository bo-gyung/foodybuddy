<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodybuddy.qna_manage.vo.Qna" %>
<!DOCTYPE html>
<html>
<head>
    <title>QnA List</title>
    <style>
        /* 기본적인 스타일 설정 */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>QnA 대기 리스트</h2>
    <table>
        <thead>
            <tr>
                <th>글 번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
                <th>상태</th>
                <th>답변</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Qna> pendingQnaList = (List<Qna>) request.getAttribute("pendingQnaList");
                for (Qna qna : pendingQnaList) {
            %>
                <tr>
                    <td><%= qna.getQna_no() %></td>
                    <td><a href="<%= request.getContextPath() %>/qna/detail?qna_no=<%= qna.getQna_no() %>"><%= qna.getQna_title() %></a></td>
                    <td><%= qna.getQna_content() %></td>
                    <td><%= qna.getReg_date() %></td>
                    <td><%= qna.getQna_status() %></td>
                    <td><%= qna.getQna_answer() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <h2>QnA 완료 리스트</h2>
    <table>
        <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
                <th>상태</th>
                <th>답변</th>
                <th>완료일</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Qna> completedQnaList = (List<Qna>) request.getAttribute("completedQnaList");
                for (Qna qna : completedQnaList) {
            %>
                <tr>
                    <td><%= qna.getQna_no() %></td>
                    <td><a href="<%= request.getContextPath() %>/qna/detail?qna_no=<%= qna.getQna_no() %>"><%= qna.getQna_title() %></a></td>
                    <td><%= qna.getQna_content() %></td>
                    <td><%= qna.getReg_date() %></td>
                    <td><%= qna.getQna_status() %></td>
                    <td><%= qna.getQna_answer() %></td>
                    <td><%= qna.getCompleted_date() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
