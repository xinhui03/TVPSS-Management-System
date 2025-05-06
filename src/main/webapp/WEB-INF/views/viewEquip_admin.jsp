<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Admin View Equipment</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style_edit_user.css">
</head>
<body>
	<div class="container">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="profile">
				<img src="${pageContext.request.contextPath}/images/icon_admin.png"
					alt="Profile Picture" class="profile-pic">
				<div class="profile-info">
					<h3>Admin</h3>
					<p>ali@admintvpss.com</p>
					<!-- Fetching email dynamically -->
				</div>
			</div>

			<button class="logout-btn"
				onclick="window.location.href='${pageContext.request.contextPath}/logout'">Log
				Out</button>
			<hr>
			<ul class="nav">
				<li><a
					href="${pageContext.request.contextPath}/admin/dashboard"
					class="<%= request.getRequestURI().endsWith("dashboard_admin.jsp") ? "active" : "" %>">Dashboard</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/manageschoolinfo"
					class="<%= request.getRequestURI().endsWith("manageSchoolInfo_admin.jsp") ? "active" : "" %>">School
						Information</a></li>
				<li><a href="#">School Version</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/manageequipinfo"
					class="<%= request.getRequestURI().endsWith("manageEquipmentInfo_admin.jsp") ? "active" : "" %>">Equipment
						Information</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/manageuser"
					class="<%= request.getRequestURI().endsWith("manage_user_admin.jsp") ? "active" : "" %>">Manage
						User Information</a></li>
			</ul>
		</div>

		<!-- Main Content -->
		<div class="dashboard-content">
			<div class="header">
				<img src="${pageContext.request.contextPath}/images/kpm_logo.png"
					alt="KPM Logo" class="logo">
				<h2>TVPSS Management System</h2>
			</div>

			<h4 class="page-title">View Model Name > View Equipment
				Information</h4>

			<form action="${pageContext.request.contextPath}/admin/view"
				method="post" onsubmit="return confirmSubmit()">
				<div class="form-group">
					<input type="hidden" name="id" value="${equip.id}"> <label
						for="modelName">Model Name</label> <input type="text"
						name="modelName" value="${equip.modelName}" readonly>
				</div>
				<div class="form-group">
					<label for="typeModel">Type of Model</label> <input type="text"
						name="typeModel" value="${equip.typeModel}" readonly>
				</div>
				<div class="form-group">
					<label for="status">Status</label> <input type="text" name="status"
						pattern="[0-9]{10}" value="${equip.status}" readonly>
				</div>
				<div class="form-buttons">
					<button type="button" class="submit-btn"
						onclick="window.location.href='${pageContext.request.contextPath}/admin/manageequipinfo'">Back</button>
				</div>
			</form>

		</div>
	</div>
</body>
</html>
