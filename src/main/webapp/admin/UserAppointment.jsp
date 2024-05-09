<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment Details</title>
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
    <h1>Appointment Details</h1>

    <%-- Fetch appointment details based on the user ID passed from the previous page --%>


    <%@ page import="java.util.List"%>
    <%@ page import="com.db.DBConnect"%>
    <%@ page import="com.virtusa.entity.Appointment"%>
    <%@ page import="com.virtusa.dao.AppointmentDao"%>

    <%-- Get the user ID from the request parameter --%>


    <% String userId = request.getParameter("userId"); %>


    <%-- Display appointment details --%>
    <table border="1">
        <thead>
            <tr>
                <th>Appointment ID</th>
                <th>Patient Name</th>
                <th>Date</th>
                <th>Slot</th>
                <th>Doctor Name</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% for (Appointment appointment : (List<Appointment>) request.getAttribute("appointments")) { %>
                <tr>
                    <td><%= appointment.getAppointmentId() %></td>
                    <td><%= appointment.getUsername() %></td>
                    <td><%= appointment.getAppointmentDate() %></td>
                    <td><%= appointment.getSlot() %></td>
                    <td><%= appointment.getDoctorName() %></td>
                    <td><%= appointment.getStatus() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
