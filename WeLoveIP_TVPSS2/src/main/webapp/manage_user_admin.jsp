<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Manage User Information</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style_manageuser.css">

</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile">
                <img src="assets/images/icon_admin.png" alt="Profile Picture" class="profile-pic">
                <div class="profile-info">
                    <h3>Admin</h3>
                    <p>ali@admintvpss.com</p> <!-- Fetching email dynamically -->
                </div>
            </div>
            
            <button class="logout-btn" onclick="window.location.href='login.jsp'">Log Out</button>
            <hr>
            <ul class="nav">
                <li><a href="dashboard_admin.jsp" class="active">Dashboard</a></li>
                <li><a href="school_info_admin.jsp">School Information</a></li>
                <li><a href="view_version_Admin.jsp">School Version</a></li>
                <li><a href="school_equipment_admin.jsp">Equipment Information</a></li>
                <li><a href="manage_user_admin.jsp">Manage User Information</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="dashboard-content">
            <div class="header">
                <img src="assets/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>TVPSS Management System</h2>
            </div>

            <!-- Search and Add User -->
            <div class="search-bar">
                <input type="text" id="searchName" placeholder="Search by name...">
                <button onclick="searchUser()">Search</button>
                <!-- Add User Button -->
                <button class="add-user-btn" onclick="window.location.href='add_user_admin.jsp'">+ Add User</button>
            </div>

            <!-- User Table -->
            <table class="user-table">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="userList">
                    <!-- Example row, dynamically generated by JS -->
                    <tr>
                        <td>Zarif Bin Hakim</td>
                        <td>zarif@moe-dl.edu.my</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                <form action="ManageUser_admin" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="id" value="1">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_admin" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="1">
                                    <button class="delete" type="submit">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Saleh Bin Ahmad</td>
                        <td>saleh@moe-dl.edu.my</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                <form action="ManageUser_admin" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="id" value="2">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_admin" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="2">
                                    <button class="delete" type="submit">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <!-- More rows can be dynamically added here -->
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
    </script>
</body>

</html>