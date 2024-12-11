<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="assets/css/verify.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style_manageuser.css">
</head>

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
                <li><a href="dashboard_admin.jsp" >Dashboard</a></li>
                <li><a href="#">School Information</a></li>
                <li><a href="view_version_Admin.jsp" class="active">School Version</a></li>
                <li><a href="#">Equipment Information</a></li>
                <li><a href="manage_user_admin.jsp">Manage User Information</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="dashboard-content">
            <div class="header">
                <img src="assets/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>TVPSS Management System</h2>
            </div>
 
    <div class="container1">
    <!-- School Information -->
    <div class="school-info">
        <h2>School Version Information</h2>
        <p><strong>SMK Mutiara Rini</strong></p>
        <p>Teacher-in-charge: Pn. Ismafatuladzwa Binti Ismail</p>
        <p>Current Version: 1</p>
    </div>

    <!-- Table -->
    <table>
        <thead>
            <tr>
                <th>Requirements</th>
                <th style = "align-mid">Attachments</th>
                <th>Verification</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td data-requirement="logo">Logo</td>
                <td><a href="#">🔗</a></td>
                <td><input type="checkbox" checked></td>
            </tr>
            <tr>
                <td data-requirement="studio">Corner/Mini Studio/TV Studio</td>
                <td><a href="#">🔗</a></td>
                <td><input type="checkbox"></td>
            </tr>
            <tr>
                <td data-requirement="recording">In-School Recording</td>
                <td><a href="#">🔗</a></td>
                <td><input type="checkbox" checked></td>
            </tr>
            <tr>
                <td data-requirement="upload">Upload on Youtube</td>
                <td><a href="#">🔗</a></td>
                <td><input type="checkbox" checked></td>
            </tr>
            <tr>
                <td data-requirement="outside-recording">Recording inside and outside the school</td>
                <td><a href="#">🔗</a></td>
                <td><input type="checkbox"></td>
            </tr>
            <tr>
                <td data-requirement="collaboration">Collaborate with external agencies</td>
                <td><a href="#">🔗</a></td>
                <td><input type="checkbox"></td>
            </tr>
            <tr>
                <td data-requirement="tech">Using "Green Screen" Technology</td>
                <td><a href="#">🔗</a></td>
                <td><input type="checkbox"></td>
            </tr>
        </tbody>
    </table>

    <!-- Update Button -->
    <div class ="button-container">
    	<button class="update-btn" onclick = "confirmUpdate()">Update</button>
    </div>
    
</div>

            </div>
        </div>

<script>
    function confirmUpdate() {
        const userConfirmed = confirm("Are you sure you want to update?");

        if (userConfirmed) {
            window.location.href = "view_version_Admin.jsp"; 
        }
    }
    
    
    
    
</script>

</body>
</html>



