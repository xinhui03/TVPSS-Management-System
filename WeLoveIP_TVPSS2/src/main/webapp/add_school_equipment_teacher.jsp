<!DOCTYPE html>
<html>
<head>
<title>Add Equipment</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/style_manageuser.css">
</head>
<body>
	<div class="container">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="profile">
				<img src="assets/images/icon_teacher.png" alt="Profile Picture"
					class="profile-pic">
				<div class="profile-pic">
					<h3>Teacher</h3>
					<p>hairulsmkmr@gov.my</p>
				</div>
			</div>
			<button class="logout-btn" onclick="window.location.href='login.jsp'">Log
				Out</button>
			<hr>
			<ul class="nav">
				<li><a href="dashboard_teacher.jsp">Dashboard</a></li>
				<li><a href="school_info_teacher.jsp">School Information</a></li>
				<li><a href="#">School Version</a></li>
				<li><a href="school_equipment_teacher.jsp" class="active">Equipment
						Information</a></li>
				<li><a href="manage_user_teacher.jsp">Manage User
						Information</a></li>
				<li><a href="crew_application_teacher.jsp">Crew Application</a></li>
			</ul>
		</div>

		<!-- Main Content -->
		<div class="dashboard-content">
			<div class="header">
				<img src="assets/images/kpm_logo.png" alt="KPM Logo" class="logo">
				<h2>TVPSS Management System</h2>
			</div>

			<!-- Add Model Form -->
			<div class="form-container">
				<h3>Equipment Information</h3>
				<form action="SchoolEquipment_teacher" method="post">
					<input type="hidden" name="action" value="save"> <input
						type="hidden" name="schoolId" value="1">
					<!-- Replace with actual school ID -->
					<!-- Model Name Field -->
					<div>
						<label for="modelName">Model Name</label> <input type="text"
							id="modelName" name="modelName" required>
					</div>
					<br> <br>

					<!-- Type of Model Field -->
					<div>
						<label for="type">Type of Model</label> <select id="type"
							name="type" required>
							<option value="Camera">Camera</option>
							<option value="Microphone">Microphone</option>
							<option value="Other">Other</option>
						</select>
					</div>
					<br> <br>

					<!-- Status Field -->
					<div>
						<label for="status">Status</label> <select id="status"
							name="status" required>
							<option value="Work">Work</option>
							<option value="Damage">Damage</option>
						</select>
					</div>
					<br> <br>

					<!-- Buttons -->
					<div class="table-action-buttons">
						<button type="button" class="cancel"
							onclick="window.location.href='school_equipment_teacher.jsp'">Cancel</button>
						<button type="submit" class="add">Add</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>