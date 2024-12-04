<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Manage School Information</title>
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
				<li><a href="dashboard_admin.jsp" class="active">Dashboard</a></li>
				<li><a href="school_info_teacher.jsp">School Information</a></li>
				<li><a href="#">School Version</a></li>
				<li><a href="#">Equipment Information</a></li>
				<li><a href="manage_user_admin.jsp">Manage User Information</a></li>
				<li><a href="crew_application_teacher.jsp" style="color: blue">Crew Application</a></li>
			</ul>
		</div>

		<!-- Main Content -->
		<div class="dashboard-content">
			<div class="header">
				<img src="assets/images/kpm_logo.png" alt="KPM Logo" class="logo">
				<h2>TVPSS Management System</h2>
			</div>

			<!-- User Table -->
			<h3>School Information</h3>
			<form id="schoolForm">
				<table class="user-table">
					<tr>
						<td><label for="schoolName">School Name:</label></td>
						<td><input type="text" id="schoolName" name="schoolName"
							placeholder="Insert school name" required></td>
					</tr>
					<tr>
						<td><label for="schoolAddress1">School Address I:</label></td>
						<td><input type="text" id="schoolAddress1"
							name="schoolAddress1" placeholder="Insert school address I"
							required></td>
					</tr>
					<tr>
						<td><label for="schoolAddress2">School Address II:</label></td>
						<td><input type="text" id="schoolAddress2"
							name="schoolAddress2" placeholder="Insert school address II"></td>
					</tr>
					<tr>
						<td><label for="postcode">Postcode:</label></td>
						<td><input type="text" id="postcode" name="postcode"
							placeholder="Postcode" required></td>
					</tr>
					<tr>
						<td><label for="state">State:</label></td>
						<td><select id="state" name="state" required>
								<option value="">Select a State</option>
								<option value="Johor">Johor</option>
								<option value="Kedah">Kedah</option>
								<option value="Kelantan">Kelantan</option>
						</select></td>
					</tr>
					<tr>
						<td><label for="phoneNo">Phone No:</label></td>
						<td><input type="text" id="phoneNo" name="phoneNo"
							placeholder="Insert phone no." required></td>
					</tr>
					<tr>
						<td><label for="email">Email:</label></td>
						<td><input type="email" id="email" name="email"
							placeholder="Insert email" required></td>
					</tr>
					<tr>
						<td><label for="faxNo">Fax No:</label></td>
						<td><input type="text" id="faxNo" name="faxNo"
							placeholder="Insert fax no."></td>
					</tr>
					<tr>
						<td><label for="schoolLogo">School Logo:</label></td>
						<td><input type="file" id="schoolLogo" name="schoolLogo"
							accept="image/*"></td>
					</tr>
					<tr>
						<td><label for="videoLink">Video Link:</label></td>
						<td><input type="url" id="videoLink" name="videoLink"
							placeholder="Upload YouTube channel link"></td>
					</tr>
				</table>
				<br>
				<!-- Buttons for Submit, Edit, and Save -->
				<button type="button" id="submitBtn" class="submit-btn">Submit</button>
				<button type="button" id="editBtn" class="edit-btn"
					style="display: none;">Edit</button>
				<button type="button" id="saveBtn" class="save-btn"
					style="display: none;">Save</button>
			</form>

			<script>
				// When the page loads, check if there's any saved data
				window.onload = function() {
					// If sessionStorage doesn't have any data, the form is empty
					if (!sessionStorage.getItem("schoolName")) {
						// Show the Submit button and hide Edit/Save buttons
						document.getElementById("submitBtn").style.display = "inline-block";
						document.getElementById("editBtn").style.display = "none";
						document.getElementById("saveBtn").style.display = "none";
					} else {
						// If data exists in sessionStorage, populate the form
						document.getElementById("schoolName").value = sessionStorage.getItem("schoolName");
						document.getElementById("schoolAddress1").value = sessionStorage.getItem("schoolAddress1");
						document.getElementById("schoolAddress2").value = sessionStorage.getItem("schoolAddress2");
						document.getElementById("postcode").value = sessionStorage.getItem("postcode");
						document.getElementById("state").value = sessionStorage.getItem("state");
						document.getElementById("phoneNo").value = sessionStorage.getItem("phoneNo");
						document.getElementById("email").value = sessionStorage.getItem("email");
						document.getElementById("faxNo").value = sessionStorage.getItem("faxNo");
						document.getElementById("videoLink").value = sessionStorage.getItem("videoLink");

						// Show Edit button and hide Submit button after submission
						document.getElementById("editBtn").style.display = "inline-block";
						document.getElementById("submitBtn").style.display = "none";
					}
				};

				// Handle Submit Button
				document.getElementById("submitBtn").addEventListener("click", function() {
					// Retrieve form data
					var schoolName = document.getElementById("schoolName").value;
					var schoolAddress1 = document.getElementById("schoolAddress1").value;
					var schoolAddress2 = document.getElementById("schoolAddress2").value;
					var postcode = document.getElementById("postcode").value;
					var state = document.getElementById("state").value;
					var phoneNo = document.getElementById("phoneNo").value;
					var email = document.getElementById("email").value;
					var faxNo = document.getElementById("faxNo").value;
					var videoLink = document.getElementById("videoLink").value;
					var schoolLogo = document.getElementById("schoolLogo").files[0]?.name || "No logo uploaded";

					// Store data in sessionStorage
					sessionStorage.setItem("schoolName", schoolName);
					sessionStorage.setItem("schoolAddress1", schoolAddress1);
					sessionStorage.setItem("schoolAddress2", schoolAddress2);
					sessionStorage.setItem("postcode", postcode);
					sessionStorage.setItem("state", state);
					sessionStorage.setItem("phoneNo", phoneNo);
					sessionStorage.setItem("email", email);
					sessionStorage.setItem("faxNo", faxNo);
					sessionStorage.setItem("videoLink", videoLink);
					sessionStorage.setItem("schoolLogo", schoolLogo);

					// Show Edit button and hide Submit button
					document.getElementById("editBtn").style.display = "inline-block";
					document.getElementById("submitBtn").style.display = "none";
				});

				// Handle Edit Button
				document.getElementById("editBtn").addEventListener("click", function() {
					// Enable the form fields for editing
					var formElements = document.querySelectorAll("#schoolForm input, #schoolForm select");
					formElements.forEach(function(element) {
						element.disabled = false;  // Enable fields
					});

					// Show Save button and hide Edit button
					document.getElementById("saveBtn").style.display = "inline-block";
					document.getElementById("editBtn").style.display = "none";
				});

				// Handle Save Button
				document.getElementById("saveBtn").addEventListener("click", function() {
					// Save the changes back to sessionStorage
					var schoolName = document.getElementById("schoolName").value;
					var schoolAddress1 = document.getElementById("schoolAddress1").value;
					var schoolAddress2 = document.getElementById("schoolAddress2").value;
					var postcode = document.getElementById("postcode").value;
					var state = document.getElementById("state").value;
					var phoneNo = document.getElementById("phoneNo").value;
					var email = document.getElementById("email").value;
					var faxNo = document.getElementById("faxNo").value;
					var videoLink = document.getElementById("videoLink").value;
					var schoolLogo = document.getElementById("schoolLogo").files[0]?.name || "No logo uploaded";

					// Store data back to sessionStorage
					sessionStorage.setItem("schoolName", schoolName);
					sessionStorage.setItem("schoolAddress1", schoolAddress1);
					sessionStorage.setItem("schoolAddress2", schoolAddress2);
					sessionStorage.setItem("postcode", postcode);
					sessionStorage.setItem("state", state);
					sessionStorage.setItem("phoneNo", phoneNo);
					sessionStorage.setItem("email", email);
					sessionStorage.setItem("faxNo", faxNo);
					sessionStorage.setItem("videoLink", videoLink);
					sessionStorage.setItem("schoolLogo", schoolLogo);

					// Disable the form fields after saving
					var formElements = document.querySelectorAll("#schoolForm input, #schoolForm select");
					formElements.forEach(function(element) {
						element.disabled = true;
					});

					// Show Edit button and hide Save button
					document.getElementById("editBtn").style.display = "inline-block";
					document.getElementById("saveBtn").style.display = "none";
				});
			</script>
		</div>
	</div>
</body>
</html>
