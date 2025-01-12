<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>View Application</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/style_view_application.css"
    />
  </head>
  <body>
    <div class="container">
      <h2>Application Details</h2>
      <div>
        <p><strong>Student Name:</strong> ${application.studentName}</p>
        <p><strong>IC Number:</strong> ${application.icNumber}</p>
        <p><strong>Gender:</strong> ${application.gender}</p>
        <p><strong>Matric Number:</strong> ${application.matricNumber}</p>
        <p><strong>School:</strong> ${application.school}</p>
        <p><strong>Phone No:</strong> ${application.phoneNo}</p>
        <p><strong>Email:</strong> ${application.email}</p>
        <p>
          <strong>YouTube Link:</strong>
          <a href="${application.youtubeLink}">${application.youtubeLink}</a>
        </p>
        <p>
          <strong>Application Reason:</strong> ${application.applicationReason}
        </p>
      </div>
      <div class="form-buttons">
        <form
          action="${pageContext.request.contextPath}/teacher/approveApplication"
          method="post"
          style="display: inline"
        >
          <input type="hidden" name="id" value="${application.id}" />
          <button type="submit">Approve</button>
        </form>
        <form
          action="${pageContext.request.contextPath}/teacher/deleteApplication"
          method="post"
          style="display: inline"
        >
          <input type="hidden" name="id" value="${application.id}" />
          <button
            type="submit"
            onclick="return confirm('Are you sure you want to delete this application?');"
          >
            Delete
          </button>
        </form>
      </div>
    </div>
  </body>
</html>
