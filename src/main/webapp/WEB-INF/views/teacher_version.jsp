<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Manage Applications</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_dashboard.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_manage_applications.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <jsp:include page="../components/sidebar_teacher.jsp" />

        <!-- Main Content -->
        <div class="dashboard-content">
            <jsp:include page="../components/header.jsp" />
            <h1>School Version Information</h1>
            <div class="school-info container">
                <h2>SMK Mutiara Bangsa</h2>
                <p>Teacher In-Charge</p>
                <p>Version :</p>
                <div class="version-table">
                    <table>
                        <tr>
                            <th>Requirements</th>
                            <th>Attachments</th>
                      
                        </tr>
                    </table>
                </div>
            </div>
        </div>
</body>
</html>
