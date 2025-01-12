<div class="sidebar">
    <div class="profile">
<img src="${pageContext.request.contextPath}/images/icon_teacher.png" alt="Profile Picture" class="profile-pic">
        <div class="profile-info">
            <h3>Teacher</h3>
            <p>hairulsmkmr@gov.my</p> <!-- Fetching email dynamically -->
        </div>
    </div>
    
<button class="logout-btn" onclick="window.location.href='${pageContext.request.contextPath}/logout'">Log Out</button>
    <hr>
    <ul class="nav">
        <li><a href="${pageContext.request.contextPath}/teacher/dashboard" class="<%= request.getRequestURI().endsWith("dashboard_teacher.jsp") ? "active" : "" %>">Dashboard</a></li>
        <li><a href="#" class="<%= request.getRequestURI().endsWith("school_info_teacher.jsp") ? "active" : "" %>">School Information</a></li>
        <li><a href="#" class="<%= request.getRequestURI().endsWith("school_version_teacher.jsp") ? "active" : "" %>">School Version</a></li>
        <li><a href="#" class="<%= request.getRequestURI().endsWith("equipment_info_teacher.jsp") ? "active" : "" %>">Equipment Information</a></li>
        <li><a href="${pageContext.request.contextPath}/teacher/manageuser" class="<%= request.getRequestURI().endsWith("manage_user_teacher.jsp") ? "active" : "" %>">Manage User Information</a></li>
        <li><a href="${pageContext.request.contextPath}/teacher/crew/manageApplications" class="<%= request.getRequestURI().endsWith("teachers/manage_applications.jsp") ? "active" : "" %>">Manage Crew Applications</a></li>
    </ul>
</div>
