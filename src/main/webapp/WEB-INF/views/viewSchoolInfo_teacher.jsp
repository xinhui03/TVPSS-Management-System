<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Teacher View School Info</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_edit_user.css">
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

			<h4 class="page-title">Manage School Information > View School
				Information Information</h4>

		<form action="${pageContext.request.contextPath}/teacher/update" method="post" onsubmit="return confirmSubmit()">
		    <div class="form-group">
		        <label for="schoolName">School Name</label>
		        <input type="text" name="schoolName" value="${school.schoolName}" readonly>
		    </div>
		    <div class="form-group">
		        <label for="addressI">Address I</label>
		        <input type="text" name="addressI" value="${school.addressI}" readonly>
		    </div>
		    <div class="form-group">
		        <label for="addressII">Address II</label>
		        <input type="text" name="addressII" value="${school.addressII}" readonly>
		    </div>
		    <div class="form-group">
		        <label for="phoneNo">Phone No</label>
		        <input type="text" name="phoneNo" value="${school.phoneNo}" readonly>
		    </div>
		    <div class="form-group">
		        <label for="email">Email</label>
		        <input type="email" name="email" value="${school.email}" readonly>
		    </div>
		    <div class="form-group">
		        <label for="postcode">Postcode</label>
		        <input type="text" name="postcode" value="${school.postcode}" readonly>
		    </div>
		    <div class="form-group">
		        <label for="state">State</label>
		        <input type="text" name="state" value="${school.state}" readonly>
		    </div>
		    <div class="form-group">
		        <label for="faxNo">Fax No</label>
		        <input type="text" name="faxNo" value="${school.faxNo}" readonly>
		    </div>
		    <div class="form-group">
		        <label for="schoolLogo">School Logo</label>
		        <div class="logo-container">
		            <c:if test="${school.schoolLogo != null}">
		                <img src="${pageContext.request.contextPath}/uploads/${school.schoolLogo}" alt="School Logo" style="max-width: 150px; height: auto;">
		            </c:if>
		            <c:if test="${school.schoolLogo == null}">
		                <p>No logo uploaded.</p>
		            </c:if>
		        </div>
		    </div>
		    <div class="form-group">
		        <label for="videoLink">Video Link</label>
		        <div class="video-container">
		            <c:if test="${school.videoLink != null}">
		                <input type="text" name="videoLink" value="${school.videoLink}" readonly>
		            </c:if>
		            <c:if test="${school.videoLink == null}">
		                <p>No video link provided.</p>
		            </c:if>
		        </div>
		    </div>
		    <div class="form-buttons">
		    <button type="button" class="submit-btn" onclick="window.location.href='${pageContext.request.contextPath}/teacher/editSchoolInfo?id=${school.id}'">Edit</button>
		    </div>
		</form>
		</div>
	</div>
</body>
</html>