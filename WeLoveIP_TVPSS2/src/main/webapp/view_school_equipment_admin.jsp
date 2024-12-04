<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Equipment" %>

<!DOCTYPE html>
<html>
<head>
    <title>School Equipment</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style_manageuser.css">
</head>
<body>
    <div class="container">
        <div class="dashboard-content">
            <div class="header">
                <img src="assets/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>School Equipment Information</h2>
            </div>
            <h3>Equipment List for ${school.name}</h3>
            <table>
                <thead>
                    <tr>
                        <th>Model</th>
                        <th>Type of Model</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Equipment> equipmentList = (List<Equipment>) request.getAttribute("equipmentList");
                        if (equipmentList != null) {
                            for (Equipment equipment : equipmentList) {
                    %>
                    <tr>
                        <td><%= equipment.getModel() %></td>
                        <td><%= equipment.getType() %></td>
                        <td><%= equipment.getStatus() %></td>
                        <td>
                            <span class="<%= equipment.getStatus().equals("Work") ? "status-work" : "status-damage" %>">
                                <%= equipment.getStatus() %>
                            </span>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
            <button onclick="window.history.back()" class="back-btn">Back</button>
        </div>
    </div>
</body>
</html>