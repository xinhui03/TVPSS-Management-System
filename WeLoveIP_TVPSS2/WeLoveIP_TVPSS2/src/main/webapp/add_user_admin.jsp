<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Add User</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style_adduser.css">
   
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile">
                <img src="assets/images/icon_admin.png" alt="Profile Picture" class="profile-pic">
                <div class="profile-info">
                    <h3>Admin</h3>
                    <p>ali@admintvpss.com</p> <!-- Fetching email dynamically -->
                </div>
            </div>
            
            <button class="logout-btn" onclick="window.location.href='login.jsp'">Log Out</button>
            <hr>
            <ul class="nav">
                <li><a href="dashboard_admin.jsp">Dashboard</a></li>
                <li><a href="#">School Information</a></li>
                <li><a href="#">School Version</a></li>
                <li><a href="#">Equipment Information</a></li>
                <li><a href="manage_user_admin.jsp" class="active">Manage User Information</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="dashboard-content">
            <div class="header">
                <img src="assets/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>TVPSS Management System</h2>
            </div>
			
            <h4 class="page-title">Manage User Information > Add User</h4>

				<form action="/WeLoveIP_TVPSS/manage_user_admin.jsp" method="post" onsubmit="return confirmSubmit()">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" placeholder="Insert teacher's full name" required>
                </div>

                <div class="form-group">
                    <label for="schoolName">School Name</label>
                    <input type="text" id="schoolName" name="schoolName" placeholder="Insert teacher's school name" required>
                </div>

                <div class="form-group">
                    <label for="contactNumber">Contact Number</label>
                    <input type="text" id="contactNumber" name="contactNumber" placeholder="Insert teacher's contact number" required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Insert teacher's email" required>
                </div>

                <div class="form-group">
                    <label for="state">State</label>
                    <input type="text" id="state" name="state" placeholder="Insert teacher's state" required>
                </div>

                <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city" placeholder="Insert teacher's city" required>
                </div>

                <div class="form-buttons">
                    <button type="button" class="cancel-btn" onclick="history.back()">Cancel</button>
                    <button type="submit" class="submit-btn">Submit</button>
                </div>
            </form>
            <script>
    function confirmSubmit() {
        // Confirmation popup before submitting the form
        var confirmation = confirm("Are you sure to add this user information?");
        if (result) {
        	 // This alert can be removed if not needed
            alert("This information has been successfully submitted!");
            
            // After successful submission, redirect to manage_user_admin.jsp
            return true;  // Proceed with form submission
            
        } else {
            return false;  // Cancel form submission
        }
    }
</script>
        </div>
    </div>
</body>
</html>
