<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>
<html>
  <head>
    <title>View Applications</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/style_dashboard.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/style_view_all_applications.css"
    />
  </head>
  <body>
    <div class="container">
      <!-- Sidebar -->
      <jsp:include page="../components/sidebar_student.jsp" />

      <!-- Main Content -->
      <div class="dashboard-content">
        <jsp:include page="../components/header.jsp" />
        <h2>My Applications</h2>

        <div class="applications-list">
          <c:if test="${empty applications}">
            <p>No applications found.</p>
          </c:if>

          <c:forEach items="${applications}" var="app">
            <div class="application-card">
              <h3>${app.studentName}</h3>
              <p><strong>School:</strong> ${app.school}</p>
              <p>
                <strong>Status:</strong>
                <span
                  class="${app.isApproved ? 'status-approved' : app.isRejected ? 'status-rejected' : 'status-pending'}"
                >
                  ${app.isApproved ? 'Approved' : app.isRejected ? 'Rejected' :
                  'Pending'}
                </span>
              </p>
              <div class="card-actions">
                <a
                  href="${pageContext.request.contextPath}/student/crew/viewApplication?id=${app.id}"
                  class="view-btn"
                  >View Details</a
                >
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </body>
</html>
