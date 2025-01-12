<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin View School Version</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_manageuser.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile">
                <img src="${pageContext.request.contextPath}/images/icon_admin.png" alt="Profile Picture" class="profile-pic">
                <div class="profile-info">
                    <h3>Admin</h3>
                    <p>ali@admintvpss.com</p>
                </div>
            </div>

            <button class="logout-btn" onclick="window.location.href='${pageContext.request.contextPath}/logout'">Log Out</button>
            <hr>
            <ul class="nav">
                <li><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/schools" class="active">School Version</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="dashboard-content">
            <div class="header">
                <img src="${pageContext.request.contextPath}/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>TVPSS Management System</h2>
            </div>

            <!-- School Table -->
            <table class="user-table">
                <thead>
                    <tr>
                        <th>School Code</th>
                        <th>School Name</th>
                        <th>State</th>
                        <th>Version</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${schoolList}" var="school">
                        <tr>
                            <td>${school.code}</td>
                            <td>${school.name}</td>
                            <td>${school.state}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/school/version/${school.id}" 
                                   class="btn btn-primary">View Version</a>
                            </td>
                            <td>
                                <span class="status ${school.status == 'Updated' ? 'updated' : 'pending'}">
                                    ${school.status}
                                </span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/school/details?id=${school.id}">
                                    <button class="view-btn">View</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
