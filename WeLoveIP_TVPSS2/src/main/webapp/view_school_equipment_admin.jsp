<%@ page import="java.util.List"%>
<%@ page import="com.example.model.Equipment"%>

<!DOCTYPE html>
<html>
<head>
<title>School Equipment</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/style_manageuser.css">
</head>
<body>
	<div class="container">
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
				<li><a href="school_info_admin.jsp">School
						Information</a></li>
				<li><a href="#">School Version</a></li>
				<li><a href="school_equipment_admin.jsp" class="active">Equipment
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
			<div class="school-equip">
				<h3>${school.name}</h3>
				<div class="school-equip-card">
					<table>
						<thead>
							<tr>
								<th>Model</th>
								<th>Type of Model</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
							List<Equipment> equipmentList = (List<Equipment>) request.getAttribute("equipmentList");
							if (equipmentList != null) {
								for (Equipment equipment : equipmentList) {
							%>
							<tr>
								<td><%=equipment.getModel()%></td>
								<td><%=equipment.getType()%></td>
								<td><span
									class="<%=equipment.getStatus().equals("Work") ? "status-work" : "status-damage"%>">
										<%=equipment.getStatus()%>
								</span></td>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
			<button onclick="window.history.back()" class="back-btn">Back</button>
		</div>
	</div>
</body>
</html>