<!DOCTYPE html>
<html>
<head>
    <title>Teacher Manage User Information</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style_manageuser.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile">
                <img src="assets/images/icon_teacher.png" alt="Profile Picture" class="profile-pic">
                <div class="profile-info">
                    <h3>Teacher</h3>
                    <p>hairulsmkmr@gov.my</p> <!-- Fetching email dynamically -->
                </div>
            </div>
            
            <button class="logout-btn" onclick="window.location.href='login.jsp'">Log Out</button>
            <hr>

            
            <ul class="nav">
    <li><a href="dashboard_teacher.jsp" class="<%= request.getRequestURI().endsWith("dashboard_teacher.jsp") ? "active" : "" %>">Dashboard</a></li>
    <li><a href="#" class="<%= request.getRequestURI().endsWith("school_info_teacher.jsp") ? "active" : "" %>">School Information</a></li>
    <li><a href="#" class="<%= request.getRequestURI().endsWith("school_version_teacher.jsp") ? "active" : "" %>">School Version</a></li>
    <li><a href="#" class="<%= request.getRequestURI().endsWith("equipment_info_teacher.jsp") ? "active" : "" %>">Equipment Information</a></li>
    <li><a href="manage_user_teacher.jsp" class="<%= request.getRequestURI().endsWith("manage_user_teacher.jsp") ? "active" : "" %>">Manage User Information</a></li>
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
                <button class="add-user-btn" onclick="window.location.href='add_user_teacher.jsp'">+ Add User</button>
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
                    <tr>
                        <td>Zarif Bin Hakim</td>
                        <td>zarif@moe-dl.edu.my</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                <form action="edit_user_teacher.jsp" method="get" style="display: inline;" id="editFormZarif">
                                    <input type="hidden" name="id" value="1">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_teacher" method="post" style="display: inline;" onsubmit="return confirmDelete()">
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
                                <form action="edit_user_teacher.jsp" method="get" style="display: inline;" id="editFormZarif">
                                    <input type="hidden" name="id" value="1">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_teacher" method="post" style="display: inline;" onsubmit="return confirmDelete()">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="1">
                                    <button class="delete" type="submit">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>Ahmed Bin Ahmad</td>
                        <td>ahmed@moe-dl.edu.my</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                <form action="edit_user_teacher.jsp" method="get" style="display: inline;" id="editFormZarif">
                                    <input type="hidden" name="id" value="1">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_teacher" method="post" style="display: inline;" onsubmit="return confirmDelete()">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="1">
                                    <button class="delete" type="submit">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>See Hui Xin</td>
                        <td>seehx@moe-dl.edu.my</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                <form action="edit_user_teacher.jsp" method="get" style="display: inline;" id="editFormZarif">
                                    <input type="hidden" name="id" value="1">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_teacher" method="post" style="display: inline;" onsubmit="return confirmDelete()">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="1">
                                    <button class="delete" type="submit">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Rashid Bin Rahmi</td>
                        <td>rashid@moe-dl.edu.my</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                <form action="edit_user_teacher.jsp" method="get" style="display: inline;" id="editFormZarif">
                                    <input type="hidden" name="id" value="1">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_teacher" method="post" style="display: inline;" onsubmit="return confirmDelete()">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="1">
                                    <button class="delete" type="submit">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>Dina Binti Abu</td>
                        <td>dina@moe-dl.edu.my</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                <form action="edit_user_teacher.jsp" method="get" style="display: inline;" id="editFormZarif">
                                    <input type="hidden" name="id" value="1">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_teacher" method="post" style="display: inline;" onsubmit="return confirmDelete()">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="1">
                                    <button class="delete" type="submit">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
  
                    <tr>
                        <td>Chang Yun Ling</td>
                        <td>changyl@moe-dl.edu.my</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                <form action="edit_user_teacher.jsp" method="get" style="display: inline;" id="editFormZarif">
                                    <input type="hidden" name="id" value="1">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_teacher" method="post" style="display: inline;" onsubmit="return confirmDelete()">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="1">
                                    <button class="delete" type="submit">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>Aisyah Binti Aimi</td>
                        <td>aisyah@moe-dl.edu.my</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                <form action="edit_user_teacher.jsp" method="get" style="display: inline;" id="editFormZarif">
                                    <input type="hidden" name="id" value="1">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_teacher" method="post" style="display: inline;" onsubmit="return confirmDelete()">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="1">
                                    <button class="delete" type="submit">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    
 
                    <tr>
                        <td>Zairul Bin Hadi</td>
                        <td>zairul@moe-dl.edu.my</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                <form action="edit_user_teacher.jsp" method="get" style="display: inline;" id="editFormZarif">
                                    <input type="hidden" name="id" value="1">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_teacher" method="post" style="display: inline;" onsubmit="return confirmDelete()">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="1">
                                    <button class="delete" type="submit">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>Khairul Bin Zadim</td>
                        <td>khairul@moe-dl.edu.my</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                <form action="edit_user_teacher.jsp" method="get" style="display: inline;" id="editFormZarif">
                                    <input type="hidden" name="id" value="1">
                                    <button class="edit" type="submit">Edit</button>
                                </form>
                                <!-- Delete Form -->
                                <form action="ManageUser_teacher" method="post" style="display: inline;" onsubmit="return confirmDelete()">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="1">
                                    <button class="delete" type="submit">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    

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
            // Display confirmation popup
            var confirmation = confirm("Are you sure you want to remove this user information?");
            if (confirmation) {
                // If confirmed, display success message
                alert("This information has been successfully removed!");
                // Return false to prevent actual form submission (no deletion)
                return false;
            } else {
                // If not confirmed, do not submit the form
                return false;
            }
        }
    </script>
</body>
</html>
