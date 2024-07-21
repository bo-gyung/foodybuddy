<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodybuddy.qna_manage.vo.Qna" %>
<!DOCTYPE html>
<html>
<head>
    <title>QnA Detail</title>
    <style>
        /* 기본적인 스타일 설정 */
        .qna-detail {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .qna-detail h2 {
            text-align: center;
        }
        .qna-detail p {
            margin: 10px 0;
        }
        .qna-detail .label {
            font-weight: bold;
        }
        .qna-detail .date {
            text-align: right;
            color: #666;
        }
        .qna-detail .answer-form {
            margin-top: 20px;
        }
        .qna-detail .answer-form textarea {
            width: 100%;
            height: 100px;
        }
        .action-buttons {
            display: flex;
            justify-content: space-between;
        }
        .action-buttons button {
            padding: 10px 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
            background-color: #f9f9f9;
        }
        .action-buttons button:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="qna-detail">
        <h2>QnA</h2>
        <%
            Qna qna = (Qna) request.getAttribute("qna");
        %>
        <p class="label">제목:</p>
        <p><%= qna.getQna_title() %></p>
        <p class="label">내용:</p>
        <p><%= qna.getQna_content() %></p>
        <p class="date">작성일: <%= qna.getReg_date() %></p>
        
        <div class="answer-form">
            <form action="<%= request.getContextPath() %>/qna/answer" method="post">
                <input type="hidden" name="qna_no" value="<%= qna.getQna_no() %>">
                <p class="label">답변:</p>
                <textarea name="answer" placeholder="답변을 입력해주세요" required><%= qna.getQna_answer() == null ? "" : qna.getQna_answer() %></textarea>
                <div class="action-buttons">
                    <button type="submit">저장</button>
                    <button type="button" onclick="window.location.href='<%= request.getContextPath() %>/qna/list'">이전</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
