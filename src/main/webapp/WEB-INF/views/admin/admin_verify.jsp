<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Manage Applications</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_dashboard.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/verify.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <jsp:include page="../components/sidebar_admin.jsp" />

        <!-- Main Content -->
        <div class="dashboard-content">
            <jsp:include page="../components/header.jsp" />
 
    <div class="container1">
    <!-- School Information -->
    <div class="school-info">
        <h2>School Version Information</h2>
        <p><strong>SMK Mutiara Rini</strong></p>
        <p>Teacher-in-charge: Pn. Ismafatuladzwa Binti Ismail</p>
        <p>Current Version: 1</p>
    </div>

    <!-- Table -->
    <table>
        <thead>
            <tr>
                <th>Requirements</th>
                <th>Upload</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Logo</td>
                <td><button class="upload-btn" onclick="uploadFile('logo')">Upload</button></td>
                <td><input type="checkbox" ${version.hasLogo ? 'checked' : ''} onchange="updateRequirement('hasLogo', this.checked)"></td>
            </tr>
            <tr>
                <td>Studio</td>
                <td><button class="upload-btn" onclick="uploadFile('studio')">Upload</button></td>
                <td><input type="checkbox" ${version.hasStudio ? 'checked' : ''} onchange="updateRequirement('hasStudio', this.checked)"></td>
            </tr>
            <tr>
                <td>Recording</td>
                <td><button class="upload-btn" onclick="uploadFile('recording')">Upload</button></td>
                <td><input type="checkbox" ${version.hasRecording ? 'checked' : ''} onchange="updateRequirement('hasRecording', this.checked)"></td>
            </tr>
            <tr>
                <td>Youtube Upload</td>
                <td><button class="upload-btn" onclick="uploadFile('youtube')">Upload</button></td>
                <td><input type="checkbox" ${version.hasYoutubeUpload ? 'checked' : ''} onchange="updateRequirement('hasYoutubeUpload', this.checked)"></td>
            </tr>
            <tr>
                <td>Outside Recording</td>
                <td><button class="upload-btn" onclick="uploadFile('outside')">Upload</button></td>
                <td><input type="checkbox" ${version.hasOutsideRecording ? 'checked' : ''} onchange="updateRequirement('hasOutsideRecording', this.checked)"></td>
            </tr>
            <tr>
                <td>Collaboration</td>
                <td><button class="upload-btn" onclick="uploadFile('collab')">Upload</button></td>
                <td><input type="checkbox" ${version.hasCollaboration ? 'checked' : ''} onchange="updateRequirement('hasCollaboration', this.checked)"></td>
            </tr>
            <tr>
                <td>Green Screen</td>
                <td><button class="upload-btn" onclick="uploadFile('green')">Upload</button></td>
                <td><input type="checkbox" ${version.hasGreenScreen ? 'checked' : ''} onchange="updateRequirement('hasGreenScreen', this.checked)"></td>
            </tr>
        </tbody>
    </table>

    <!-- Update Button -->
    <div class ="button-container">
    	<button class="update-btn" onclick = "confirmUpdate()">Update</button>
    </div>
    
</div>

            </div>
        </div>

<script>
    function confirmUpdate() {
        if (confirm("Are you sure you want to update?")) {
            window.location.href = "${pageContext.request.contextPath}/admin/versionList";
        }
    }
    
    
    
    function updateMessage() {
        const requirements = {
            logo: document.querySelector('td[data-requirement="logo"] ~ td input').checked,
            studio: document.querySelector('td[data-requirement="studio"] ~ td input').checked,
            recording: document.querySelector('td[data-requirement="recording"] ~ td input').checked,
            upload: document.querySelector('td[data-requirement="upload"] ~ td input').checked,
            outsideRecording: document.querySelector('td[data-requirement="outside-recording"] ~ td input').checked,
            collaboration: document.querySelector('td[data-requirement="collaboration"] ~ td input').checked,
        };

        const message = document.getElementById('message');

        // Check specific requirements and update the message
        if (requirements.logo && requirements.logo && requirements.studio) {
            message.textContent = "Current school have reached Version 1!";
            message.style.color = "green";
            
            if (requirements.studio && requirements.recording) {
                message.textContent = "Current school have reached Version 2";
                message.style.color = "blue";
        } else if (requirements.studio && requirements.collaboration) {
            message.textContent = "Current school have reached Version 2";
            message.style.color = "blue";
        } else if (requirements.outsideRecording) {
            message.textContent = "Current school have reached Version 3";
            message.style.color = "orange";
        } else {
            message.textContent = "Requirements are incomplete.";
            message.style.color = "red";
        }
    }

    // Initial call to update the message
    updateMessage();

    // Add event listeners to all checkboxes
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', updateMessage);
    });
    
}

function updateRequirement(field, value) {
    var schoolId = "${version.schoolId}";
    const formData = new FormData();
    formData.append('schoolId', schoolId);
    formData.append(field, value);
    
    fetch('${pageContext.request.contextPath}/admin/verify/update', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (response.ok) {
            console.log('Requirement updated successfully');
        } else {
            console.error('Update failed');
        }
    })
    .catch(error => console.error('Error:', error));
}

</script>

<form action="${pageContext.request.contextPath}/admin/updateVersion" method="post">
    <input type="hidden" name="schoolId" value="${schoolId}">
    <!-- Replace your existing checkboxes with named inputs -->
    <input type="checkbox" name="hasLogo" ${version.hasLogo ? 'checked' : ''}>
    <!-- Add similar checkboxes for other requirements -->
    <button type="submit">Update</button>
</form>

</body>
</html>