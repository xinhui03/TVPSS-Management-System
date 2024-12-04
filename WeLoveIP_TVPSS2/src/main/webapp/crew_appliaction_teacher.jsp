<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Management</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KyZXEJv+M7tQXxg7eP8Olr+jq+7gZaL34rZGvKwEfbkFdXwbgVRz4zNVsO1F6EOJ"
      crossorigin="anonymous"
    />
    <style>
      body {
        font-family: "Arial", sans-serif;
        background-color: #f4f7fc;
        margin: 0;
        padding: 0;
      }
      .container {
        max-width: 1200px;
        margin-top: 50px;
      }
      .search-bar {
        margin-bottom: 20px;
      }
      table {
        margin-top: 30px;
      }
      .table th,
      .table td {
        vertical-align: middle;
      }
      .btn-action {
        margin: 5px;
      }
      .btn-edit {
        background-color: #17a2b8;
        color: white;
      }
      .btn-delete {
        background-color: #dc3545;
        color: white;
      }
      .btn-action:hover {
        opacity: 0.8;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h2 class="text-center">Student Management</h2>

      <!-- Search Bar -->
      <div class="row search-bar">
        <div class="col-md-8">
          <input
            type="text"
            class="form-control"
            placeholder="Search by student name..."
            id="search-input"
          />
        </div>
        <div class="col-md-4">
          <button class="btn btn-primary w-100" id="search-btn">Search</button>
        </div>
      </div>

      <!-- Student Table -->
      <table class="table table-striped table-bordered table-hover">
        <thead>
          <tr>
            <th>Student</th>
            <th>Reason</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <!-- Example Row -->
          <tr>
            <td>John Doe</td>
            <td>Absent</td>
            <td><span class="badge bg-warning text-dark">Pending</span></td>
            <td>
              <button class="btn btn-edit btn-action">Edit</button>
              <button class="btn btn-delete btn-action">Delete</button>
            </td>
          </tr>
          <tr>
            <td>Jane Smith</td>
            <td>Late</td>
            <td><span class="badge bg-success">Approved</span></td>
            <td>
              <button class="btn btn-edit btn-action">Edit</button>
              <button class="btn btn-delete btn-action">Delete</button>
            </td>
          </tr>
          <tr>
            <td>Michael Johnson</td>
            <td>Absent</td>
            <td><span class="badge bg-danger">Denied</span></td>
            <td>
              <button class="btn btn-edit btn-action">Edit</button>
              <button class="btn btn-delete btn-action">Delete</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Bootstrap JS (optional for dynamic behavior) -->
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
      integrity="sha384-oBqDVmMz4fnFO9gybfe5BfBBdX1lrG3r6zFzYjR6iF6b6ZYJt3pVxh9bM6f3P4pb"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
      integrity="sha384-pzjw8f+ua7Kw1TIq0peO2d8dH4gw8v4syk2uN1O0x7I3h56j6cHaPYmP3y4f4Kh7"
      crossorigin="anonymous"
    ></script>

    <script>
      document
        .getElementById("search-btn")
        .addEventListener("click", function () {
          let query = document
            .getElementById("search-input")
            .value.toLowerCase();
          let rows = document.querySelectorAll("tbody tr");
          rows.forEach(function (row) {
            let studentName = row.querySelector("td").innerText.toLowerCase();
            if (studentName.includes(query)) {
              row.style.display = "";
            } else {
              row.style.display = "none";
            }
          });
        });
    </script>
  </body>
</html>
