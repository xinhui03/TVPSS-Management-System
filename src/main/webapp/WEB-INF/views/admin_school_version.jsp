<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin School Version Details</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_manageuser.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .requirement-row {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .file-link {
            margin-left: 20px;
            color: blue;
            text-decoration: underline;
            cursor: pointer;
        }
        .verification-checkbox {
            margin-right: 10px;
        }
        .status-label {
            margin-left: 10px;
            padding: 5px 10px;
            border-radius: 3px;
        }
        .status-verified {
            background-color: #4CAF50;
            color: white;
        }
        .status-pending {
            background-color: #ff9800;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile">
                <img src="${pageContext.request.contextPath}/images/icon_admin.png" alt="Profile Picture" class="profile-pic">
                <div class="profile-info">
                    <h3>Admin</h3>
                    <p>ali@admintvpss.com</p>
                </div>
            </div>

            <button class="logout-btn" onclick="window.location.href='${pageContext.request.contextPath}/logout'">Log Out</button>
            <hr>
            <ul class="nav">
                <li><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/schools" class="active">School Version</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="dashboard-content">
            <div class="header">
                <img src="${pageContext.request.contextPath}/images/kpm_logo.png" alt="KPM Logo" class="logo">
                <h2>TVPSS Management System</h2>
            </div>

            <div class="school-details">
                <h3>School: ${teacher.schoolName}</h3>
                <p>Version: ${version.versionNumber}</p>
            </div>

            <div class="requirements-container">
                <c:forEach items="${requirements}" var="req">
                    <div class="requirement-row">
                        <input type="checkbox" 
                               id="${req.key}Checkbox"
                               class="verification-checkbox"
                               ${version[req.key.concat('Verified')] ? 'checked' : ''}
                               onchange="updateVerification('${req.key}', this.checked)" />
                        <label for="${req.key}Checkbox">${req.key}</label>
                        
                        <c:if test="${not empty req.value}">
                            <a class="file-link" 
                               href="${pageContext.request.contextPath}/admin/school/view?id=${version.id}&field=${req.key}"
                               target="_blank"
                               onclick="return validateFileView(this, '${req.key}');">
                                View ${req.key} file
                            </a>
                        </c:if>
                        
                        <span class="status-label ${version[req.key.concat('Verified')] ? 'status-verified' : 'status-pending'}">
                            ${version[req.key.concat('Verified')] ? 'Verified' : 'Pending'}
                        </span>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <script>
    function updateVerification(field, checked) {
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/school/verify',
            type: 'POST',
            data: {
                id: "${version.id}",
                field: field,
                checked: checked
            },
            success: function(response) {
                if (response.success) {
                    const statusLabel = $(`#${field}Checkbox`).siblings('.status-label');
                    statusLabel.text(checked ? 'Verified' : 'Pending');
                    statusLabel.toggleClass('status-verified status-pending');
                } else {
                    alert('Error updating verification');
                    $(`#${field}Checkbox`).prop('checked', !checked);
                }
            },
            error: function() {
                alert('Error updating verification');
                $(`#${field}Checkbox`).prop('checked', !checked);
            }
        });
    }

    function validateFileView(link, field) {
        try {
            window.open(link.href, '_blank');
            return false; // Prevents the original link from opening in the same window
        } catch (e) {
            console.error('Error opening file:', e);
            alert('Error opening file. Please try again.');
            return false;
        }
    }
    </script>
</body>
</html>
