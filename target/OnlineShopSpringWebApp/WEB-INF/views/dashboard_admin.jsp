<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_dashboard.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile">
<img src="${pageContext.request.contextPath}/images/icon_admin.png" alt="Profile Picture" class="profile-pic">
                <div class="profile-info">
                    <h3>Admin</h3>
                    <p>ali@admintvpss.com</p> <!-- Fetching email dynamically -->
                </div>
            </div>
            
<button class="logout-btn" onclick="window.location.href='${pageContext.request.contextPath}/logout'">Log Out</button>
            <hr>
            <ul class="nav">
                <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="<%= request.getRequestURI().endsWith("dashboard_admin.jsp") ? "active" : "" %>">Dashboard</a></li>
    <li><a href="#" class="<%= request.getRequestURI().endsWith("school_info_admin.jsp") ? "active" : "" %>">School Information</a></li>
    <li><a href="#" class="<%= request.getRequestURI().endsWith("school_version_admin.jsp") ? "active" : "" %>">School Version</a></li>
    <li><a href="#" class="<%= request.getRequestURI().endsWith("equipment_info_admin.jsp") ? "active" : "" %>">Equipment Information</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/manageuser" class="<%= request.getRequestURI().endsWith("manage_user_admin.jsp") ? "active" : "" %>">Manage User Information</a></li>
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
