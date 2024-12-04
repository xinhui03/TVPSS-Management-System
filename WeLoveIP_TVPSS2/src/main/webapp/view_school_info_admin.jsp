<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>School Information</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style_manageuser.css">
</head>
<body>
    <div class="container">
        <div class="dashboard-content">
            <div class="header">
                <img src="assets/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>School Information</h2>
            </div>
            <div class="school-info-card">
                <h3>School Details</h3>
                <table>
                    <tr>
                        <th>Name:</th>
                        <td>${school.name}</td>
                    </tr>
                    <tr>
                        <th>Address:</th>
                        <td>${school.address}</td>
                    </tr>
                    <tr>
                        <th>Postcode:</th>
                        <td>${school.postcode}</td>
                    </tr>
                    <tr>
                        <th>Phone:</th>
                        <td>${school.phone}</td>
                    </tr>
                    <tr>
                        <th>Email:</th>
                        <td>${school.email}</td>
                    </tr>
                </table>
            </div>
            <button onclick="window.history.back()" class="back-btn">Back</button>
        </div>
    </div>
</body>
</html>