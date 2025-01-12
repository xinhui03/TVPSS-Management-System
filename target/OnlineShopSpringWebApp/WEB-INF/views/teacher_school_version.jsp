<!DOCTYPE html>
<html>
<head>
    <title>Teacher Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_dashboard.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile">
                <img src="${pageContext.request.contextPath}/images/icon_teacher.png" alt="Profile Picture" class="profile-pic">
                <div class="profile-info">
                    <h3>Teacher</h3>
                    <p>${teacher.email}</p>
                </div>
            </div>
            <button class="logout-btn" onclick="window.location.href='${pageContext.request.contextPath}/logout'">Log Out</button>
            <hr>
            <ul class="nav">
                <li>
                    <a href="${pageContext.request.contextPath}/teacher/dashboard" 
                       class="${pageContext.request.servletPath == '/teacher/dashboard' ? 'active' : ''}">
                        Dashboard
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/teacher/school_info"
                       class="${pageContext.request.servletPath == '/teacher/school_info' ? 'active' : ''}">
                        School Information
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/teacher/school_version"
                       class="${pageContext.request.servletPath == '/teacher/school_version' ? 'active' : ''}">
                        School Version
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/teacher/equipment_info"
                       class="${pageContext.request.servletPath == '/teacher/equipment_info' ? 'active' : ''}">
                        Equipment Information
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/teacher/manageuser"
                       class="${pageContext.request.servletPath == '/teacher/manageuser' ? 'active' : ''}">
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
            <div class="container1">
                <!-- School Information -->
                <div class="school-info">
                    <h2>School Version Information</h2>
                    <p><strong>${school.name}</strong></p>
                    <p>Teacher-in-charge: <span>${school.teacherInCharge}</span></p>
                    <p>Current Version: <span>${school.version}</span></p>
                </div>

                <!-- Table -->
                <table>
                    <thead>
                        <tr>
                            <th>Requirements</th>
                            <th>Attachments</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requirements}" var="requirement" varStatus="status">
                            <tr>
                                <td>${requirement.name}</td>
                                <td>
                                    <label for="file-${status.index}" class="attachment-icon">🔗</label>
                                    <input type="file" id="file-${status.index}" class="file-input" 
                                           onchange="handleFileUpload(event)">
                                    <span id="file-name-${status.index}"></span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Update Button -->
                <div class="button-container">
                    <button class="update-btn" onclick="confirmUpdate()">Update</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function confirmUpdate() {
            const userConfirmed = confirm("Are you sure you want to update?");
            if (userConfirmed) {
                window.location.href = '${pageContext.request.contextPath}/teacher/dashboard';
            }
        }

        function handleFileUpload(event) {
            const fileInput = event.target;
            const fileNameSpan = document.getElementById(`file-name-${fileInput.id.split('-')[1]}`);

            if (fileInput.files.length > 0) {
                fileNameSpan.textContent = fileInput.files[0].name;
            } else {
                fileNameSpan.textContent = "No file selected";
            }
        }
    </script>
</body>
</html>
   