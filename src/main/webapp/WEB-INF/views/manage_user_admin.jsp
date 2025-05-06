<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Admin Manage User Information</title>
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
                <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="<%= request.getRequestURI().endsWith("dashboard_admin.jsp") ? "active" : "" %>">Dashboard</a></li>
                <li><a href="#" class="<%= request.getRequestURI().endsWith("school_info_admin.jsp") ? "active" : "" %>">School Information</a></li>
                <li><a href="#" class="<%= request.getRequestURI().endsWith("school_version_admin.jsp") ? "active" : "" %>">School Version</a></li>
                <li><a href="#" class="<%= request.getRequestURI().endsWith("equipment_info_admin.jsp") ? "active" : "" %>">Equipment Information</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/manageuser" class="<%= request.getRequestURI().endsWith("manage_user_admin.jsp") ? "active" : "" %>">Manage User Information</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="dashboard-content">
            <div class="header">
                <img src="${pageContext.request.contextPath}/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>TVPSS Management System</h2>
            </div>

            <!-- Search and Add User -->
            <div class="search-bar">
                <input type="text" id="searchName" placeholder="Search by name...">
                <button onclick="searchUser()">Search</button>
                <button class="add-user-btn" onclick="window.location.href='${pageContext.request.contextPath}/admin/add'">+ Add User</button>
            </div>

            <!-- User Table -->
            <table class="user-table">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>State</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="userList">
                    <c:forEach var="teacher" items="${teacherList}">
                        <tr>
                            <td>${teacher.fullName}</td>
                            <td>${teacher.email}</td>
                            <td>${teacher.state}</td>
                            <td>Teacher</td>
                            <td>
                                <div class="table-action-buttons">
                                    <!-- Edit Form -->
                                    <form action="${pageContext.request.contextPath}/admin/edit" method="get" style="display: inline;">
                                        <input type="hidden" name="id" value="${teacher.id}">
                                        <button class="edit" type="submit">Edit</button>
                                    </form>

                                    <!-- Delete Form -->
                                    <form method="post" action="${pageContext.request.contextPath}/admin/delete" style="display: inline;">
                                        <input type="hidden" name="id" value="${teacher.id}">
                                        <button class="delete" button type="submit" onclick="return confirmDelete();">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function searchUser() {
            var input = document.getElementById("searchName").value.toLowerCase();
            var rows = document.querySelectorAll("#userList tr");

            rows.forEach(function(row) {
                var name = row.querySelector("td").textContent.toLowerCase();
                if (name.includes(input)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }

        function confirmDelete() {
            var confirmation = confirm("Are you sure to remove this user information?");
            if (confirmation) {
                alert("This information has been successfully removed!");
                return true; // Proceed with form submission
            } else {
                return false; // Cancel form submission
            }
        }
    </script>
</body>
</html>
