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
      <jsp:include page="../components/sidebar_teacher.jsp" />

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
                class="${application.isApproved ? 'status-approved' : application.isRejected ? 'status-rejected' : 'status-pending'}"
              >
                ${application.isApproved ? 'Approved' : application.isRejected ?
                'Rejected' : 'Pending'}
              </span>
            </p>
          </div>

          <!-- Approve and Reject buttons -->
          <div class="form-buttons">
            <form action="${pageContext.request.contextPath}/teacher/crew/approveApplication" method="post" style="display: inline;">
              <input type="hidden" name="id" value="${application.id}">
              <button type="submit" class="approve-btn" ${application.isApproved ? 'disabled' : ''}>
                  Approve
              </button>
          </form>
          <form action="${pageContext.request.contextPath}/teacher/crew/rejectApplication" method="post" style="display: inline;">
              <input type="hidden" name="id" value="${application.id}">
              <button type="submit" class="reject-btn" ${application.isRejected ? 'disabled' : ''}>
                  Reject
              </button>
          </form>
          <form action="${pageContext.request.contextPath}/teacher/crew/deleteApplication" method="post" style="display: inline;">
            <input type="hidden" name="id" value="${application.id}">
            <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this application?');">
                Delete
            </button>
        </form>
          </div>
        </c:if>
      </div>
    </div>
  </body>
</html>
