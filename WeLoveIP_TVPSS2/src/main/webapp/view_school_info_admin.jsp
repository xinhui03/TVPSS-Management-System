<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>School Information</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/style_manageuser.css">
</head>
<body>
	<div class="container">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="profile">
				<img src="assets/images/icon_admin.png" alt="Profile Picture"
					class="profile-pic">
				<div class="profile-info">
					<h3>Admin</h3>
					<p>ali@admintvpss.com</p>
				</div>
			</div>

			<button class="logout-btn" onclick="window.location.href='login.jsp'">Log
				Out</button>
			<hr>
			<ul class="nav">
				<li><a href="dashboard_admin.jsp">Dashboard</a></li>
				<li><a href="school_info_admin.jsp" class="active">School
						Information</a></li>
				<li><a href="#">School Version</a></li>
				<li><a href="school_equipment_admin.jsp">Equipment
						Information</a></li>
				<li><a href="manage_user_admin.jsp">Manage User Information</a></li>
			</ul>
		</div>

		<!-- Main Content -->
		<div class="dashboard-content">
			<div class="header">
				<img src="assets/images/kpm_logo.png" alt="KPM Logo" class="logo">
				<h2>TVPSS Management System</h2>
			</div>
			<div class="school-card">
				<h3>${school.name}</h3>
				<div class="school-info-card">
					<table>			
						<tr>
							<th>School Address I :</th>
							<td>${school.addressI}</td>
						</tr>
						<tr class="spacer-row">
							<td colspan="2"></td>
						</tr>
						
						<tr>
							<th>School Address II :</th>
							<td>${school.addressII}</td>
						</tr>
						<tr class="spacer-row">
							<td colspan="2"></td>
						</tr>
						
						<tr>
							<th>Postcode :</th>
							<td>${school.postcode}</td>
						</tr>
						<tr class="spacer-row">
							<td colspan="2"></td>
						</tr>
						
						<tr>
							<th>Phone No. :</th>
							<td>${school.phone}</td>
						</tr>
						<tr class="spacer-row">
							<td colspan="2"></td>
						</tr>
						
						<tr>
							<th>State :</th>
							<td>${school.state}</td>
						</tr>
						<tr class="spacer-row">
							<td colspan="2"></td>
						</tr>
						
						<tr>
							<th>Fax No. :</th>
							<td>${school.fax}</td>
						</tr>
						<tr class="spacer-row">
							<td colspan="2"></td>
						</tr>
						
						<tr>
							<th>Email :</th>
							<td>${school.email}</td>
						</tr>
						<tr class="spacer-row">
							<td colspan="2"></td>
						</tr>
						
						<tr>
							<th>School Logo :</th>
							<td>${school.logo}</td>
						</tr>
						<tr class="spacer-row">
							<td colspan="2"></td>
						</tr>
						
						<tr>
							<th>Video Link :</th>
							<td>${school.link}</td>
						</tr>
						<tr class="spacer-row">
							<td colspan="2"></td>
						</tr>
					</table>
				</div>
			</div>
			<button onclick="window.history.back()" class="back-btn">Back</button>
		</div>
	</div>
</body>
</html>