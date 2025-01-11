<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Customer Added</title>
</head>
<body>
    <h2>Customer Added Successfully</h2>
    <p>Name: ${customer.name}</p>
    <p>Address: ${customer.address}</p>
    <p>Contact Number: ${customer.contactNum}</p>
    <p>Email: ${customer.email}</p>
</body>
</html>
