<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Notice</title>
</head>
<body>
    <h1>Create New Notice</h1>
    <form action="${pageContext.request.contextPath}/Notice/notices" method="post">
        <input type="hidden" name="action" value="insert">
        <label for="title">Title:</label>
        <input type="text" name="title" id="title" required><br>
        <label for="content">Content:</label>
        <textarea name="content" id="content" required></textarea><br>
        <label for="date">Date:</label>
        <input type="date" name="date" id="date" required><br>
        <button type="submit">Submit</button>
    </form>
    <a href="${pageContext.request.contextPath}/Notice/notices">Back to List</a>
</body>
</html>
