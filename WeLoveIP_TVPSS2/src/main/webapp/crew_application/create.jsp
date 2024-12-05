<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Submit Crew Application</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/css/style_dashboard.css"
    />
    <style>
      .container {
        display: flex;
        flex-direction: row;
      }
      .form-container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      .form-group {
        margin-bottom: 15px;
      }

      .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
      }

      .form-group input,
      .form-group textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
      }

      .button-group {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
      }

      .button-group button {
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }

      .submit-btn {
        background-color: #4caf50;
        color: white;
      }

      .back-btn {
        background-color: #ddd;
        color: black;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <!-- Sidebar -->
      <div class="sidebar">
        <div class="profile">
          <img
            src="../assets/images/icon_student.png"
            alt="Profile Picture"
            class="profile-pic"
          />
          <div class="profile-info">
            <h3>Student</h3>
            <p>zarif@moe-dl.edu.my</p>
            <!-- Fetching email dynamically -->
          </div>
        </div>

        <button class="logout-btn" onclick="window.location.href='login.jsp'">
          Log Out
        </button>
        <hr />
        <ul class="nav">
          <li>
            <a href="../dashboard_student.jsp" class="active">Dashboard</a>
          </li>
          <li><a href="#">Crew Application</a></li>
          <li><a href="#">Application Result</a></li>
        </ul>
      </div>

      <!-- Main Content -->
      <div class="dashboard-content">
        <div class="header">
          <img
            src="../assets/images/kpm_logo.png"
            alt="KPM Logo"
            class="logo"
          />
          <h2>TVPSS Management System</h2>
        </div>

        <h2>Submit Crew Application</h2>
        <div class="form-container">
          <form action="list.jsp" method="post">
            <div class="form-group">
              <label for="studentName">Student Name</label>
              <input type="text" id="studentName" name="studentName" required />
            </div>
            <div class="form-group">
              <label for="icNumber">IC Number</label>
              <input type="text" id="icNumber" name="icNumber" required />
            </div>
            <div class="form-group">
              <label for="gender">Gender</label>
              <input type="text" id="gender" name="gender" required />
            </div>
            <div class="form-group">
              <label for="school">School</label>
              <input type="text" id="school" name="school" required />
            </div>
            <div class="form-group">
              <label for="phoneNo">Phone No</label>
              <input type="text" id="phoneNo" name="phoneNo" required />
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" id="email" name="email" required />
            </div>
            <div class="form-group">
              <label for="matrikNumber">Matrik Number</label>
              <input
                type="text"
                id="matrikNumber"
                name="matrikNumber"
                required
              />
            </div>
            <div class="form-group">
              <label for="youtubeLink">YouTube Link</label>
              <input type="url" id="youtubeLink" name="youtubeLink" required />
            </div>
            <div class="form-group">
              <label for="applicationReason">Application Reason</label>
              <textarea
                id="applicationReason"
                name="applicationReason"
                rows="4"
                required
              ></textarea>
            </div>
            <div class="button-group">
              <button type="submit" class="submit-btn">Submit</button>
              <button
                type="button"
                onclick="window.location.href='crew_application_teacher.jsp'"
                class="back-btn"
              >
                Back
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
