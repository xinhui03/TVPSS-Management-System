<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
     <title>Teacher Edit User</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_edit_user.css">
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
                <li><a href="#">School Information</a></li>
                <li><a href="#">School Version</a></li>
                <li><a href="#">Equipment Information</a></li>
    			<li><a href="${pageContext.request.contextPath}/teacher/manageuser" class="<%= request.getRequestURI().endsWith("manage_user_teacher.jsp") ? "active" : "" %>">Manage User Information</a></li>
            </ul>
        </div>

		<!-- Main Content -->
        <div class="dashboard-content">
            <div class="header">
<img src="${pageContext.request.contextPath}/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>TVPSS Management System</h2>
            </div>
			
            <h4 class="page-title">Manage User Information > Edit User Information</h4>

<form action="${pageContext.request.contextPath}/teacher/update" method="post" onsubmit="return confirmSubmit()">
    <div class="form-group">
        <input type="hidden" name="id" value="${teacher.id}">
        <label for="fullName">Full Name</label>
        <input type="text" name="fullName" value="${student.fullName}" required>
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" name="email" value="${student.email}" required>
    </div>
    <div class="form-group">
        <label for="address">Address</label>
        <input type="text" name="address" value="${student.address}" required>
    </div>
    <div class="form-group">
        <label for="contact">Contact Number</label>
        <input type="text" name="contact" value="${student.contact}" required>
    </div>
    <div class="form-group">
        <label for="parentcontact">Contact Number</label>
        <input type="text" name="parentcontact" value="${student.parentcontact}" required>
    </div>
    <div class="form-group">
        <label for="studentid">Student ID</label>
        <input type="text" name="studentid" value="${student.studentid}" required>
    </div>
    <div class="form-group">
        <label for="grade">Class</label>
        <input type="text" name="grade" value="${student.grade}" required>
    </div>
    <div class="form-buttons">
        <button type="submit" class="cancel-btn">Save Changes</button>
        <button type="button" class="submit-btn" onclick="window.location.href='${pageContext.request.contextPath}/teacher/manageuser'">Cancel</button>
    </div>
</form>
<script>
    function confirmSubmit() {
        var confirmation = confirm("Are you sure to update this user information?");
        if (confirmation) {
            alert("This information has been successfully updated!");
            return true; // Proceed with form submission
        } else {
            return false; // Cancel form submission
        }
    }
</script>


        </div>
    </div>
</body>
</html>
            
            
            
            
            
            
            