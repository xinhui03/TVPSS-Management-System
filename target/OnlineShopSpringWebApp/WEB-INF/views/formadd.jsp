<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Customer</title>
</head>
<body>
    <h2>Add a New Customer</h2>
    <form action="add" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br>
        <label for="contactNum">Contact Number:</label>
        <input type="text" id="contactNum" name="contactNum" required><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <button type="submit">Add Customer</button>
    </form>
</body>
</html>
