<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Notice Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        form {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .button-container {
            text-align: right;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
            text-decoration: none;
            color: #333;
            cursor: pointer;
            margin-right: 10px;
        }
        .button:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <h1>Notice Form</h1>
    <form action="create" method="post">
        <p>
            <label for="title">Title:</label>
            <input type="text" id="title" name="notice_title" required/>
        </p>
        <p>
            <label for="content">Content:</label>
            <textarea id="content" name="notice_content" required></textarea>
        </p>
        <p class="button-container">
            <input type="submit" value="게시" class="button"/>
            <a href="/notices" class="button">이전</a>
        </p>
    </form>
</body>
</html>
