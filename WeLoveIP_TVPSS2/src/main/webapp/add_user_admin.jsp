<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
</head>
<body>
    <h1>Add New User</h1>

    <!-- Error Message -->
    <c:if test="${not empty error}">
        <div style="color: red;">
            ${error}
        </div>
    </c:if>

    <form action="ManageUser_admin" method="post">
        <input type="hidden" name="action" value="add">
        
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <br><br>

        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value="">Select Role</option>
            <option value="Admin">Admin</option>
            <option value="Teacher">Teacher</option>
            <option value="Student">Student</option>
        </select>
        <br><br>

        <button type="submit">Add User</button>
    </form>
    <br>
    <a href="manage_user_admin.jsp">Back to Manage Users</a>
</body>
</html>
