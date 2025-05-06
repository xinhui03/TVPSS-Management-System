<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<html>
<head>
<title>Teacher Manage Equipment Information</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style_manageuser.css">
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

			<!-- Search and Add Model -->
			<div class="search-bar">
				<input type="text" id="searchName" placeholder="Search model...">
				<button onclick="searchUser()">Search</button>
				<!-- Add Model Button -->
				<button class="add-user-btn"
					onclick="window.location.href='${pageContext.request.contextPath}/teacher/addEquip'">+
					Add Model</button>
			</div>

			<!-- User Table -->
			<table class="user-table">
				<thead>
					<tr>
						<th>Model</th>
						<th>Type of Model</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody id="userList">
					<c:forEach var="equip" items="${equipList}">
						<tr>
							<td>${equip.modelName}</td>
							<td>${equip.typeModel}</td>
							<td>${equip.status}</td>
							<td>
								<div class="table-action-buttons">
									<!-- Edit Form -->
									<form
										action="${pageContext.request.contextPath}/teacher/editEquip"
										method="get" style="display: inline;">
										<input type="hidden" name="id" value="${equip.id}">
										<button class="edit" type="submit">Edit</button>
									</form>

									<!-- Delete Form -->
									<form method="post"
										action="${pageContext.request.contextPath}/teacher/deleteEquip"
										style="display: inline;">
										<input type="hidden" name="id" value="${equip.id}">
										<button class="delete" button type="submit"
											onclick="return confirmDelete();">Delete</button>
									</form>
								</div>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>

	<script>
		function searchUser() {
			var input = document.getElementById("searchName").value
					.toLowerCase();
			var rows = document.querySelectorAll("#userList tr");

			rows.forEach(function(row) {
				var name = row.querySelector("td").textContent.toLowerCase();
				if (name.includes(input)) {
					row.style.display = "";
				} else {
					row.style.display = "none";
				}
			});
		}

		function confirmDelete() {
			var confirmation = confirm("Are you sure to remove this equipment information?");
			if (confirmation) {
				alert("This equipmment information has been successfully removed!");
				return true; // Proceed with form submission
			} else {
				return false; // Cancel form submission
			}
		}
	</script>
</body>
</html>