<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodybuddy.notice.vo.Notice" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 상세</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        #noticeContent, #editForm {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        #noticeContent h2 {
            margin-top: 0;
        }
        #noticeContent p, #editForm p {
            margin: 10px 0;
        }
        #editForm label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        #editForm input[type="text"], #editForm textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        #editForm textarea {
            height: 150px;
        }
        .action-buttons {
            text-align: center;
            margin-top: 20px;
        }
        .action-buttons button, .action-buttons input[type="submit"] {
            padding: 10px 20px;
            margin: 0 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
            background-color: #f9f9f9;
        }
        .action-buttons button:hover, .action-buttons input[type="submit"]:hover {
            background-color: #e0e0e0;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #333;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>공지사항 상세</h1>
    
    <!-- 제목과 내용 표시 -->
    <div id="noticeContent">
        <h2>제목: <%= ((Notice)request.getAttribute("notice")).getNotice_title() %></h2>
        <div class="info">
            <p>조회수: <%= ((Notice)request.getAttribute("notice")).getNotice_view_count() %></p>
            <p>작성일: <%= ((Notice)request.getAttribute("notice")).getNotice_date() %></p>
        </div>
        <p>내용: <%= ((Notice)request.getAttribute("notice")).getNotice_content() %></p>
    </div>
    
    <!-- 수정 폼 -->
    <div id="editForm" style="display: none;">
        <form id="editNoticeForm" action="/notices/update" method="post">
            <input type="hidden" name="notice_id" value="<%= ((Notice)request.getAttribute("notice")).getNotice_no() %>">
            <p>
                <label for="editTitle">제목:</label>
                <input type="text" id="editTitle" name="notice_title" value="<%= ((Notice)request.getAttribute("notice")).getNotice_title() %>" required/>
            </p>
            <p>
                <label for="editContent">내용:</label>
                <textarea id="editContent" name="notice_content" required><%= ((Notice)request.getAttribute("notice")).getNotice_content() %></textarea>
            </p>
            <div class="action-buttons">
                <input type="submit" value="수정">
                <button type="button" onclick="cancelEdit()">취소</button>
            </div>
        </form>
    </div>
    
    <!-- 수정 및 삭제 버튼 -->
    <div class="action-buttons">
        <button id="editButton" onclick="toggleEditForm()">수정</button>
        <form action="/notices/delete" method="post" style="display: inline;">
            <input type="hidden" name="notice_id" value="<%= ((Notice)request.getAttribute("notice")).getNotice_no() %>">
            <input type="submit" value="삭제">
        </form>
    </div>
    
    <!-- 이전 링크 -->
    <a href="/notices" class="back-link">이전</a>
    
    <script>
        function toggleEditForm() {
            var editForm = document.getElementById("editForm");
            var editButton = document.getElementById("editButton");
            var noticeContent = document.getElementById("noticeContent");

            if (editForm.style.display === "none") {
                // 수정 폼을 보이게 하고, 제목과 내용을 숨김
                editForm.style.display = "block";
                editButton.style.display = "none"; // 수정 버튼 숨기기
                noticeContent.style.display = "none";
            } else {
                // 수정 취소 시 제목과 내용을 보이게 하고, 수정 폼을 숨김
                editForm.style.display = "none";
                editButton.style.display = "block"; // 수정 버튼 보이기
                noticeContent.style.display = "block";
            }
        }

        function cancelEdit() {
            // 수정 폼을 숨기고 제목과 내용을 다시 보이게 함
            var editForm = document.getElementById("editForm");
            var editButton = document.getElementById("editButton");
            var noticeContent = document.getElementById("noticeContent");

            editForm.style.display = "none";
            editButton.style.display = "block"; // 수정 버튼 보이기
            noticeContent.style.display = "block";
        }
    </script>
</body>
</html>
