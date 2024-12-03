<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TVPSS Management System - Login</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style_login.css">
</head>
<body>
    <div class="login-container">
        <img src="assets/images/kpm_logo.png" alt="Logo" class="large-logo">
        <h2>TVPSS Management System</h2>
        <form action="LoginServlet" method="post">
            <input type="text" id="username" name="username" placeholder="Email" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
        <div class="error-message">
            ${message != null ? message : ""}
        </div>
    </div>
</body>
</html>
