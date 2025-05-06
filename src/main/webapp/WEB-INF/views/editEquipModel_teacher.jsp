<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Teacher Edit User</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style_edit_user.css">
</head>
<body>
	<div class="container">
		<!-- Sidebar -->
		       <jsp:include page="components/sidebar_teacher.jsp" />

		<!-- Main Content -->
		<div class="dashboard-content">
			<div class="header">
				<img src="${pageContext.request.contextPath}/images/kpm_logo.png"
					alt="KPM Logo" class="logo">
				<h2>TVPSS Management System</h2>
			</div>

			<h4 class="page-title">Manage Equipment Information > Edit
				Equipment</h4>

			<form action="${pageContext.request.contextPath}/teacher/updateEquip"
				method="post" onsubmit="return confirmSubmit()">
				<div class="form-group">
					<input type="hidden" name="id" value="${equip.id}"> <label
						for="modelName">Model Name</label> <input type="text"
						name="modelName" value="${equip.modelName}" required>
				</div>
				<div class="form-group">
					<label for="typeModel">Type of Model</label> <select id="typeModel"
						name="typeModel" required>
						<option value="">Select Type</option>
						<option value="Camera"
							${equip.typeModel == 'Camera' ? 'selected' : ''}>Camera</option>
						<option value="Lighting"
							${equip.typeModel == 'Lighting' ? 'selected' : ''}>Lighting</option>
						<option value="Microphone"
							${equip.typeModel == 'Microphone' ? 'selected' : ''}>Microphone</option>
					</select>
				</div>

				<div class="form-group">
					<label for="status">Status</label> <select name="status" required>
						<option value="">Select Status</option>
						<option value="Work" ${equip.status == 'Work' ? 'selected' : ''}>Work</option>
						<option value="Damage"
							${equip.status == 'Damage' ? 'selected' : ''}>Damage</option>
					</select>
				</div>

				<div class="form-buttons">
					<button type="submit" class="cancel-btn">Save</button>
					<button type="button" class="submit-btn"
						onclick="window.location.href='${pageContext.request.contextPath}/teacher/manageequipinfo'">Cancel</button>
				</div>
			</form>
			<script>
				function confirmSubmit() {
					var confirmation = confirm("Are you sure to update this equipment?");
					if (confirmation) {
						alert("This equipment information has been successfully updated!");
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