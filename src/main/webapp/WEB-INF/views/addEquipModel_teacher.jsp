<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>Teacher Add User</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style_add_user.css">
</head>
<body>
	<form action="addEquip" method="post"
		onsubmit="return confirmSubmit();">
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
				<h4 class="page-title">Manage Equipment Information > Add Model</h4>

				<!-- Form Fields -->
				<div class="form-group">
					<label for="modelName">Model Name</label> <input type="text"
						id="modelName" name="modelName"
						placeholder="Insert equipment model" required>
				</div>

				<div class="form-group">
					<label for="typeModel">Type of Model</label> <select id="typeModel"
						name="typeModel" required>
						<option value="">Select Type</option>
						<option value="Camera">Camera</option>
						<option value="Lighting">Lighting</option>
						<option value="Microphone">Microphone</option>
					</select>
				</div>

				<div class="form-group">
					<label for="status">Status</label> <select id="status"
						name="status" required>
						<option value="">Select Status</option>
						<option value="Work">Work</option>
						<option value="Damage">Damage</option>
					</select>
				</div>

				<div class="form-buttons">
					<button type="submit" class="submit-btn">Submit</button>
					<button type="button" class="cancel-btn" onclick="history.back()">Cancel</button>
				</div>
			</div>
		</div>
	</form>

	<!-- JavaScript -->
	<script>
		function confirmSubmit() {
			var confirmation = confirm("Are you sure to add this model equipment?");
			if (confirmation) {
				alert("This model has been successfully added!");
				return true; // Proceed with form submission
			} else {
				return false; // Cancel form submission
			}
		}
	</script>
</body>
</html>