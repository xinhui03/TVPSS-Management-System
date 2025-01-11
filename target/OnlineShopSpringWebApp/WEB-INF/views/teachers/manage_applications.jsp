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
        <jsp:include page="../components/sidebar.jsp" />

        <!-- Main Content -->
        <div class="dashboard-content">
            <jsp:include page="../components/header.jsp" />

            <!-- Search and Filter Section -->
            <div class="controls-container">
                <div class="search-filter">
                    <input type="text" id="searchInput" placeholder="Search by name...">
                    <select id="statusFilter">
                        <option value="all">All Status</option>
                        <option value="pending">Pending</option>
                        <option value="approved">Approved</option>
                        <option value="rejected">Rejected</option>
                    </select>
                    <button onclick="applyFilters()">Apply Filters</button>
                </div>
            </div>

            <!-- Applications Table -->
            <div class="table-container">
                <table class="applications-table">
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>School</th>
                            <th>Status</th>
                            <th>Application Reason</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="applicationsList">
                        <c:forEach var="application" items="${applications}">
                            <tr>
                                <td>${application.studentName}</td>
                                <td>${application.school}</td>
                                <td>
                                    <span class="status-badge ${application.isApproved ? 'approved' : application.isRejected ? 'rejected' : 'pending'}">
                                        ${application.isApproved ? 'Approved' : application.isRejected ? 'Rejected' : 'Pending'}
                                    </span>
                                </td>
                                <td>${application.applicationReason}</td>
                                <td class="actions">
                                  <button onclick="viewDetails('${application.id}')" class="view-btn">View</button>
                                  <form action="${pageContext.request.contextPath}/teacher/crew/approveApplication" method="post" style="display: inline;">
                                      <input type="hidden" name="id" value="${application.id}">
                                      <button type="submit" class="approve-btn" ${application.isApproved || application.isRejected ? 'disabled' : ''}>
                                          Approve
                                      </button>
                                  </form>
                                  <form action="${pageContext.request.contextPath}/teacher/crew/rejectApplication" method="post" style="display: inline;">
                                      <input type="hidden" name="id" value="${application.id}">
                                      <button type="submit" class="reject-btn" ${application.isApproved || application.isRejected ? 'disabled' : ''}>
                                          Reject
                                      </button>
                                  </form>
                              </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <button onclick="previousPage()" ${currentPage == 1 ? 'disabled' : ''}>Previous</button>
                <span>Page ${currentPage} of ${totalPages}</span>
                <button onclick="nextPage()" ${currentPage == totalPages ? 'disabled' : ''}>Next</button>
            </div>
        </div>
    </div>

    <script>
     function applyFilters() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const statusFilter = document.getElementById('statusFilter').value;
    const rows = document.querySelectorAll('#applicationsList tr');

    rows.forEach(row => {
        const name = row.cells[0].textContent.toLowerCase();
        const statusElement = row.querySelector('.status-badge');
        const status = statusElement.textContent.toLowerCase();
        
        const matchesSearch = name.includes(searchTerm);
        const matchesStatus = statusFilter === 'all' || status === statusFilter.toLowerCase();
        
        row.style.display = matchesSearch && matchesStatus ? '' : 'none';
    });
}

function viewDetails(id) {
    window.location.href = '${pageContext.request.contextPath}/teacher/crew/viewApplication?id=' + id;
}


    </script>
</body>
</html>