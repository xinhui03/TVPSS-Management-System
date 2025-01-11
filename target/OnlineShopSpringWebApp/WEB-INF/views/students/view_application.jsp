<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>
<html>
  <head>
    <title>View Application</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/style_dashboard.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/style_view_application.css"
    />
  </head>
  <body>
    <div class="container">
      <!-- Sidebar -->
      <jsp:include page="../components/sidebar.jsp" />

      <!-- Main Content -->
      <div class="dashboard-content">
        <jsp:include page="../components/header.jsp" />
        <h2>Application Details</h2>

        <c:if test="${not empty errorMessage}">
          <p class="error-message">${errorMessage}</p>
        </c:if>

        <c:if test="${not empty application}">
          <div class="application-details">
            <p><strong>Student Name:</strong> ${application.studentName}</p>
            <p><strong>IC Number:</strong> ${application.icNumber}</p>
            <p><strong>Gender:</strong> ${application.gender}</p>
            <p><strong>Matric Number:</strong> ${application.matricNumber}</p>
            <p><strong>School:</strong> ${application.school}</p>
            <p><strong>Phone No:</strong> ${application.phoneNo}</p>
            <p><strong>Email:</strong> ${application.email}</p>
            <p>
              <strong>YouTube Link:</strong>
              <a href="${application.youtubeLink}" target="_blank"
                >${application.youtubeLink}</a
              >
            </p>
            <p>
              <strong>Application Reason:</strong>
              ${application.applicationReason}
            </p>
            <p>
              <strong>Status:</strong>
              <span
                class="${application.isApproved != null && application.isApproved ? 'status-approved' : 'status-pending'}"
              >
                ${application.isApproved != null && application.isApproved ?
                'Approved' : 'Pending'}
              </span>
            </p>
          </div>
        </c:if>
      </div>
    </div>
  </body>
</html>
