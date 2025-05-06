<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Admin View School Info</title>
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

			<h4 class="page-title">Manage School Information > View School
				Information Information</h4>

			<form
				action="${pageContext.request.contextPath}/admin/viewSchoolInfo"
				method="post" onsubmit="return confirmSubmit()">
				<div class="form-group">
					<input type="hidden" name="id" value="${school.id}"> <label
						for="schoolName">School Name</label> <input type="text"
						name="schoolName" value="${school.schoolName}" readonly>
				</div>
				<div class="form-group">
					<label for="addressI">Address I</label> <input type="text"
						name="addressI" value="${school.addressI}" readonly>
				</div>
				<div class="form-group">
					<label for="addressII">Address II</label> <input type="text"
						name="addressII" value="${school.addressII}" readonly>
				</div>
				<div class="form-group">
					<label for="phoneNo">Phone No</label> <input type="text"
						name="phoneNo" value="${school.phoneNo}" readonly>
				</div>
				<div class="form-group">
					<label for="email">Email</label> <input type="text" name="email"
						value="${school.email}" readonly>
				</div>
				<div class="form-group">
					<label for="postcode">Postcode</label> <input type="text" name="postcode"
						value="${school.postcode}" readonly>
				</div>
				<div class="form-group">
					<label for="state">State</label> <input type="text" name="state"
						value="${school.state}" readonly>
				</div>
				<div class="form-group">
					<label for="faxNo">Fax No</label> <input type="text" name="faxNo"
						value="${school.faxNo}" readonly>
				</div>
				<div class="form-group">
					<label for="schoolLogo">School Logo</label> <input type="text" name="schoolLogo"
						value="${school.schoolLogo}" readonly>
				</div>
				<div class="form-group">
					<label for="videoLink">Video Link</label> <input type="text" name="videoLink"
						value="${school.videoLink}" readonly>
				</div>
				<div class="form-buttons">
					<button type="button" class="submit-btn"
						onclick="window.location.href='${pageContext.request.contextPath}/admin/manageschoolinfo'">Back</button>
				</div>
			</form>

		</div>
	</div>
</body>
</html>