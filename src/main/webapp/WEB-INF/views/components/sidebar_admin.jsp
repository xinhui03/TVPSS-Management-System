<div class="sidebar">
    <div class="profile">
<img src="${pageContext.request.contextPath}/images/icon_admin.png" alt="Profile Picture" class="profile-pic">
        <div class="profile-info">
            <h3>Admin</h3>
            <p>ali@admintvpss.com</p> <!-- Fetching email dynamically -->
        </div>
    </div>
    
<button class="logout-btn" onclick="window.location.href='${pageContext.request.contextPath}/logout'">Log Out</button>
    <hr>
    <ul class="nav">
        <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="<%= request.getRequestURI().endsWith("dashboard_admin.jsp") ? "active" : "" %>">Dashboard</a></li>
<li><a href="#" class="<%= request.getRequestURI().endsWith("school_info_admin.jsp") ? "active" : "" %>">School Information</a></li>
<li><a href="${pageContext.request.contextPath}/admin/versionList" class="<%= request.getRequestURI().endsWith("admin/admin_version_list.jsp") ? "active" : "" %>">School Version</a></li>
<li><a href="#" class="<%= request.getRequestURI().endsWith("equipment_info_admin.jsp") ? "active" : "" %>">Equipment Information</a></li>
<li><a href="${pageContext.request.contextPath}/admin/manageuser" class="<%= request.getRequestURI().endsWith("manage_user_admin.jsp") ? "active" : "" %>">Manage User Information</a></li>
</ul>
</div>