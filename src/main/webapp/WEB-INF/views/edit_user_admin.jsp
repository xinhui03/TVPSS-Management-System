<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
     <title>Admin Edit User</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_edit_user.css">
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
                <li><a href="#">School Information</a></li>
                <li><a href="#">School Version</a></li>
                <li><a href="#">Equipment Information</a></li>
    			<li><a href="${pageContext.request.contextPath}/admin/manageuser" class="<%= request.getRequestURI().endsWith("manage_user_admin.jsp") ? "active" : "" %>">Manage User Information</a></li>
            </ul>
        </div>

		<!-- Main Content -->
        <div class="dashboard-content">
            <div class="header">
<img src="${pageContext.request.contextPath}/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>TVPSS Management System</h2>
            </div>
			
            <h4 class="page-title">Manage User Information > Edit User Information</h4>

<form action="${pageContext.request.contextPath}/admin/update" method="post" onsubmit="return confirmSubmit()">
    <div class="form-group">
        <input type="hidden" name="id" value="${teacher.id}">
        <label for="fullName">Full Name</label>
        <input type="text" name="fullName" value="${teacher.fullName}" required>
    </div>
    <div class="form-group">
        <label for="schoolName">School Name</label>
        <input type="text" name="schoolName" value="${teacher.schoolName}" required>
    </div>
    <div class="form-group">
        <label for="contactNumber">Contact Number</label>
        <input type="tel" name="contactNumber" pattern="[0-9]{10}" value="${teacher.contactNumber}" required>
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" name="email" value="${teacher.email}" required>
    </div>
    <div class="form-group">
        <label for="state">State</label>
        <input type="text" name="state" value="${teacher.state}" required>
    </div>
    <div class="form-group">
        <label for="city">City</label>
        <input type="text" name="city" value="${teacher.city}" required>
    </div>
    <div class="form-buttons">
        <button type="submit" class="cancel-btn">Save Changes</button>
        <button type="button" class="submit-btn" onclick="window.location.href='${pageContext.request.contextPath}/admin/manageuser'">Cancel</button>
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
            
            
            
            
            
            
            