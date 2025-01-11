<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>
<html>
  <head>
    <title>Submit Crew Application</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/style_dashboard.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/style_apply_crew.css"
    />
  </head>
  <body>
    <div class="container">
      <!-- Sidebar -->
      <jsp:include page="../components/sidebar.jsp" />

      <!-- Main Content -->
      <div class="dashboard-content">
        <jsp:include page="../components/header.jsp" />
        <h2>Submit Crew Application</h2>
        <c:if test="${not empty errorMessage}">
          <p class="error-message">${errorMessage}</p>
        </c:if>
        <form
          action="${pageContext.request.contextPath}/student/crew/submit"
          method="post"
          onsubmit="return confirmSubmit()"
        >
          <div class="form-group">
            <label for="studentName">Student Name:</label>
            <input type="text" id="studentName" name="studentName" required />
          </div>

          <div class="form-group">
            <label for="icNumber">IC Number:</label>
            <input type="text" id="icNumber" name="icNumber" required />
          </div>

          <div class="form-group">
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
              <option value="Male">Male</option>
              <option value="Female">Female</option>
            </select>
          </div>

          <div class="form-group">
            <label for="matricNumber">Matric Number:</label>
            <input type="text" id="matricNumber" name="matricNumber" required />
          </div>

          <div class="form-group">
            <label for="school">School:</label>
            <input type="text" id="school" name="school" required />
          </div>

          <div class="form-group">
            <label for="phoneNo">Phone No:</label>
            <input type="text" id="phoneNo" name="phoneNo" required />
          </div>

          <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required />
          </div>

          <div class="form-group">
            <label for="youtubeLink">YouTube Link:</label>
            <input type="url" id="youtubeLink" name="youtubeLink" />
          </div>

          <div class="form-group">
            <label for="applicationReason">Application Reason:</label>
            <textarea
              id="applicationReason"
              name="applicationReason"
              required
            ></textarea>
          </div>

          <div class="form-buttons">
            <button type="submit">Submit Application</button>
          </div>
        </form>
      </div>
    </div>
    <script>
      function confirmSubmit() {
        var confirmation = confirm(
          "Are you sure to add this user information?"
        );
        if (confirmation) {
          alert("This information has been successfully added!");
          return true; // Proceed with form submission
        } else {
          return false; // Cancel form submission
        }
      }
    </script>
  </body>
</html>
