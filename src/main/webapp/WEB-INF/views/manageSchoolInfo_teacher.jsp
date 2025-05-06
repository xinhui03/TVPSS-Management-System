<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<html>
<head>
<title>Teacher Manage School Information</title>
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

			<!-- User Table -->
			<h3>School Information</h3>
			<form action="manageschoolinfo" method="post" onsubmit="return confirmSubmit();">
				<table class="user-table">
					<thead>
						<tr>
							<td><label for="schoolName">School Name:</label></td>
							<td><input type="text" id="schoolName" name="schoolName"
								placeholder="Insert school name" required></td>
						</tr>
						<tr>
							<td><label for="addressI">School Address I:</label></td>
							<td><input type="text" id="addressI" name="addressI"
								placeholder="Insert school address I" required></td>
						</tr>
						<tr>
							<td><label for="addressII">School Address II:</label></td>
							<td><input type="text" id="addressII" name="addressII"
								placeholder="Insert school address II"></td>
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
					</thead>

					<div class="table-action-buttons">
						<!-- Submit Form -->
						<button id="submitBtn" type="submit" class="submit" 
							onclick="window.location.href='${pageContext.request.contextPath}/teacher/viewSchoolInfo'">Submit</button>
						</form>
					</div>
				</table>
			</form>
		</div>
	</div>
<script>
        function confirmSubmit() {
            var confirmation = confirm("Are you sure to add this school information?");
            if (confirmation) {
                alert("This information has been successfully added!");
                return true; // Proceed with form submission
            } else {
                return false; // Cancel form submission
            }
        }
    </script>

</body>
</html>