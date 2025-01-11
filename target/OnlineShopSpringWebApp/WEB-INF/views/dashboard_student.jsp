<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Student Dashboard</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/style_dashboard.css"
    />
  </head>
  <body>
    <div class="container">
      <!-- Sidebar -->
      <jsp:include page="components/sidebar.jsp" />

      <!-- Main Content -->
      <div class="dashboard-content">
        <jsp:include page="components/header.jsp" />
        <div class="purple-box">
          <h3>Dashboard</h3>
          <div class="poster-container">
            <img
              src="${pageContext.request.contextPath}/images/poster1.jpg"
              alt="Poster 1"
            />
            <img
              src="${pageContext.request.contextPath}/images/poster2.jpg"
              alt="Poster 1"
            />
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
