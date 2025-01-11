<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Crew Application</title>
</head>
<body>
    <h2>Submit Crew Application</h2>
    <form action="${pageContext.request.contextPath}/crew/submit" method="post">
        <label for="studentName">Student Name:</label>
        <input type="text" id="studentName" name="studentName" required><br>

        <label for="icNumber">IC Number:</label>
        <input type="text" id="icNumber" name="icNumber" required><br>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select><br>

        <label for="matricNumber">Matric Number:</label>
        <input type="text" id="matricNumber" name="matricNumber" required><br>

        <label for="school">School:</label>
        <input type="text" id="school" name="school" required><br>

        <label for="phoneNo">Phone No:</label>
        <input type="text" id="phoneNo" name="phoneNo" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="youtubeLink">YouTube Link:</label>
        <input type="url" id="youtubeLink" name="youtubeLink"><br>

        <label for="applicationReason">Application Reason:</label>
        <textarea id="applicationReason" name="applicationReason" required></textarea><br>

        <button type="submit">Submit Application</button>
    </form>
</body>
</html> 