<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Teacher Dashboard</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/css/style_dashboard.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <style>
      /* Search Container */
      .search-container {
        margin: 20px 0;
        display: flex;
        gap: 10px;
      }

      #searchInput {
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        width: 300px;
      }

      .search-btn {
        padding: 8px 16px;
        background-color: #4caf50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }

      /* Table Styles */
      .table-container {
        margin-top: 20px;
        overflow-x: auto;
      }

      table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
      }

      th,
      td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
      }

      th {
        background-color: #f4f4f4;
        font-weight: bold;
      }

      /* Status Badges */
      .status-badge {
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 14px;
      }

      .approved {
        background-color: #e6ffe6;
        color: #008000;
      }

      .rejected {
        background-color: #ffe6e6;
        color: #ff0000;
      }

      /* Action Buttons */
      .action-buttons {
        display: flex;
        gap: 8px;
      }

      .icon-btn {
        padding: 6px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }

      .edit-btn {
        background-color: #ffc107;
      }

      .delete-btn {
        background-color: #dc3545;
        color: white;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <!-- Sidebar -->
      <div class="sidebar">
        <div class="profile">
          <img
            src="../assets/images/icon_teacher.png"
            alt="Profile Picture"
            class="profile-pic"
          />
          <div class="profile-info">
            <h3>Teacher</h3>
            <p>hairulsmkmr@gov.my</p>
          </div>
        </div>

        <button
          class="logout-btn"
          onclick="window.location.href='../login.jsp'"
        >
          Log Out
        </button>
        <hr />
        <ul class="nav">
          <li><a href="../dashboard_teacher.jsp">Dashboard</a></li>
          <li><a href="../school_information.jsp">School Information</a></li>
          <li><a href="../school_version.jsp">School Version</a></li>
          <li>
            <a href="../equipment_information.jsp">Equipment Information</a>
          </li>
          <li>
            <a href="../manage_user_teacher.jsp">Manage User Information</a>
          </li>
          <li>
            <a href="list.jsp" style="color: blue">Crew Application</a>
          </li>
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
        <div class="purple-box">
          <h3>Crew Applications</h3>

          <!-- Search Bar -->
          <div class="search-container">
            <input type="text" id="searchInput" placeholder="Search..." />
            <button type="button" class="search-btn">Search</button>
          </div>

          <!-- Applications Table -->
          <div class="table-container">
            <table>
              <thead>
                <tr>
                  <th>Student</th>
                  <th>Reason</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>John Doe</td>
                  <td>Want to join TVPSS crew</td>
                  <td>
                    <span class="status-badge approved">Approved</span>
                  </td>
                  <td class="action-buttons">
                    <button class="icon-btn edit-btn">
                      <i class="fas fa-edit"></i>
                    </button>
                    <button class="icon-btn delete-btn">
                      <i class="fas fa-trash"></i>
                    </button>
                  </td>
                </tr>
                <tr>
                  <td>Jane Smith</td>
                  <td>Interested in technical work</td>
                  <td>
                    <span class="status-badge rejected">Rejected</span>
                  </td>
                  <td class="action-buttons"></td>
                  <td class="action-buttons">
                    <button
                      class="icon-btn edit-btn"
                      onclick="window.location.href='edit.jsp?id=${application.id}'"
                    >
                      <i class="fas fa-edit"></i>
                    </button>
                    <button class="icon-btn delete-btn">
                      <i class="fas fa-trash"></i>
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>