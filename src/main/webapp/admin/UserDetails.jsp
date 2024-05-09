<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Details</title>
    <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
    </style>
</head>
<body>
    <h1>All User Details</h1>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Actions</th> <!-- Add column for actions -->
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.firstName}</td>
                    <td>${user.email}</td>
                    <td>
                        <form action="ViewAppointmentsServlet" method="GET"> <!-- Form to submit to UserAppointmentDetails.jsp -->
                            <input type="hidden" name="userId" value="${user.id}"> <!-- Pass user id to UserAppointmentDetails.jsp -->
                            <input type="submit" value="View"> <!-- View button to submit the form -->
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
