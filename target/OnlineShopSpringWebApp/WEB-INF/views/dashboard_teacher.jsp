<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Dashboard</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_dashboard.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile">
<img src="${pageContext.request.contextPath}/images/icon_teacher.png" alt="Profile Picture" class="profile-pic">
                <div class="profile-info">
                    <h3>Teacher</h3>
                    <p>hairulsmkmr@gov.my</p> <!-- Fetching email dynamically -->
                </div>
            </div>
            
<button class="logout-btn" onclick="window.location.href='${pageContext.request.contextPath}/logout'">Log Out</button>
            <hr>
            <ul class="nav">
     <li><a href="${pageContext.request.contextPath}/teacher/dashboard" class="<%= request.getRequestURI().endsWith("dashboard_teacher.jsp") ? "active" : "" %>">Dashboard</a></li>
    <li><a href="#" class="<%= request.getRequestURI().endsWith("school_info_teacher.jsp") ? "active" : "" %>">School Information</a></li>
    <li><a href="${pageContext.request.contextPath}/teacher/school/version/${teacher.id}" class="<%= request.getRequestURI().endsWith("teacher_school_version.jsp") ? "active" : "" %>">School Version</a></li>
    <li><a href="#" class="<%= request.getRequestURI().endsWith("equipment_info_teacher.jsp") ? "active" : "" %>">Equipment Information</a></li>
    <li><a href="${pageContext.request.contextPath}/teacher/manageuser" class="<%= request.getRequestURI().endsWith("manage_user_teacher.jsp") ? "active" : "" %>">Manage User Information</a></li>
</ul>
        </div>

        <!-- Main Content -->
        <div class="dashboard-content">
            <div class="header">
<img src="${pageContext.request.contextPath}/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>TVPSS Management System</h2>
            </div>
            <div class="purple-box">
                <h3>Dashboard</h3>
                <div class="poster-container">
<img src="${pageContext.request.contextPath}/images/poster1.jpg" alt="Poster 1">
<img src="${pageContext.request.contextPath}/images/poster2.jpg" alt="Poster 1">
                </div>
            </div>
        </div>
    </div>
</body>
</html>
