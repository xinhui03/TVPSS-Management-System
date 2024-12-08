<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin View School Version</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style_manageuser.css">
    
    </style>

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
                <li><a href="#">School Information</a></li>
                <li><a href="#">School Version</a></li>
                <li><a href="#">Equipment Information</a></li>
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
                        <th>School Code</th>
                        <th>School Name</th>
                        <th>State</th>
                        <th>Version</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>SM1001</td>
                        <td>SMK Mutiara Rini</td>
                        <td>Johor</td>
                        <td>1</td>
                        <td><span class="status updated">Updated</span></td>
                        <td><button class="view-btn" onclick ="window.location.href='verify_admin.jsp'">View</button></td>
                    </tr>
                    <tr>
                        <td>SM2002</td>
                        <td>SMK Green Road</td>
                        <td>Sarawak</td>
                        <td>3</td>
                        <td><span class="status updated">Updated</span></td>
                        <td><button class="view-btn">View</button></td>
                    </tr>
                    <tr>
                        <td>SM9006</td>
                        <td>SMK Sri Bintang</td>
                        <td>Selangor</td>
                        <td>2</td>
                        <td><span class="status pending">Pending</span></td>
                        <td><button class="view-btn">View</button></td>
                    </tr>
                </tbody>
            </table>

            <div class="pagination">
                <span>Showing data 1 to 8 of 100 entries</span>
                <div class="pagination-controls">
                    <button class="page-btn">1</button>
                    <button class="page-btn">2</button>
                    <button class="page-btn">3</button>
                </div>
            </div>
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




