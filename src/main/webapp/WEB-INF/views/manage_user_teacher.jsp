<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Teacher Manage User Information</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_manageuser.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
       <jsp:include page="components/sidebar_teacher.jsp" />
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
                <!-- Add User Button -->
                <button class="add-user-btn" onclick="window.location.href='${pageContext.request.contextPath}/teacher/add'">+ Add User</button>
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
                <c:forEach var="student" items="${studentList}">
                    <tr>
                        <td>${student.fullName}</td>
                        <td>${student.email}</td>
                        <td>Student</td>
                        <td>
                            <div class="table-action-buttons">
                                <!-- Edit Form -->
                                    <form action="${pageContext.request.contextPath}/teacher/edit" method="get" style="display: inline;">
                                        <input type="hidden" name="id" value="${student.id}">
                                        <button class="edit" type="submit">Edit</button>
                                    </form>

                                    <!-- Delete Form -->
                                    <form method="post" action="${pageContext.request.contextPath}/teacher/delete" style="display: inline;">
                                        <input type="hidden" name="id" value="${student.id}">
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
