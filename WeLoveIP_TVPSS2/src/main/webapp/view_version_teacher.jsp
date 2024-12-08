<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Dashboard</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style_manageuser.css">
    <link rel="stylesheet" type="text/css" href="assets/css/verify.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile">
                <img src="assets/images/icon_teacher.png" alt="Profile Picture" class="profile-pic">
                <div class="profile-info">
                    <h3>Teacher</h3>
                    <p>hairulsmkmr@gov.my</p> <!-- Fetching email dynamically -->
                </div>
            </div>
            
            <button class="logout-btn" onclick="window.location.href='login.jsp'">Log Out</button>
            <hr>
            <ul class="nav">
                <li><a href="dashboard_teacher.jsp" class="active">Dashboard</a></li>
                <li><a href="#">School Information</a></li>
                <li><a href="/version/pageTeacher.jsp">School Version</a></li>
                <li><a href="#">Equipment Information</a></li>
                <li><a href="manage_user_teacher.jsp">Manage User Information</a></li>
            </ul>
        </div>
			 <!-- Main Content -->
        <div class="dashboard-content">
            <div class="header">
                <img src="assets/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>TVPSS Management System</h2>
            </div>
            <div class="container">
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
			                <th>Attachments</th>
			            </tr>
			        </thead>
			        <tbody>
			            <tr>
			                <td>Logo</td>
				              <td>
				                <label for="file-logo" class="attachment-icon">🔗</label>
				                <input type="file" id="file-logo" class="file-input" onchange="handleFileUpload(event)">
				            </td>

			            </tr>
			            <tr>
			                <td>Corner/Mini Studio/TV Studio</td>
			                <td>
				                <label for="file-logo" class="attachment-icon">🔗</label>
				                <input type="file" id="file-logo" class="file-input" onchange="handleFileUpload(event)">
				            </td>
			            </tr>
			            <tr>
			                <td>In-School Recording</td>
			                <td>
				                <label for="file-logo" class="attachment-icon">🔗</label>
				                <input type="file" id="file-logo" class="file-input" onchange="handleFileUpload(event)">
				            </td>
			            </tr>
			            <tr>
			                <td>Upload on Youtube</td>
			                <td>
				                <label for="file-logo" class="attachment-icon">🔗</label>
				                <input type="file" id="file-logo" class="file-input" onchange="handleFileUpload(event)">
				            </td>
			            </tr>
			            <tr>
			                <td>Recording inside and outside the school</td>
			                <td>
				                <label for="file-logo" class="attachment-icon">🔗</label>
				                <input type="file" id="file-logo" class="file-input" onchange="handleFileUpload(event)">
				            </td>
			            </tr>
			            <tr>
			                <td>Collaborate with external agencies</td>
			                <td>
				                <label for="file-logo" class="attachment-icon">🔗</label>
				                <input type="file" id="file-logo" class="file-input" onchange="handleFileUpload(event)">
				            </td>
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
 
</body>
</html>

<script>
    function confirmUpdate() {
        const userConfirmed = confirm("Are you sure you want to update?");

        if (userConfirmed) {
            window.location.href = "dashboard_teacher.jsp"; 
        }
    }
</script>

