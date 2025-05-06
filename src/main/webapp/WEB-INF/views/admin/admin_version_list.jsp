<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Version List</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_dashboard.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/verify.css">
</head>
<body>
    <div class="container">
        <jsp:include page="../components/sidebar_admin.jsp" />
        
        <div class="dashboard-content">
            <jsp:include page="../components/header.jsp" />
            
            <div class="verify-container">
                <div class="verify-box">
                    <h2>School Version List</h2>
                    
                    <div class="verify-content">
                        <table class="verify-table">
                            <thead>
                                <tr>
                                    <th>School ID</th>
                                    <th>Version Level</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${versions}" var="version">
                                    <tr>
                                        <td>${version.schoolId}</td>
                                        <td>${version.versionLevel}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${version.versionLevel == 0}">
                                                    <span class="verify-status pending">Not Started</span>
                                                </c:when>
                                                <c:when test="${version.versionLevel == 1}">
                                                    <span class="verify-status in-progress">Basic</span>
                                                </c:when>
                                                <c:when test="${version.versionLevel == 2}">
                                                    <span class="verify-status in-progress">Intermediate</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="verify-status approved">Advanced</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/admin/verify/${version.schoolId}" 
                                               class="verify-button">View Details</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>