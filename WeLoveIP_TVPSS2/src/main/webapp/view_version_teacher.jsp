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
                <li><a href="dashboard_teacher.jsp" >Dashboard</a></li>
                <li><a href="#">School Information</a></li>
                <li><a href="view_version_teacher" class="active">School Version</a></li>
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
						        <label for="file-logo-1" class="attachment-icon1">🔗</label>
						        <input type="file" id="file-logo-1" class="file-input" onchange="handleFileUpload(event)">
						        <span id="file-name-logo-1"></span>
				            </td>
				        </tr>
				        <tr>
				            <td>Corner/Mini Studio/TV Studio</td>
				            <td>
				                <label for="file-logo-2" class="attachment-icon">🔗</label>
				                <input type="file" id="file-logo-2" class="file-input" onchange="handleFileUpload(event)">
				                <span id="file-name-logo-2"></span>
				            </td>
				        </tr>
				        <tr>
				            <td>In-School Recording</td>
				            <td>
				                <label for="file-logo-3" class="attachment-icon">🔗</label>
				                <input type="file" id="file-logo-3" class="file-input" onchange="handleFileUpload(event)">
				                <span id="file-name-logo-3"></span>
				            </td>
				        </tr>
				        <tr>
				            <td>Upload on Youtube</td>
				            <td>
				                <label for="file-logo-4" class="attachment-icon">🔗</label>
				                <input type="file" id="file-logo-4" class="file-input" onchange="handleFileUpload(event)">
				                <span id="file-name-logo-4"></span>
				            </td>
				        </tr>`
				        <tr>
				            <td>Recording inside and outside the school</td>
				            <td>
				                <label for="file-logo-5" class="attachment-icon">🔗</label>
				                <input type="file" id="file-logo-5" class="file-input" onchange="handleFileUpload(event)">
				                <span id="file-name-logo-5"></span>
				            </td>
				        </tr>
				        <tr>
				            <td>Collaborate with external agencies</td>
				            <td>
				                <label for="file-logo-6" class="attachment-icon">🔗</label>
				                <input type="file" id="file-logo-6" class="file-input" onchange="handleFileUpload(event)">
				                <span id="file-name-logo-6"></span>
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
            
<script>

    function confirmUpdate() {
        const userConfirmed = confirm("Are you sure you want to update?");

        if (userConfirmed) {
            window.location.href = "dashboard_teacher.jsp"; 
        }
    }

</script>

<script>
function handleFileUpload(event) {
    console.log("File upload triggered...");
    const fileInput = event.target; // The file input element
    const fileName = document.getElementById('file-name-logo-1')

    if (fileInput.files.length > 0) {
        fileName.textContent = fileInput.files[0].name; // Get the uploaded file name
        console.log("File name detected:", fileName);
    } else {
        fileNameSpan.textContent = "No file selected"; // Reset text if no file is selected
    }
}


</script>
 
</body>
</html>





