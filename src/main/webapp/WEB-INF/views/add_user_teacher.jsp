<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Teacher Add User</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_add_user.css">
</head>
<body>
    <form action="add" method="post" onsubmit="return confirmSubmit();">
        <div class="container">
            <!-- Sidebar -->
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
                    <li>
                        <a href="${pageContext.request.contextPath}/teacher/dashboard" class="<%= request.getRequestURI().endsWith("dashboard_teacher.jsp") ? "active" : "" %>">
                            Dashboard
                        </a>
                    </li>
                    <li><a href="#">School Information</a></li>
                    <li><a href="#">School Version</a></li>
                    <li><a href="#">Equipment Information</a></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/teacher/manageuser" 
   class="${pageContext.request.requestURI.endsWith('/teacher/manageuser') ? 'active' : ''}">
   Manage User Information
</a>

                    </li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="dashboard-content">
                <div class="header">
                    <img src="${pageContext.request.contextPath}/images/kpm_logo.png" alt="KPM Logo" class="logo">
                    <h2>TVPSS Management System</h2>
                </div>
                <h4 class="page-title">Manage User Information > Add User</h4>

                <!-- Form Fields -->
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" placeholder="Insert student's full name" required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Insert student's email" required>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" placeholder="Insert student's address" required>
                </div>

                <div class="form-group">
                    <label for="contact">Contact Number</label>
                    <input type="text" id="contact" name="contact" placeholder="Insert student's contact" required>
                </div>

                <div class="form-group">
                    <label for="parentcontact">Contact Number</label>
                    <input type="text" id="parentcontact" name="parentcontact" placeholder="Insert parent's contact" required>
                </div>

                <div class="form-group">
                    <label for="studentid">Student ID</label>
                    <input type="text" id="studentid" name="studentid" placeholder="Insert student's ID" required>
                </div>
                
                 <div class="form-group">
                    <label for="grade">Class</label>
                    <input type="text" id="grade" name="grade" placeholder="Insert student's grade" required>
                </div>

                <div class="form-buttons">
                    <button type="button" class="cancel-btn" onclick="history.back()">Cancel</button>
                    <button type="submit" class="submit-btn">Submit</button>
                </div>
            </div>
        </div>
    </form>

    <!-- JavaScript -->
    <script>
        function confirmSubmit() {
            var confirmation = confirm("Are you sure to add this user information?");
            if (confirmation) {
                alert("This information has been successfully added!");
                return true; // Proceed with form submission
            } else {
                return false; // Cancel form submission
            }
        }
    </script>
</body>
</html>
