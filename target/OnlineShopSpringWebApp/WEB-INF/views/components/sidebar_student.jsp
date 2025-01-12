
<div class="sidebar">
  <div class="profile">
      <img src="${pageContext.request.contextPath}/images/icon_student.png" alt="Profile Picture" class="profile-pic">
      <div class="profile-info">
          <h3>Student</h3>
          <p>zarif@moe-dl.edu.my</p> <!-- Fetching email dynamically -->
      </div>
  </div>
  <button class="logout-btn" onclick="window.location.href='${pageContext.request.contextPath}/logout'">Log Out</button>
  <hr>
  <ul class="nav">
      <li><a href="${pageContext.request.contextPath}/student/dashboard" class="<%= request.getRequestURI().endsWith("dashboard_student.jsp") ? "active" : "" %>">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/student/crew/apply">Crew Application</a></li>
      <li><a href="${pageContext.request.contextPath}/student/crew/viewAllApplications">View All Applications</a></li>
  </ul>
</div>
