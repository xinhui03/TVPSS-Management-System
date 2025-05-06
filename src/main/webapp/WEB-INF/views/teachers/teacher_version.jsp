<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>School Version Information</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_dashboard.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/verify.css">
</head>
<body>
    <div class="container">
        <jsp:include page="../components/sidebar_teacher.jsp" />
        
        <div class="dashboard-content">
            <jsp:include page="../components/header.jsp" />
            <h2>School Version Information</h2>

            <div class="container1">
                <div class="school-info">
                    <p><strong>${school.name}</strong></p>
                    <p>Teacher-in-charge: ${teacher.name}</p>
                    <p>Current Version: ${version.versionLevel}</p>
                </div>
            
                <table>
                    <thead>
                        <tr>
                            <th>Requirements</th>
                            <th>Status</th>
                            <th>Attachments</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Logo</td>
                            <td><span class="${version.hasLogo ? 'completed' : 'pending'}">${version.hasLogo ? 'Completed' : 'Pending'}</span></td>
                            <td>
                                <label for="file-logo" class="upload-link">Upload</label>
                                <input type="file" id="file-logo" class="file-input" onchange="handleFileUpload(event, 'logo')">
                                <span id="file-name-logo"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>Corner/Mini Studio/TV Studio</td>
                            <td><span class="${version.hasStudio ? 'completed' : 'pending'}">${version.hasStudio ? 'Completed' : 'Pending'}</span></td>
                            <td>
                                <label for="file-studio" class="upload-link">Upload</label>
                                <input type="file" id="file-studio" class="file-input" onchange="handleFileUpload(event, 'studio')">
                                <span id="file-name-studio"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>In-School Recording</td>
                            <td><span class="${version.hasRecording ? 'completed' : 'pending'}">${version.hasRecording ? 'Completed' : 'Pending'}</span></td>
                            <td>
                                <label for="file-recording" class="upload-link">Upload</label>
                                <input type="file" id="file-recording" class="file-input" onchange="handleFileUpload(event, 'recording')">
                                <span id="file-name-recording"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>Upload on Youtube</td>
                            <td><span class="${version.hasYoutubeUpload ? 'completed' : 'pending'}">${version.hasYoutubeUpload ? 'Completed' : 'Pending'}</span></td>
                            <td>
                                <label for="file-youtube" class="upload-link">Upload</label>
                                <input type="file" id="file-youtube" class="file-input" onchange="handleFileUpload(event, 'youtube')">
                                <span id="file-name-youtube"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>Recording inside and outside the school</td>
                            <td><span class="${version.hasOutsideRecording ? 'completed' : 'pending'}">${version.hasOutsideRecording ? 'Completed' : 'Pending'}</span></td>
                            <td>
                                <label for="file-outside" class="upload-link">Upload</label>
                                <input type="file" id="file-outside" class="file-input" onchange="handleFileUpload(event, 'outside')">
                                <span id="file-name-outside"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>Collaborate with external agencies</td>
                            <td><span class="${version.hasCollaboration ? 'completed' : 'pending'}">${version.hasCollaboration ? 'Completed' : 'Pending'}</span></td>
                            <td>
                                <label for="file-collab" class="upload-link">Upload</label>
                                <input type="file" id="file-collab" class="file-input" onchange="handleFileUpload(event, 'collab')">
                                <span id="file-name-collab"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>Using "Green Screen" Technology</td>
                            <td><span class="${version.hasGreenScreen ? 'completed' : 'pending'}">${version.hasGreenScreen ? 'Completed' : 'Pending'}</span></td>
                            <td>
                                <label for="file-greenscreen" class="upload-link">Upload</label>
                                <input type="file" id="file-greenscreen" class="file-input" onchange="handleFileUpload(event, 'greenscreen')">
                                <span id="file-name-greenscreen"></span>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="button-container">
                    <button class="update-btn" onclick="submitRequirements()">Submit for Verification</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    function handleFileUpload(event, type) {
        const fileInput = event.target;
        const fileName = document.getElementById('file-name-' + type);
        
        if (fileInput.files.length > 0) {
            const file = fileInput.files[0];
            fileName.textContent = file.name;
            
            const formData = new FormData();
            formData.append('file', file);
            formData.append('type', type);
            formData.append('schoolId', '${school.id}');
            
            fetch('${pageContext.request.contextPath}/teacher/uploadRequirement', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('File uploaded successfully!');
                    // Update version level if returned
                    if (data.versionLevel) {
                        document.getElementById('versionLevel').textContent = data.versionLevel;
                    }
                } 
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
    }

    function submitRequirements() {
        const confirmed = confirm("Are you sure you want to submit these requirements for verification?");
        if (confirmed) {
            // Add your form submission logic here
            window.location.href = "${pageContext.request.contextPath}/teacher/dashboard";
        }
    }
    </script>
</body>
</html>

